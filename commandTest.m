% we are going to test to see if we can stop a motor with a command,
% and then resume the process

start(dispBelt) % begin the motor

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

marbleLog = [];
% make a request to the website
while (length(marbleLog) == 0)
    marbleLog = commServer();
end

binary = barcodeScan();
