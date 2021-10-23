#!/Library/Frameworks/Python.framework/Versions/3.9/bin/python3.9

import argparse
import os
import subprocess


class Explorer:

    def __init__(self, file_extension: str) -> None:
        self._file_extension = file_extension.strip().lower()
        self._playground_path = '/Users/d.e.magno/Temporary/playground'
        self._new_dir = None
        self._final_path = None

    def _check_dir(self):
        if self._file_extension in os.listdir(self._playground_path):
            return True
        return False

    def explore(self) -> None:
        self._final_path = f"{self._playground_path}/{self._file_extension}"

        if not self._check_dir():
            os.mkdir(self._final_path)
            self._run(self._file_command)

        self._run(self._code_command)

    @property
    def _file_command(self) -> str:
        return f"touch {self._final_path}/playground.{self._file_extension}"

    @property
    def _code_command(self) -> str:
        return f"code {self._final_path}"

    def _run(self, command: str) -> None:
        subprocess.Popen(command.split(), stdout=subprocess.PIPE)


if __name__ == '__main__':

    parser = argparse.ArgumentParser()
    parser.add_argument("TYPE", type=str)
    args = parser.parse_args()

    explore = Explorer(args.TYPE)
    explore.explore()
