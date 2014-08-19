top = 101
bottom = 1
answer = ''


while answer != 'y':
    guess = (top + bottom)/2
    answer = raw_input('is it %d ' % guess)
    if answer == 'y':
        print 'Correct answer is ' + str(guess)
    elif answer == 'h':
        bottom = guess
    else:
        top = guess