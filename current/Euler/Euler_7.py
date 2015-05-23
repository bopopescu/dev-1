# Samuel Svenningsen (altock)
# Project Euler Problem 7
from math import sqrt

# Sieve of Erastotenes (spelling) was too slow
class sieve:

    def __init__(self):
        self.list = [2, 3]
        self.ith_prime = 2

    def __str__(self):
        print "The {}th prime is: {}".format(self.ith_prime, self.list[-1])

    def get_highest(self):
        return self.list[-1]

    def next(self):
        self.ith_prime += 1

        not_prime = True
        new = self.get_highest()
        while not_prime:
            new += 2
            for i in self.list:
                if not new % i:
                    break
            else:
                not_prime = False
                self.list.append(new)
        return self.get_highest()

    def get_ith_prime(self, num):
        if num <= self.ith_prime:
            return self.list[self.ith_prime-1]
        for i in xrange(num - self.ith_prime):
            self.next()
        return self.get_highest()


if __name__ == '__main__':
    erast = sieve()
    print erast.get_ith_prime(10001)
