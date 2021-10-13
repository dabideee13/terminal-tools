#!/Library/Frameworks/Python.framework/Versions/3.9/bin/python3

"""
Utility functions
"""

from pathlib import Path


def list_packages() -> list:
    with open('requirements.txt', 'r') as f:
        packages = f.read().split('\n')
    return packages


def list_dir(path: Optional[Union[str, Path]] = None) -> List[Path]:
    if path:
        files = Path(path).iterdir()

    pass


def get_project_name() -> str:
    while


def go_source() -> Path:
    pass
