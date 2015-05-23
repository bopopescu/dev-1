# Samuel Svenningsen (altock)
# Project Euler Problem 4


def is_palindrome(num):
    word = str(num)
    for i in range(len(word)/2):
        if word[i] != word[-(i+1)]:
            return False
    return True


def largest_palindrome_product(lower, upper):
    maximum = 0
    for i in xrange(lower, upper):
        for j in xrange(i, upper):
            prod = i*j
            if is_palindrome(prod) and prod > maximum:
                maximum = prod
    return maximum


if __name__ == '__main__':
    print largest_palindrome_product(100, 1000)
