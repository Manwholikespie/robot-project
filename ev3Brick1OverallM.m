%EV3 BRICK 1
kickmotor = motor(myev3, 'A')
belt = motor(myev3, 'B')
m = motor(myev3, 'C')
dispBelt = motor(myev3, 'D')
mycolorsensor = colorSensor(myev3)


%run the dispenser belt continuously for 10 mins

dispBelt.Speed = -24;%ADJUST
start(dispBelt)


stopBelt = false;
while ~stopBelt
    % repeat this until asked to stop.
    
    % nothing will advance until something is entered in this input.
    cur_cmd = input('\nWhat is thine request? (pause, start, ready)\n > ','s');
    
    switch(lower(cur_cmd))
        case ('pause')
            stop(dispBelt)
        case ('start')
            start(dispBelt)
        case ('ready')
            stop(dispBelt)
            break
        otherwise
            disp('Sorry, I did not understand that.')
            % do nothing, as it was not a proper command.
    end
end


%CHANGE IP ADDRESS
%!open -e getdata.py

marbleLog = [];
% make a request to the website
% while (length(marbleLog) == 0)
marbleLog = commServer();
% end



%once the marbles are sorted, manually or automatically start the barcode
%scanner



%%%%% EMERGENCY BACKUP MARBLE LOG %%%%%
%marbleLog = [1, 10, 10, 2, 10, 10, 3, 10, 10, 4, 10, 10]

%read the barcodes (all 4)
%barcode = anotherfinalbarcode(m, mycolorsensor);
binaryBar = barcodeScan(m, mycolorsensor)%MAKE SURE THIS IS THE METHOD
barcodeUnsorted = barConvert(binaryBar)
%barcode is [type, #s, #l,    type, #s, #l,    type, #s, #l,    type, #s, #l]
barcode = barcodeSum(barcodeUnsorted)

%%%%%% EMERGENCY barcode backup data %%%%%
%barcode = [1, 0, 1, 4, 3, 4, 3, 2, 1, 4, 0, 3];


%beltKicker inside for loop, 4 times

enough = true;

for(n = 1:3)
    
    [enough, marbleLog] = compareMarbles(marbleLog, barcode)
    
    if(enough)
       for(i = 1:3:12)
            %run beltKicker with barcode data
            beltKickerM(barcode(i), barcode(i+1), barcode(i+2), kickmotor, belt, n)
    
       end

       pause(20)
        
         
    else
        !say there are not enough marbles for the dosage
        !say there are not enough marbles for the dosage
    end
    


end

