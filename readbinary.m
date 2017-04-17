function [material, type1, type2] = readbinary(inputBinary)
    inputBinary(1) = [];
    
    disp(inputBinary)
    inputBinary(1:3) = reverse(inputBinary(1:3));
    inputBinary(4:8) = reverse(inputBinary(4:8));
    
    binaryString = inputBinary(1:8);
    disp(binaryString);
    
    if inputBinary(1:3) == '001'
        material = 3; % 'white glass'
    elseif inputBinary(1:3) == '010'
        material = 2; % 'red glass'
    elseif  inputBinary(1:3) == '011'
        material = 1; % 'blue glass'
    elseif  inputBinary(1:3) == '100'
        material = 4; %'steel/hdpe'
    else
        material = 5;
    end
    
    types = [];
    bNum = bin2dec(inputBinary(4:8));
%     if (bNum >= 0) && (bNum <= 4)
%         types(1) = bNum - 1;
%         types(2) = 0;
%     end
    
    b_rem = mod(bNum,4);
    if b_rem == 0
        type1 = 3;
    else
        type1 = b_rem - 1;
    end
    
    b_div = bNum / 4;
    if mod(b_div,1) == 0
        type2 = b_div - 1;
    else
        type2 = floor(b_div);
    end
    
    fprintf(' Material: %d\n #Type 1: %d\n #Type 2: %d\n',material,type1,type2)
end