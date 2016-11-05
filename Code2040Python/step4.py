# Step IV: Prefix
import requests
import json

apiToken = '0a2f35e090a06e431c8ea842110ccd32'
endpoint = 'http://challenge.code2040.org/api/prefix'
returnpoint = 'http://challenge.code2040.org/api/prefix/validate'


def prefix(prefix,arr):
	prefixArr = []
	for i in range(0, len(arr)):
		if arr[i].startswith(prefix) == False:
			prefixArr.append(arr[i])
	return prefixArr

r = requests.post(endpoint, data = {'token':apiToken})
prefixAndArray = json.loads(r.text)
p = prefixAndArray['prefix']
a = prefixAndArray['array']
array = prefix(p,a)
returnStructure = {}
returnStructure['token'] = apiToken
returnStructure['array'] = array

post = requests.post(returnpoint, json = returnStructure)
print(post.text)