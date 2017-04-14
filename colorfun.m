% myev3 = legoev3('Bluetooth','/dev/tty.Ourbrick-SerialPort')
% colorsensor = colorSensor(myev3)
    
    n = length(data);
    if (n == 0)
       n = n+1;
    else
        n = length(data(1:end,1)) + 1;
    end
    
    cur_data = scanColor(colorsensor);
    data(n,:) = cur_data;

%     kicker.Speed = 100;
%     start(kicker)
%     pause(1.5)
%     stop(kicker)