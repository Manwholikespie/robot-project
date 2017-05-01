import pandas as pd
import numpy as np
from sklearn.neighbors import KNeighborsClassifier
import cPickle as pickle
import sys


f = open('clf.pckl', 'rb')
clf = pickle.load(f)
f.close()

if len(sys.argv) >= 3:
    del sys.argv[0]
    colors = map(lambda x: float(x), sys.argv)
    marbleNum = str(clf.predict([colors])[0])
    print marbleNum
    exit()


# read the marble vector matlab sent us
f = open('scanquestion.data','r')
colors = map(lambda x: float(x), f.readline().split(' '))
f.close()

# send our prediction back to matlab
f = open('scananswer.data','w')
marbleNum = str(clf.predict([colors])[0])
f.write(marbleNum)
f.close()
