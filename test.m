% the main function for the colorscanner, kicker, and sorter.
% scans the current color, and passes that variable onto
% sensortest() by Henry, which runs the crane to sort it.

colorsensor = colorSensor(myev3);
kickmotor = motor(myev3, 'A');

totalColorDataStats = [];

totalColorDataStats = commServer();

if (length(totalColorDataStats) == 0)
    totalColorDataStats(1:12) = 0;
    totalColorDataStats(1) = 1;
    totalColorDataStats(4) = 2;
    totalColorDataStats(7) = 3;
    totalColorDataStats(10) = 4;
end

while true
    asdf = scanColor(colorsensor);
    marbleNum = processColor(asdf);
    if (marbleNum == 13)
        ; % its looking at the ground.
    else
        if (marbleNum == 11)
            % it is currently being read as steel. Let's check our work.
            
            if ((61.1 < asdf(2)) && (asdf(2) < 86))
                ; % do nothing. it is a steel. leave it.
            else
                % the green value is in the proper range for a steel ball.
                % let us continue.
                if (11.3 < asdf(4))
                    ; % do nothing. it is a steel. leave it.
                else
                    marbleNum = 7;
                end
            end
        end
        disp(asdf)
        dispMarbleType(marbleNum);
        
        if (any(marbleNum==[1,2,3,4,5,6,11,12]))
            totalColorDataStats(marbleNumToIndex(marbleNum)) = totalColorDataStats(marbleNumToIndex(marbleNum))+1;
            postCommServer(totalColorDataStats);
        end
        sizesorter(marbleNum,myev3);
        %break
    end
end

