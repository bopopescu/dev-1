#!/usr/bin/env python
import sys
from datetime import datetime

numCounted = 0.0
avgDays = 0.0

for line in sys.stdin:
  days = float(line)
  
  numCounted += 1
  avgDays = avgDays + (days - avgDays) / numCounted
  
print(avgDays)
