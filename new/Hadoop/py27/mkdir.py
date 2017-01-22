from snakebite.client import Client
from constants import NAMENODE_PORT

client = Client('localhost', NAMENODE_PORT)
for p in client.mkdir(['/foo/bar', '/input'], create_parent=True):
    print p