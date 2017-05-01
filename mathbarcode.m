function binaryVect = mathbarcode()
    !/Users/robert/anaconda/bin/python work.py
    f = fopen('binary.data','r');
    binaryVect = str2num(cast(fread(f)','like','1'))'
    fclose(f);
    
    for x = 1:8:32
        binaryVect(x:x+2) = flip(binaryVect(x:x+2));
        binaryVect(x+3:x+7) = flip(binaryVect(x+3:x+7));
    end
end