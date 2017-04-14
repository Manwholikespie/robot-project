from pprint import pprint
import pandas as pd
import numpy as np
import os

data = {}
for file in filter(lambda x: '.py' not in x, os.listdir('.')):
    fileName = file.split('.csv')[0]
    color, size = tuple(
        list(reversed(map(lambda x: x[0], 'small blue'.split(' ')))))

    print fileName

    f = open(file, 'r')
    data+=reduce(lambda x,y : x+y, (map(lambda x: fileName+','+x, f.readlines())))
    f.close()

f = open('combinedData.csv','w')
f.write(data)
f.close()
