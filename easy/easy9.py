__author__ = 'ssven'
# easy9.py
# Sam Svenningsen (sjs382@cornell.edu)
# November 6, 2014

""" Can/will make nicer. Going to sleep now."""

numbers = []
for num in raw_input("Enter digits separated by spaces: "):
    if num != " ":
        numbers.append(num)

numbers.sort()

for i in numbers:
    print i