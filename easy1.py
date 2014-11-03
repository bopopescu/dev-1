__author__ = 'ssven'
# easy1.py
# Sam Svenningsen (sjs382@cornell.edu)
# November 2, 2014

name = raw_input("What\'s your name? ")
age = raw_input("How old are you? ")
username = raw_input("What is your username? ")

print "Your name is %s, you are %s years old, and your username is %s." %(name,age,username)

out = open('easy1.txt','a') #'a' means append
line = '%s, %s, %s\n' %(name,age,username)
out.write(line)
out.close()