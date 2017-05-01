function beltKickerM(type, numS, numL, kickmotor, belt, n)
% myev3 = legoev3('Bluetooth','/dev/tty.Ourbrick-SerialPort')
 %kickmotor = motor(myev3, 'A')
 %belt = motor(myev3, 'B')


%+((n-1)*.02)
loc = [0, .35, .68, 1.19, 1.66, 2.2, 2.67, 3.2]

%1 and 2 are blue (s,L)
%3 and 4 are red (s,L)
%5 and 6 are white (s,L)
%7 is HDPE
%8 is steel

trash = false;

if(type == 1)
    locSmall = loc(1);
    locLarge = loc(2);
    
elseif(type == 2)
    locSmall = loc(3);
    locLarge = loc(4);

elseif(type == 3)
    locSmall = loc(5);
    locLarge = loc(6);

elseif(type == 4)
    locSmall = loc(7);
    locLarge = loc(8);

else
    locSmall = 0;
    locLarge = 0;
    trash = true;
end
            
if(~trash)
    %belt move to small location

 belt.Speed = 30;%ADJUST
  start(belt)
  pause(locSmall)
  stop(belt)

    fprintf('move to %d', locSmall);


    %kick
    if(numS ~= 0)
        for(i = 1:numS)
 
            disp('kick');
       kickmotor.Speed = -145;%ADJUST
  start(kickmotor)
  pause(0.175)%ADJUST
  stop(kickmotor)

  kickmotor.Speed = 20;%ADJUST
  start(kickmotor)
  pause(0.7)%ADJUST
  stop(kickmotor) 
  pause(.5)
        end 
    end

    pause(1)
  
 belt.Speed = -30;%ADJUST
  start(belt)
  pause(locSmall)
  stop(belt)
  
  pause(.5)

    fprintf('move back from %d', locSmall);

    %belt move to large location
belt.Speed = 30;%ADJUST
  start(belt)
  pause(locLarge)
  stop(belt)

    fprintf('move to %d', locLarge);



    if(numL ~= 0)
        for(i = 1:numL)
           disp('KICK');
kickmotor.Speed = -145;%ADJUST
  start(kickmotor)
  pause(0.175)%ADJUST
  stop(kickmotor)

  kickmotor.Speed = 20;%ADJUST
  start(kickmotor)
  pause(0.7)%ADJUST
  stop(kickmotor)
  pause(0.5)
        end
    end
    
    pause(1)
    %belt move back
     belt.Speed = -30;
     start(belt)
     pause(locLarge)
     stop(belt)

pause(0.5)

    fprintf('move back from %d', locLarge);
    
end



end