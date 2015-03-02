__author__ = 'ssven'
# difficult8.py
# Sam Svenningsen (sjs382@cornell.edu)
# November 7, 2014

from math import factorial
input = raw_input("Input: ").split()

line = int(input[0])
num = int(input[1])


"""n choose r"""
def nCr (line,num):

    if 0 <= num <= line:
        output = factorial(line)/(factorial(num)*factorial(line-num))
        print "Output: %d" %output
    else:
        print """invalid input, second number must be between 0
        and 1 minus the first number inclusive"""

nCr(line-1,num-1)