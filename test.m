colorsensor = colorSensor(myev3);
while true
    marbleNum = processColor(scanColor(colorsensor));
    if marbleNum == 13
        ; % its looking at the ground.
    else
        dispMarbleType(marbleNum);
    end
    pause(0.5)
end