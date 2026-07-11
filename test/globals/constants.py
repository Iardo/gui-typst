import os

class Constants:
    ansi_red = '\033[31m'
    ansi_clr = '\033[0m'

    source_folder = './test/data/sample-project'
    output_folder = './test/.output'
    output_file = 'main.pdf'
    output_path = os.path.join(output_folder, output_file)
    arguments = '' \
        '--format=pdf ' \
        '--font-path=./static/font ' \
        '--font-path=./source/designdoc/static/font ' \
        '--ignore-system-fonts ' \
        '--root=. '
