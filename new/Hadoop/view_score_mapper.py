#!/usr/bin/env python
import sys
import xml.etree.ElementTree as ET

def mapper():
	for row in sys.stdin:
		row = row.strip()
		
		# Make sure we're working with post data
		if not row.startswith('<row'):
			continue
		
		# Create the parser
		parser = ET.fromstring(row)
		answerCount = parser.get('AnswerCount')
		if answerCount != None and int(answerCount)> 0:
			score = parser.get('Score')
			viewCount = parser.get('ViewCount')
			if score != None and viewCount != None:
				print("{0}\t{1}".format(viewCount,score))
if __name__ == '__main__':
	mapper()
