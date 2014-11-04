name = raw_input('What\'s your name? ')
age = raw_input('What\'s your age? ')
username = raw_input('What\'s your username? ')

print 'your name is %s, your are %s years old, and your username is %s' %(name,age,username)

out = open('easy1.txt','a')
line = '%s, %s, %s\n' %(name,age,username)
out.write(line)
out.close()