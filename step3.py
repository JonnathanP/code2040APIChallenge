# Step III: Needle in a haystack
import requests
import json

apiToken = '0a2f35e090a06e431c8ea842110ccd32'
endpoint = 'http://challenge.code2040.org/api/haystack'
returnpoint = 'http://challenge.code2040.org/api/haystack/validate'

def findIndex(n,h):
	for i in range(0, len(h)):
		if h[i] == n:
			return i
	# returns -1 in case where index not found
	return -1

r = requests.post(endpoint, data = {'token':apiToken})
needleHaystack = json.loads(r.text)
n = needleHaystack['needle']
h = needleHaystack['haystack']
index = findIndex(n,h)
post = requests.post(returnpoint, data = {'token':apiToken, 'needle': index})
print(post.text)