function [binaryString, material, types] = readbinary(inputBinary)
    inputBinary(1) = [];
    
    disp(inputBinary)
    inputBinary(1:3) = reverse(inputBinary(1:3))
    inputBinary(4:8) = reverse(inputBinary(4:8))
    
    binaryString = inputBinary(1:8)
    
    if inputBinary(1:3) == '001'
        material = 'white glass'
    elseif inputBinary(1:3) == '010'
        material = 'red glass'
    elseif  inputBinary(1:3) == '011'
        material = 'blue glass'
    elseif  inputBinary(1:3) == '100'
        material = 'steel/hdpe'
    else
        material = 'unknown'
    end
    
    types = [];
    bNum = bin2dec(inputBinary(4:8))
%     if (bNum >= 0) && (bNum <= 4)
%         types(1) = bNum - 1;
%         types(2) = 0;
%     end
    
    b_rem = mod(bNum,4)
    if b_rem == 0
        types(1) = 3
    else
        types(1) = b_rem - 1
    end
    
    b_div = bNum / 4
    if mod(b_div,1) == 0
        types(2) = b_div - 1
    else
        types(2) = floor(b_div)
    end
    
    fprintf(' Material: %s\n Type 1: %d\n Type 2: %d\n',material,types(1),types(2))
    
    
end