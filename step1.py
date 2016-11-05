# Step I: Registration
import requests

apiToken = '0a2f35e090a06e431c8ea842110ccd32'
registrationEndpoint = "http://challenge.code2040.org/api/register"
github = "https://github.com/JonnathanP/code2040APIChallenge"

r = requests.post(registrationEndpoint, data = {'token':apiToken, 'github':github})
print(r.text)

