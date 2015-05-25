__author__ = 'ssven'
# easy8.py
# Sam Svenningsen (sjs382@cornell.edu)
# November 5, 2014

n = 99

while n > 1:
    print """%d bottles of beer on the wall, %d bottles of beer.
Take one down and pass it around, %d bottles of beer on the wall.\n""" \
          %(n,n,n-1)

    n -= 1

print """%d bottles of beer on the wall, %d bottles of beer.
Take one down and pass it around, %s bottles of beer on the wall. \n
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.""" \
      %(n,n,"no more")