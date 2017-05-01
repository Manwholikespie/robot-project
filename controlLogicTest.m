marbleLog = commServer();
% marbleLog = [1, 10, 10, 2, 10, 10, 3, 10, 10, 4, 10, 10]

%once the marbles are sorted, manually or automatically start the barcode
%scanner



%%%%% EMERGENCY BACKUP MARBLE LOG %%%%%
%marbleLog = [1, 10, 10, 2, 10, 10, 3, 10, 10, 4, 10, 10]

%read the barcodes (all 4)
%barcode = anotherfinalbarcode(m, mycolorsensor);
barcodeUnsorted = barConvert(mathbarcode())
barcode = barcodeSum(barcodeUnsorted)

postBinaryCommServer(barcode);

% binaryBar = barcodeScan(m, mycolorsensor)%MAKE SURE THIS IS THE METHOD
% barcodeUnsorted = barConvert(binaryBar)
% %barcode is [type, #s, #l,    type, #s, #l,    type, #s, #l,    type, #s, #l]
% barcode = barcodeSum(barcodeUnsorted)

%%%%%% EMERGENCY barcode backup data %%%%%
%barcode = [1, 0, 1, 4, 3, 4, 3, 2, 1, 4, 0, 3];


%beltKicker inside for loop, 4 times

% enough = true;
% 
% for(n = 1:3)
%     
%     [enough, marbleLog] = compareMarbles(marbleLog, barcode)
%     
%     if(enough)
%        for(i = 1:3:12)
%             %run beltKicker with barcode data
%             beltKickerM(barcode(i), barcode(i+1), barcode(i+2), kickmotor, belt, n)
%     
%        end
% 
%        pause(20)
%         
%          
%     else
%         !say there are not enough marbles for the dosage
%         !say there are not enough marbles for the dosage
%     end
% 
% end

