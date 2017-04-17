function [material, type1, type2] = finalBinary(inputBinary)
    binaryDigits = '';
    for x = 1:length(colorData)
        if colorData(x) > 500
            binaryDigits(x) = '0';
        else
            binaryDigits(x) = '1';
        end
    end

    [binaryString, material, types] = readbinary(binaryDigits)
    
    totalMaterials = {totalMaterials{1:end}, material};
    totalType1 = [totalType1, types(1)];
    if (material == 'white glass')
        cList(4) = cList(1) + types(1);
    elseif (material == 'red glass')
        cList(4) = cList(2) + types(1);
    elseif (material == 'blue glass')
        cList(4) = cList(3) + types(1);
    elseif (material == 'steel/hdpe')
        cList(4) = cList(4) + types(1);
    end
    totalType2 = [totalType2, types(2)];
    if (material == 'white glass')
        cList2(4) = cList(1) + types(2);
    elseif (material == 'red glass')
        cList2(4) = cList(2) + types(2);
    elseif (material == 'blue glass')
        cList2(4) = cList(3) + types(2);
    elseif (material == 'steel/hdpe')
        cList2(4) = cList(4) + types(2);
    end
    
    totalBinaryString = {totalBinaryString{1:end}, binaryString};
end