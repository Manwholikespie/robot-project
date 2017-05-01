function data = readbinary(inputBinary)
    % output needs to be changed to [material, type1, type2].
    
    
    inBinStr = '';
    for(u = 1:length(inputBinary))
       inBinStr = [inBinStr, num2str(inputBinary(u))]; 
    end
    
    
    if inBinStr(1:3) == '001'
        material = 4 % white
    elseif inBinStr(1:3) == '010'
        material = 2 % red
    elseif  inBinStr(1:3) == '011'
        material = 1 % blue
    elseif  inBinStr(1:3) == '100'
        material = 4 % other
    else
        material = 0
    end
    
    bNum = bin2dec(inBinStr(4:8))
    disp(inBinStr)
%     if (bNum >= 0) && (bNum <= 4)
%         types(1) = bNum - 1;
%         types(2) = 0;
%     end
    
    b_rem = mod(bNum,4)
    if b_rem == 0
        largeNum = 3
    else
        largeNum = b_rem - 1
    end
    
    b_div = bNum / 4
    if mod(b_div,1) == 0
        smallNum = b_div - 1
    else
        smallNum = floor(b_div)
    end
    
    
    data = [material, smallNum, largeNum];
    
    
    
end