# Samuel Svenningsen (altock)
# Project Euler Problem 1


# Takes union of the set of multiples of a and b that are under under
def multiples_sum(a, b, under):
    return sum(set(range(0, under, a)) | set(range(0, under, b)))

if __name__ == '__main__':
    print multiples_sum(3, 5, 1000)
