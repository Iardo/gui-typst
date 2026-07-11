import ctypes
import os
import sys
import time

from ctypes import wintypes

class PDF_Helper:
    @staticmethod
    def open_file_and_wait_to_close(path):
        if sys.platform == 'win32':
            proc_id, proc_hd = Win.open_file(path)
        
            print(proc_id, proc_hd, path)
            if proc_hd and proc_id:
                ctypes.windll.kernel32.CloseHandle(proc_hd)
                print(f'Process {proc_id} is running')

                return Win.wait_to_close(path)
        
        

class Win:
    SEE_MASK_NOCLOSEPROCESS = 0x00000040
    SW_SHOWNORMAL = 1

    CCH_RM_SESSION_KEY = 32
    ERROR_MORE_DATA = 234
    RM_MAX_APP_NAME = 255
    RM_MAX_SVC_NAME = 63

    ctypes.windll.kernel32.CloseHandle.argtypes = [wintypes.HANDLE]
    ctypes.windll.kernel32.CloseHandle.restype = wintypes.BOOL
    ctypes.windll.kernel32.GetProcessId.argtypes = [wintypes.HANDLE]
    ctypes.windll.kernel32.GetProcessId.restype = wintypes.DWORD

    class SHELLEXECUTEINFO(ctypes.Structure):
        # NOTE: Order matches the Win32 SHELLEXECUTEINFOW layout exactly
        #       this defines the actual memory layout ShellExecuteExW reads,
        #       so it must not be reordered or every field ends up at the wrong offset.
        _fields_ = [
            ('cbSize', wintypes.DWORD),
            ('fMask', ctypes.c_ulong),
            ('hwnd', wintypes.HWND),
            ('lpVerb', wintypes.LPCWSTR),
            ('lpFile', wintypes.LPCWSTR),
            ('lpParameters', wintypes.LPCWSTR),
            ('lpDirectory', wintypes.LPCWSTR),
            ('nShow', ctypes.c_int),
            ('hInstApp', wintypes.HINSTANCE),
            ('lpIDList', ctypes.c_void_p),
            ('lpClass', wintypes.LPCWSTR),
            ('hKeyClass', wintypes.HKEY),
            ('dwHotKey', wintypes.DWORD),
            ('hIcon', wintypes.HANDLE),
            ('hProcess', wintypes.HANDLE),
        ]

    class RM_UNIQUE_PROCESS(ctypes.Structure):
        _fields_ = [
            ('dwProcessId', wintypes.DWORD),
            ('ProcessStartTime', wintypes.FILETIME),
        ]

    class RM_PROCESS_INFO(ctypes.Structure):
        pass

    RM_PROCESS_INFO._fields_ = [
        ('ApplicationType', ctypes.c_int),
        ('AppStatus', wintypes.ULONG),
        ('bRestartable', wintypes.BOOL),
        ('Process', RM_UNIQUE_PROCESS),
        ('strAppName', wintypes.WCHAR * (RM_MAX_APP_NAME + 1)),
        ('strServiceShortName', wintypes.WCHAR * (RM_MAX_SVC_NAME + 1)),
        ('TSSessionId', wintypes.DWORD),
    ]

    @staticmethod
    def open_file(path):
        """
        Uses ShellExecuteEx (not os.startfile)
        because it's the only way to get a process handle
        back from a shell-association launch.
        
        NOTE: for single-instance apps (Edge/Chrome-based PDF viewers)
        this handle may belong to a short-lived process that
        immediately hands off to an already-running master instance.
        """

        sei = Win.SHELLEXECUTEINFO()
        sei.cbSize = ctypes.sizeof(sei)
        sei.fMask = Win.SEE_MASK_NOCLOSEPROCESS
        sei.hInstApp = None
        sei.hwnd = None
        sei.lpDirectory = None
        sei.lpFile = os.path.abspath(path)
        sei.lpParameters = None
        sei.lpVerb = 'open'
        sei.nShow = Win.SW_SHOWNORMAL

        if not ctypes.windll.shell32.ShellExecuteExW(ctypes.byref(sei)):
            raise ctypes.WinError(ctypes.get_last_error())

        pid = ctypes.windll.kernel32.GetProcessId(sei.hProcess)
        return pid, sei.hProcess

    @staticmethod
    def get_lock_pids(path):
        """
        Return the PIDs currently holding `path` open, via the Restart Manager API.

        This is the same mechanism Windows Installer uses to know what to restart
        it asks the OS who actually has the file locked right now, so it doesn't matter
        whether that's the process we launched or a master instance it delegated to.
        """

        session = wintypes.DWORD()
        session_key = ctypes.create_unicode_buffer(Win.CCH_RM_SESSION_KEY + 1)

        rstrtmgr = ctypes.windll.rstrtmgr
        rstrtmgr.RmEndSession.argtypes = [wintypes.DWORD]
        rstrtmgr.RmEndSession.restype = wintypes.DWORD
        rstrtmgr.RmGetList.restype = wintypes.DWORD
        rstrtmgr.RmRegisterResources.restype = wintypes.DWORD
        rstrtmgr.RmStartSession.argtypes = [ctypes.POINTER(wintypes.DWORD), wintypes.DWORD, wintypes.LPWSTR]
        rstrtmgr.RmStartSession.restype = wintypes.DWORD
        rstrtmgr.RmRegisterResources.argtypes = [
            wintypes.DWORD, wintypes.UINT, ctypes.POINTER(ctypes.c_wchar_p),
            wintypes.UINT, ctypes.c_void_p, wintypes.UINT, ctypes.c_void_p,
        ]
        rstrtmgr.RmGetList.argtypes = [
            wintypes.DWORD, ctypes.POINTER(wintypes.UINT), ctypes.POINTER(wintypes.UINT),
            ctypes.POINTER(Win.RM_PROCESS_INFO), ctypes.POINTER(wintypes.DWORD),
        ]

        if rstrtmgr.RmStartSession(ctypes.byref(session), 0, session_key) != 0:
            raise ctypes.WinError()

        try:
            fpath = ctypes.c_wchar_p(os.path.abspath(path))
            files = (ctypes.c_wchar_p * 1)(fpath)

            if rstrtmgr.RmRegisterResources(session, 1, files, 0, None, 0, None) != 0:
                raise ctypes.WinError()

            count = wintypes.UINT(0)
            needed = wintypes.UINT(0)
            reboot_reasons = wintypes.DWORD(0)

            result = rstrtmgr.RmGetList(session, ctypes.byref(needed), ctypes.byref(count), None, ctypes.byref(reboot_reasons))

            if needed.value == 0:
                return []
            if result != Win.ERROR_MORE_DATA:
                raise ctypes.WinError(result)

            count = wintypes.UINT(needed.value)
            proc_info = (Win.RM_PROCESS_INFO * needed.value)()

            result = rstrtmgr.RmGetList(session, ctypes.byref(needed), ctypes.byref(count), proc_info, ctypes.byref(reboot_reasons))
            if result != 0:
                raise ctypes.WinError(result)

            return [proc_info[i].Process.dwProcessId for i in range(count.value)]
        finally:
            rstrtmgr.RmEndSession(session)

    @staticmethod
    def wait_to_close(path, poll_interval=0.5, open_timeout=15):
        """
        Block until no process holds `path` open.

        First waits for a reader to actually open the file
        bounded by open_timeout, in case launching failed silently,
        then waits for every lock on it to clear.
        """

        deadline = time.time() + open_timeout
        
        while not Win.get_lock_pids(path):
            if time.time() > deadline:
                return
            time.sleep(poll_interval)

        while Win.get_lock_pids(path):
            time.sleep(poll_interval)

        return True
