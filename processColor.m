function marbleNum = processColor(color_vect)
    % given a color vector like the one from scanColor(), return
    % what kind of marble we think it is.
    %
    % @rtype marbleNum: an int, specifying the marble type.
    a = color_vect;
    
    % write our vector to a file that python can communicate with.
    f = fopen('scanquestion.data','w');
    for x=1:length(a)
        if x ~= length(a)
            fprintf(f, '%.2f ', a(x));
        else
            fprintf(f, '%.2f', a(x));
        end
    end
    fclose(f); % close the file.
    
    % call our python script to interprate our vector.
    !/Users/robert/anaconda/bin/python colorscan.py
    
    % read python's response
    f = fopen('scananswer.data','r');
    marbleNum = fread(f);
    fclose(f);
    
    % it reads the int as its ASCII value, which we need to convert to
    % the double of its original number.
    newIntStr = [];
    for x=1:length(marbleNum)
        newIntStr = [newIntStr, cast(marbleNum(x),'like','a')];
    end
    
    marbleNum = str2double(newIntStr);
end