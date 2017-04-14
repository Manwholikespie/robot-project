% myev3 = legoev3('Bluetooth','/dev/tty.Ourbrick-SerialPort')
% kickmotor = motor(myev3, 'A')
% belt = motor(myev3, 'B')


kickmotor.Speed = -5;
start(kickmotor)
pause(0.01)

belt.Speed = -20;
start(belt)
pause(0.2)
stop(belt)

kickmotor.Speed = -40;
start(kickmotor)
pause(0.2)
stop(kickmotor)
kickmotor.Speed = 30;
start(kickmotor)
pause(0.5)
stop(kickmotor)