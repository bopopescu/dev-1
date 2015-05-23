# Samuel Svenningsen (altock)
# Project Euler Problem 3
import math


def is_prime(num):
    if num % 2 == 0 and num > 2:
        return False
    for i in xrange(3, int(math.sqrt(num))+1, 2):
        if not num % i:
            return False
    else:
        return True


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


# Sieve of Erastotenes (spelling) was too slow
# class sieve:

#     def __init__(self):
#         self.list = [2, 3]

#     def __str__(self):
#         print "{}".format(self.list[-1])

#     def is_prime(self, num):

#     def get_highest(self):
#         return self.list[-1]

#     def next(self):
#         not_prime = True
#         new = self.get_highest()
#         while not_prime:
#             new += 2
#             for i in self.list:
#                 if not new % i:
#                     break
#             else:
#                 not_prime = False
#                 self.list.append(new)
#         return self.get_highest()

#     def largest_factor(self, num):
#         condition = sqrt(num)/2+1
#         while self.get_highest() < condition:
#             self.next()
#         for i in self.list[::-1]:
#             if not num % i:
#                 return i
#         return 1

if __name__ == '__main__':
    print greatest_factor(600851475143)
