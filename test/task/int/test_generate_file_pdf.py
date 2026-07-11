import os
import subprocess
import sys
import time

from test.globals.constants import Constants
from test.util.pdf_helper import PDF_Helper

class Test_Generate_File_PDF:
    @staticmethod
    def run():
        for file in os.listdir(Constants.output_folder):
            file_name = os.path.splitext(file)[0]

            # Windows
            if '.~lock.designdoc' in file_name:
                print(f'{Constants.ansi_red}Error: Another application or process is using the file.{Constants.ansi_clr}')
                sys.exit(1)

        for source in os.listdir(Constants.source_folder):
            subdir1 = os.path.join(Constants.source_folder, source)
            if not source == 'main.typ':
                continue

            src = subdir1
            out = Constants.output_path

            subprocess.call(f'typst compile {Constants.arguments} {src} {out}', shell=True)

        if os.path.isfile(Constants.output_path):
            retry=5
            delay=0.5

            is_closed = PDF_Helper.open_file_and_wait_to_close(Constants.output_path)
            if is_closed:
                for count in range(retry):
                    try:
                        os.remove(Constants.output_path)
                        print(f'Deleted {Constants.output_path}')
                        return
                    except PermissionError:
                        print(f'{Constants.ansi_red}Error: could not delete {Constants.output_path} (file may still be locked){Constants.ansi_clr}')
                        print(f'Retry ({count})...')
                        time.sleep(delay)
