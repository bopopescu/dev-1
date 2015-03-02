__author__ = 'ssven'
# intermediate14.py
# Sam Svenningsen (sjs382@cornell.edu)
# November 9, 2014
n = 10000
ls = [x for x in range(1,n)]


for i in range(1,n/2):
    for j in range(i,n):
        num = i + j + 2*i*j
        if num > n:
            break
        elif num in ls:
            ls.remove(num)

prime = [x*2+1 for x in ls]

prime.insert(0,2)

print prime