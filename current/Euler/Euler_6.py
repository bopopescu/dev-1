# Samuel Svenningsen (altock)
# Project Euler Problem 6


def sum_square_difference(num):
    sum_square = num*(num+1)*(2*num+1)/6
    square_sum = (num*(num+1)/2)**2
    return square_sum - sum_square

if __name__ == '__main__':
    print sum_square_difference(100)
