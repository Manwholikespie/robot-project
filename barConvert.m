function barcodeUnsorted = barConvert(binary32)
barcodeUnsorted = [];

for(p = 1:8:32)
    inputBinary = binary32(p:p + 7)
   
   
    temp = readbinary(inputBinary)
    barcodeUnsorted = [barcodeUnsorted, temp]
    
    
end


end