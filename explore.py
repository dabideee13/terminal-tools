#!/Library/Frameworks/Python.framework/Versions/3.9/bin/python3.9

import argparse
import os
import subprocess
from typing import Optional


def explore(file_extension: Optional[str] = None) -> None:
    playground_path = "/Users/d.e.magno/Temporary/playground"
    extension = file_extension.strip().lower()

    file_type = [ext for ext in os.listdir(playground_path) if extension == ext][0]
    final_path = playground_path + f"/{file_type}"

    command = f"code {final_path}"
    subprocess.Popen(command.split(), stdout=subprocess.PIPE)

if __name__ == '__main__':

    parser = argparse.ArgumentParser()
    parser.add_argument("TYPE", type=str)

    args = parser.parse_args()

    explore(args.TYPE)
