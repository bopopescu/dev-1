import nltk
# print(nltk.__file__)
from os import system
from nltk.corpus import gutenberg
from nltk.tokenize import sent_tokenize

sample = gutenberg.raw("bible-kjv.txt")
tok = sent_tokenize(sample)

print(tok[5:15])

# reads the entire bible
# for t in tok:
#     system("say " + t)

