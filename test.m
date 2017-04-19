colorsensor = colorSensor(myev3);
kickmotor = motor(myev3, 'A');

totalColorDataStats = [];
for x=1:12
    totalColorDataStats(x) = 0;
end
    
while true
    asdf = scanColor(colorsensor);
    marbleNum = processColor(asdf);
    if (marbleNum == 13)
        % currently, I have it ignoring the big reds, as it thinks
        % the ground is a big red.
        % TODO: remember to change this back later...
        
        ; % its looking at the ground.
    else
        if ((marbleNum == 11) && (asdf(4) < 13))
            marbleNum = 7;
        end
        disp(asdf)
        dispMarbleType(marbleNum);
        
        totalColorDataStats(marbleNum) = totalColorDataStats(marbleNum)+1;
        sizesorter(marbleNum,myev3);
        
    end
end

% a = scanColor(colorsensor)

for x = 1:length(a)
    fprintf('%.2f ',a(x))
end