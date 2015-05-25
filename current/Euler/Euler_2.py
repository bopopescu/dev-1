# Samuel Svenningsen (altock)
# Project Euler Problem 2
import Euler


if __name__ == '__main__':
    cur = 1
    fib = Euler.fib_iterator()
    value = 0

    while cur < 4000000:
        if not cur % 2:
            value += cur
        cur = fib.next()

    print value
