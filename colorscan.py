import pandas as pd
import numpy as np
from sklearn import tree
import cPickle as pickle

f = open('clf.pckl', 'rb')
clf = pickle.load(f)
f.close()

f = open('scanquestion.data','r')
colors = map(lambda x: float(x), f.readline().split(' '))
f.close()

# del sys.argv[0]
# testVals = map(lambda x: float(x), sys.argv)
f = open('scananswer.data','w')
marbleNum = str(clf.predict([colors])[0])
f.write(marbleNum)
f.close()
# def scanMarble(marbleVals):
#     return clf.predict([testVals])[0]
