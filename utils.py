"""
Utility functions
"""


def list_packages() -> list:
    with open('requirements.txt', 'r') as f:
        packages = f.read().split('\n')
    return packages

