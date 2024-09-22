import re

x=str(input())

if ("-" in x) or ("/" in x) or ("*" in x) or ("++" in x) or ("[a-zA-Z]" in x):
    print(False)
else:
    print(True)