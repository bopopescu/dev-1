from snakebite.client import Client
from constants import *

client = Client('localhost', NAMENODE_PORT)

for p in client.delete(['/foo/bar','/input'], recurse=True):
    print p