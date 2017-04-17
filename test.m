colorsensor = colorSensor(myev3);
while true
    marbleNum = processColor(scanColor(colorsensor));
    if marbleNum == 13
        ; % its looking at the ground.
    else
        dispMarbleType(marbleNum);
        % sizesorter(marbleNum,myev3);
        
        speeds = [80,-50];
        kickmotor.Speed=speeds(1);
        start(kickmotor)
        pause(0.6)
        stop(kickmotor)

        kickmotor.Speed=speeds(2);
        start(kickmotor)
        pause(1.2)
        stop(kickmotor)      
        
        break
    end
    pause(2.5)
end

a = scanColor(colorsensor)

for x = 1:length(a)
    fprintf('%.2f ',a(x))
end