% myev3 = legoev3('Bluetooth','/dev/tty.Ourbrick-SerialPort')
% oev3 = legoev3('USB')
% 
% mymotor = motor(myev3, 'A')
% omotor = motor(oev3, 'A')
while true
    mymotor.Speed = 90;
    start(mymotor)
    pause(0.1)
    stop(mymotor)

    mymotor.Speed = -90;
    start(mymotor)
    pause(0.1)
    stop(mymotor)
    
    pause(3)
end
% omotor.Speed = 20;

