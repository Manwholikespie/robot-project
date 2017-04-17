clearvars -except myev3 mycolorsensor m
% myev3 = legoev3('USB')
% m = motor(myev3, 'A')
% mycolorsensor = colorSensor(myev3)
m.Speed = -10;

done = false;
iterations = 0;

totalColorData = [];

while iterations < 4;
    readyQuestion = input('Ready?\n > ');
    
    colorData = [];
    
    for x=1:9
        colorData = [colorData, sum(readColorRGB(mycolorsensor))];
        if (x == 1) || (x == 2)
            runMotor(m,0.42)
        elseif (x == 3)
            runMotor(m,0.34)
        elseif (x == 4)
            runMotor(m,0.3)
        elseif (x == 5)
            runMotor(m,0.35)
        elseif (x == 8) || (x == 9)
            runMotor(m,0.35)
        else
            runMotor(m,0.4)
        end
        pause(1)
    end
    
    binaryDigits = '';
    for x = 1:length(colorData)
        if colorData(x) > 500
            binaryDigits(x) = '0';
        else
            binaryDigits(x) = '1';
        end
    end
    
    readbinary(binaryDigits);
    
    doneQuestion = input('Does the data look correct?')
    if (doneQuestion == 0)
        ; % we have another pass to do.
    else
        totalColorData = [totalColorData, readbinary(binaryDigits)];
        iterations = iterations + 1;
    end
end