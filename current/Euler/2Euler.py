# Samuel Svenningsen (altock)
# Project Euler Problem 2


class fib_iterator:

    def __init__(self):
        self.prev = 1
        self.cur = 1

    def __str__(self):
        print "{}".format(self.cur)

    def next(self):
        self.cur, self.prev = self.prev + self.cur, self.cur
        return self.cur

if __name__ == '__main__':
    cur = 1
    fib = fib_iterator()
    value = 0

    while cur < 4000000:
        if not cur % 2:
            value += cur
        cur = fib.next()

    print value
