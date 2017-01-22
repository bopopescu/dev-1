from snakebite.client import Client
from constants import *

client = Client('localhost', NAMENODE_PORT)

# Create input.txt
print list(client.touchz(['/input/input.txt']))

# copy over input.txt
for f in client.copyToLocal(['/input/input.txt'], '/tmp'):
    print f

# print text
for l in client.text(['/input/input.txt']):
    print l