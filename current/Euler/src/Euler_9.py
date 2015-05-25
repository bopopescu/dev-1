# Samuel Svenningsen (altock)
# Project Euler Problem 9
import sys

import Euler


# Brute-forcing it
if __name__ == '__main__':
    for i in xrange(1, 1000):
        for j in xrange(i+1, 1000):
            for k in xrange(j + 1, 1000):
                # if  this is 0 then we know that their sum is 1000
                num = i + j + k - 1000
                if Euler.is_pythagorean(i, j, k) and not num:
                    print i*j*k
                    sys.exit()
                elif num > 0:
                    break
