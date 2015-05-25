import re

def lettersToInt(letters):
    letterval = 0
    for char in letters:
        letterval *= 26
        letterval += ord(char) - ord('A') + 1
    return letterval-1

def coord(x):
	match = re.match('(\D+)(\d+)',x)
	return (lettersToInt(match.group(1)),int(match.group(2))-1)

def span(start,stop):
	coordList = []
	for i in range(start[0],stop[0]+1):
		for j in range(start[1],stop[1]+1):
			coordList.append((i,j))
	return coordList

def andParse(x):
	if not x:
		return []
	coordList = []
	for range in x.split('&'):
		if ':' in range:
			start,stop = range.split(':')
			coordList.extend(span(coord(start),coord(stop)))
		else:
			coordList.append(coord(range))
	return coordList

def answer(input):
	coordList = []
	yes,no = input, ''
	if '~' in yes:
		yes,no = yes.split('~')
	for x in andParse(yes):
		if x not in coordList:
			coordList.append(x)
	for x in andParse(no):
		if x in coordList:
			coordList.remove(x)
	print len(coordList)
	for x in coordList:
		print x