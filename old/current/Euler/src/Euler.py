# Samuel Svenningsen (altock)
# Project Euler Library
import math


# Made for 1st Problem
# Takes union of the set of multiples of a and b that are under under
def multiples_sum(a, b, under):
    return sum(set(range(0, under, a)) | set(range(0, under, b)))


# Made for 3rd problem
def is_prime(num):
    if num % 2 == 0 and num > 2:
        return False
    for i in xrange(3, int(math.sqrt(num))+1, 2):
        if not num % i:
            return False
    else:
        return True


# Made for 3rd problem
# Recursively checks for smallest prime factor
# Once found, calls itself on num / lowest_factor
# Returns once the input is prime, since that
# is the largest prime factor of the original input
def greatest_factor(num):
    if is_prime(num):
        return num
    elif not num % 2:
        return greatest_factor(num/2)
    else:
        for i in xrange(3, int(math.sqrt(num))+1, 2):
            if not num % i:
                return greatest_factor(num/i)


# Made for 4th Problem
def is_palindrome(num):
    word = str(num)
    for i in range(len(word)/2):
        if word[i] != word[-(i+1)]:
            return False
    return True


# Made for 4th Problem
def largest_palindrome_product(lower, upper):
    maximum = 0
    for i in xrange(lower, upper):
        for j in xrange(i, upper):
            prod = i*j
            if is_palindrome(prod) and prod > maximum:
                maximum = prod
    return maximum


# Made for 6th Problem
def sum_square_difference(num):
    sum_square = num*(num+1)*(2*num+1)/6
    square_sum = (num*(num+1)/2)**2
    return square_sum - sum_square

# Made for 9th Problem
def is_pythagorean(a, b, c):
    return not (a**2 + b**2 - c**2)

# Made for 2nd Problem
class fib_iterator:

    def __init__(self):
        self.prev = 1
        self.cur = 1

    def __str__(self):
        print "{}".format(self.cur)

    def next(self):
        self.cur, self.prev = self.prev + self.cur, self.cur
        return self.cur


# Made for 7th Problem
# Sieve of Erastotenes (spelling)
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
            root = math.sqrt(new) + 1
            for i in self.list:
                if not new % i:
                    break
                elif i > root:
                    not_prime = False
                    self.list.append(new)
        return self.get_highest()

    def get_ith_prime(self, num):
        if num <= self.ith_prime:
            return self.list[self.ith_prime-1]
        for i in xrange(num - self.ith_prime):
            self.next()
        return self.get_highest()
