from snakebite.client import Client

client = Client('localhost', 8020)
for x in client.ls(['/']):
    print x
