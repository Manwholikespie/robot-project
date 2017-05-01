function barcode = barcodeSum(barcode)

%IN [type1, s, l, type2, s, l, type3, s, l, type4, s, l]


%brwo
%OUT [1, s(blue), l(blue), 2, s(red), 3, s(white), l(white), 4, hdpe,
%steel]


sb = 0;
lb = 0;

sr = 0;
lr = 0;

sw = 0;
lw = 0;

hdpe = 0;
steel = 0;

for(i = 1:3:12)%i is going to be indexes 1, 4, 7, 10,  the type data
    % i has four options, 1, 2, 3, 4
    if(barcode(i) == 1)
       sb = sb + barcode(i + 1); 
       lb = lb + barcode(i + 2);
       
    elseif(barcode(i) == 2)              
       sr = sr + barcode(i + 1); 
       lr = lr + barcode(i + 2);     
   
    elseif(barcode(i) == 3)
       sw = sw + barcode(i + 1); 
       lw = lw + barcode(i + 2);    
        
    elseif(barcode(i) == 4)
       hdpe = hdpe + barcode(i + 1); 
       steel = steel + barcode(i + 2);    
    
    end
    
    
end

barcode = [1, sb, lb, 2, sr, lr, 3, sw, lw, 4, hdpe, steel];

end