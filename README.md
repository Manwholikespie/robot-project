# Robot Project
## Basic Ev3dev Usage

```matlab
% Set up an ev3 device:
myev3 = legoev3('Bluetooth','/dev/tty.EV3-SerialPort')
myev3 = legoev3('Bluetooth','/dev/tty.Ourbrick-SerialPort'
myev3 = legoev3('USB')

% To set up a motor on the ev3 device "myev3":  
mymotor = motor(myev3, 'A')

% To set up a color sensor on the ev3 device "myev3":  
mycolorsensor = colorSensor(myev3)

% To read color from a color sensor:  
color_data = readColorRGB(mycolorsensor);

% Display the value of the RED color channel.
disp(color_data(1))
```