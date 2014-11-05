__author__ = 'ssven'
# easy7.py
# Sam Svenningsen (sjs382@cornell.edu)
# November 4, 2014
import string

alpha = list(string.ascii_lowercase)
morse = ['.-','-...','-.-.','-..','.','..-.','--.','....','..',
         '.---','-.-','.-..','--','-.','---','.--.','--.-',
               '.-.','...','-','..-','...-','.--','-..-','-.--','--..']

morse_alpha = {morse[i]:alpha[i] for i in range(26)}
alpha_morse = {alpha[i]:morse[i] for i in range(26)}

"""to_morse converts a sentence to itself in morse code
in the format of ...---... putting a space between every
letter, and a / stands for a space.
Precondition: no periods or other syntax besides .-_/ where
_ stands for an empty space
"""
def to_morse(text):
    output = ""
    for i in text:
        j = i.lower()
        if j in alpha:
            output += alpha_morse.get(j) + " "
        elif j == " ":
            output += "/ "
    return output

"""from_morse converts a morse code sentence to its normal
self. The morse code must be in the format of ...---...
putting a space between every letter, and a / stands for a space.
"""
def from_morse(text):
    output = ""
    letter = ""
    for j in text:
        if j == '.' or j == "-":
            letter += j
        elif j == " ":
            if letter in morse:
                output += morse_alpha.get(letter)
                letter = ""
        elif j == "/":
            output += " "
    # Will ignore last letter without this if statement
    # if the text doesn't end in a space.
    if letter in morse:
        output += morse_alpha.get(letter)

    return output
