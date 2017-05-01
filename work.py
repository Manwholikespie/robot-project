import os
import time

i = 1

os.system('rm ./Images/*')
os.system('rm binary.data')
os.system('mv ~/Downloads/*.JPG ./Images/')
for file in filter(lambda x: 'DS_Store' not in x, os.listdir('./Images/')):
    # name the current file 1.JPG, as this is what the wolfram script imports
    os.system('mv ./Images/'+file+' ./Images/'+str(1)+'.JPG')

    # downsize the image to something more workable.
    os.system('/usr/local/bin/convert -resize 300x225 ./Images/1.JPG ./Images/1.JPG')

    # call the script to read the barcode, and append its reading to a file.
    os.system('/usr/local/bin/wolframscript -script newscan.wl >> binary.data')

    # rename 1.JPG to i.JPG, where i will be incrementing so we know
    # run 1 from run 2, etc.
    os.system('mv ./Images/1.JPG ./Images/old-'+str(i)+'.JPG')
    i += 1
