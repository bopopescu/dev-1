# Samuel Svenningsen (altock)
# Project Euler Problem 10
# import Euler_7
import Euler

if __name__ == '__main__':
    # erast = Euler_7.sieve()
    # erast.get_ith_prime(145000)
    # summation = sum(erast.list)
    # while erast.get_highest() < 2000000:
    #     summation += erast.next()
    # print summation - erast.get_highest()

    summation = 2
    for i in xrange(3, 2000000, 2):
        if Euler.is_prime(i):
            summation += i
    print summation
