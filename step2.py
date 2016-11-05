# Step II: Reverse a string
import requests

apiToken = '0a2f35e090a06e431c8ea842110ccd32'
endpoint = 'http://challenge.code2040.org/api/reverse'
returnpoint = 'http://challenge.code2040.org/api/reverse/validate'

def reverseString(s):
	reversedString = s[::-1]
	return reversedString

r = requests.post(endpoint, data = {'token':apiToken})
str = r.text
reversedString = reverseString(str)
post = requests.post(returnpoint, data = {'token':apiToken, 'string': reversedString})
print(post.text)

