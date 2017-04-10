clc
clear all
myev3 = legoev3('USB')
% myev3 = legoev3('Bluetooth','/dev/tty.EV3-SerialPort')
% myev3 = legoev3('Bluetooth','/dev/tty.Ourbrick-SerialPort')

mymotor = motor(myev3,'A');
omotor = motor(myev3,'B');
speed = -20;
mymotor.Speed = speed;
omotor.Speed = speed;

mycolorsensor = colorSensor(myev3);

% current_color = readColor(mycolorsensor)
% current_light = readLightIntensity(mycolorsensor)
% current_rgb = readColorRGB(mycolorsensor)


% runMotor(mymotor)