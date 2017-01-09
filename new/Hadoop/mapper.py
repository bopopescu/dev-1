#!/usr/bin/env python
import sys
import xml.etree.ElementTree as ET
import re

from datetime import datetime

def mapper():
	for row in sys.stdin:
		row = row.strip()
		
		# Make sure we're working with post data
		if not row.startswith('<row'):
			continue
		
		# Create the parser
		parser = ET.fromstring(row)
		first = parser.get('CreationDate')
		first_dt = datetime.strptime(first, '%Y-%m-%dT%X.%f')

		last = parser.get('LastActivityDate')
		last_dt = datetime.strptime(last, '%Y-%m-%dT%X.%f')


		if first:
			# print((last_dt - first_dt))
			print("{0}".format((last_dt - first_dt).total_seconds() / (24*60*60.0)))
if __name__ == '__main__':
	mapper()
