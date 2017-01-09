#!/usr/bin/env python
import sys

numTagged = 0.0
oldKey = 0 # oldTag
totalAnswered = 0

for line in sys.stdin:
  thisKey, answered = line.strip().split("\t")

  if oldKey and oldKey != thisKey:
    print(oldKey, "\t", totalAnswered / numTagged)
    oldKey = thisKey
    totalAnswered, numTagged = 0,0.0

  oldKey = thisKey
  totalAnswered += int(answered)
  numTagged += 1

if oldKey != None:
  print(oldKey, "\t", totalAnswered / numTagged)
