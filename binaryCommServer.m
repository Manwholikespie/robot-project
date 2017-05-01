function totalColorData = binaryCommServer()
    % fetch data from the server running on the other computer
    !python getbinarydata.py
    
    % read the response we got from the computer
    f = fopen('barcode.data','r');
    g = fread(f)'
    fclose(f);
    
    % process/clean the response we got from the computer
    totalColorData = [];
    for x=1:length(g)
        totalColorData = [totalColorData, str2num(cast(g(x),'like','1'))];
    end
end