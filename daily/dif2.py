from datetime import datetime
start = datetime.now()
if raw_input('start: '):
    start = datetime.now()
laps = []
while raw_input('stop or lap: ') != 'stop':
    laps.append(datetime.now())
stop = datetime.now()
out = open('dif2.txt','a')
output = ''
prev = start
for x in laps:
    output += str(x-prev) + ', '
    prev = x
if prev != start:
    output += str(stop-prev) +', '
output+=str(stop-start) + '\n'
out.write(output)
print str(output)