# Step V: The dating game
import requests
import json
import datetime

apiToken = '0a2f35e090a06e431c8ea842110ccd32'
endpoint = 'http://challenge.code2040.org/api/dating'
returnpoint = 'http://challenge.code2040.org/api/dating/validate'

def resultDate(datestamp, interval):
	format = '%Y-%m-%dT%H:%M:%SZ'
	datetimeObj = datetime.datetime.strptime(datestamp, format)
	newDateTime = datetimeObj + datetime.timedelta(seconds = interval)
	return newDateTime.strftime(format)

r = requests.post(endpoint, data = {'token':apiToken})
datingGame = json.loads(r.text)
d = datingGame['datestamp']
i = datingGame['interval']
time = resultDate(d,i)

post = requests.post(returnpoint, data = {'token':apiToken, 'datestamp': time})
print(post.text)