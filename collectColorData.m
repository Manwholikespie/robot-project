for x = 1:randi(4)
    n = length(data);
    if n == 0
        data(1,:) = scanColor(colorsensor)
    else
        n = length(data(:,1));
        data(n+1,:) = scanColor(colorsensor)
    end
end

% kick it out
speeds = [80,-50];
kickmotor.Speed=speeds(1);
start(kickmotor)
pause(0.6)
stop(kickmotor)

kickmotor.Speed=speeds(2);
start(kickmotor)
pause(1.2)
stop(kickmotor)