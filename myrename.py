import os
import re
import argparse
from termcolor import colored


class Rename:
    def __init__(self):

        # initiate parser
        p = argparse.ArgumentParser(prog='rnm')
        p.add_argument('-n', '--no-action', action='store_true', default=False)
        p.add_argument('-i', '--include-ext',
                       action='store_true', default=False)
        p.add_argument('-c', '--cmd', default=None, type=str, nargs='?')
        p.add_argument('-e', '--expr', default=None, type=str, nargs='?')
        p.add_argument('-f', '--format', default=None, type=str, nargs=2)
        p.add_argument('src', type=str, nargs='?')
        p.add_argument('dest', type=str, nargs='?')
        p.add_argument('-r', '--regex', default=None, nargs=2,
                       help='%(prog)s -r pattern repl')

        # initiate data
        self.args = p.parse_args()
        if not self.args:
            self.args.print_help()
        self.srcs = []
        self.dests = []
        self.pattern = None
        self.repl = None
        self.cmd = None
        self.expr = None
        self.longest = 0

        self.init_data()

    def transform(self, src):
        dest = src
        dest = re.sub(self.pattern, self.repl, dest)
        if self.cmd:
            dest = eval(f'"{dest}".{self.cmd}()')
        if self.expr:
            f = eval(f'lambda {self.expr}')
            dest = f(dest)

        return dest

    def run(self) -> None:
        for n in range(len(self.srcs)):
            name, ext = os.path.splitext(self.dests[n])
            try:
                # if format string is provided, other commands are ignored
                if self.format:
                    format, text = self.format
                    self.dests[n] = f'{n + 1:{format}}' + ' ' + text + ext
                    continue
                if not self.args.include_ext:
                    self.dests[n] = self.transform(name) + ext
                else:
                    self.dests[n] = self.transform(self.dests[n])
            except Exception as e:
                print(e)

        for n in range(len(self.srcs)):
            if self.args.no_action:
                print(colored(f'{self.srcs[n]:{self.longest}}', 'yellow'),
                      colored('→', 'cyan'), colored(
                          self.dests[n], 'magenta'),
                      sep='\t')
            else:
                if os.path.exists(self.srcs[n]):
                    os.rename(self.srcs[n], self.dests[n])
                    print(colored(f'{self.srcs[n]:{self.longest}}', 'yellow'),
                          colored('→', 'cyan'), colored(
                              self.dests[n], 'magenta'),
                          sep='\t')
                else:
                    print('FileExistsError')

    def init_data(self):
        # if no src, srcs will be all files in the
        # working folder
        if not self.args.src:
            self.srcs.extend(
                sorted([file for file in os.listdir()
                        if file[0] not in ['.', '$']]))
        else:
            self.srcs.append(self.args.src)
        # if no dest, dest will be the same with src
        if self.args.dest:
            self.dests.append(self.args.dest)
        else:
            self.dests.extend(self.srcs)

        # initiate regex, cmd, expr
        if self.args.regex:
            self.pattern, self.repl = self.args.regex
        else:
            self.pattern, self.repl = '', ''
        self.cmd = self.args.cmd
        self.expr = self.args.expr
        self.format = self.args.format

        self.longest = max([len(src) for src in self.srcs])


if __name__ == '__main__':
    app = Rename()
    app.run()
