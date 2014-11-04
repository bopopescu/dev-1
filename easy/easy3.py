__author__ = 'ssven'
# easy3.py
# Sam Svenningsen (sjs382@cornell.edu)
# November 3, 2014

import string
alpha = list(string.ascii_lowercase)

"""encrypts text with a Caeser cipher, moving each letter
forward along the alphabet by count letters. Ignores
non-alphabet characters. Makes everything lowercase.
"""
def encrypt(text,count):
    output = ""
    for i in text:
        j = i.lower()
        if j in alpha:
            output += alpha[(alpha.index(j) + count)%26]
        else:
            output += i
    return output

"""decrypts text with a Caeser cipher, moving each letter
backward along the alphabet by count letters. Ignores
non-alphabet characters. Makes everything lowercase.
"""
def decrypt(text,count):
    output = ""
    for i in text:
        j = i.lower()
        if j in alpha:
            output += alpha[(alpha.index(j) - count)%26]
        else:
            output += i
    return output