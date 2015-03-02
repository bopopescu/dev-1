__author__ = 'ssven'
# difficult1.py
# Sam Svenningsen (sjs382@cornell.edu)
# November 2, 2014

not_done = True
high = 101
your_number = 50
low  = 1
guesses = 1

while not_done:

    answer = raw_input('Is your number %d? (y)es, (h)igher, or (l)ower ' %your_number)

    if answer == 'y':
        print "That only took me %d guesses" %guesses
        not_done = False
    elif answer == 'h':
        low = your_number+1
        your_number = (your_number + high)/2
    elif answer == 'l':
        high = your_number
        your_number = (your_number + low)/2
    else:
        print "Not a valid answer"
        guesses -= 1

    guesses += 1