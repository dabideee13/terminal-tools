#!/home/ubuntu/anaconda3/bin/python

"""
Custom delete function
"""

import re


def get_last(pattern: str, text: str) -> tuple:
    return [i for i in re.finditer(pattern, text)][-1].span()[0]


def delete(text: str) -> str:

    pattern = r"[./-]+"
    idx = get_last(pattern, text)

    return text[:idx+1]

