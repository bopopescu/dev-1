# Samuel Svenningsen (altock)
# Project Euler Problem 13
# import Euler


if __name__ == '__main__':
    val = 0
    with open('../data/p13.txt', 'rb') as fname:
        for line in iter(fname):
            val += long(line[:14])
    # Manually shorten to 10 digits
    print val
