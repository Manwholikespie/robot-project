import pandas as pd
import numpy as np
from sklearn import tree
import cPickle as pickle

df = pd.read_csv('combinedData.csv')

def material_num(material_char):
    materials = list('wrbgyshz')
    for x in xrange(0,len(materials)):
        if materials[x] == material_char:
            if ((x+1) < 6):
                return (x+1)*2 - 1
            elif x == len(materials) - 3:
                return (x+1)*2 - 1
            elif x == len(materials) - 2:
                return (x+1)*2 - 2
            elif x == len(materials) - 1:
                return (x+1)*2 - 3

    print('That material could not be found')

def size_num(size_char):
    if size_char == 'b':
        return 0
    elif size_char == 's':
        return 1
    else:
        print('That size could not be found')

def marble_num(marbleName):
    marbleTuple = tuple(map(lambda x: x[0], marbleName.split(' ')))
    if len(marbleTuple) == 1:
        marbleTuple = ('b', marbleTuple[0])

    size, material = marbleTuple

    return size_num(size) + material_num(material)

df['marbleNum'] = df['color'].map(lambda x: marble_num(x))

features = []
labels = []
for i, row in df.iterrows():
    features.append([row.r, row.g, row.b, row.l])
    labels.append(row.marbleNum)

clf = tree.DecisionTreeClassifier()
clf = clf.fit(features, labels)

f = open('clf.pckl', 'wb')
pickle.dump(clf, f)
f.close()
