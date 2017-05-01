import requests
from pprint import pprint

f = open('barcode.data','w')
r = requests.get('http://127.0.0.1:5000/binary')
f.write(r.text)
f.close()
