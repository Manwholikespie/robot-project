import requests
from pprint import pprint

f = open('dl.data','w')
r = requests.get('http://127.0.0.1:5000')
f.write(r.text)
f.close()
