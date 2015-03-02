__author__ = 'ssven'
# easy39.py
# Sam Svenningsen (sjs382@cornell.edu)
# November 10, 2014

def fizzbuzz(n):
    for x in range(1,n):
        five = (x%5 == 0)
        if x % 3 == 0:
            if five:
                print "FizzBuzz"
            else:
                print "Fizz"
        elif five:
            print "Buzz"
        else:
            print x