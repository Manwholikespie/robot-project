clearvars -except myev3 mymotor mycolorsensor omotor
current_rgb = @() readColorRGB(mycolorsensor);

colorData = [];
beganScanning = false;
start(mymotor)
start(omotor)

isRed = true;
while isRed
    c_data = readColorRGB(mycolorsensor);
    c_c = sum(c_data);
    isRed = (c_data(1) > 3*c_data(2)) || (c_data(1) > 3*c_data(3));
end
stop(mymotor)
stop(omotor)


%%% BEGIN SCANNING %%%
speed = -20;
mymotor.Speed = speed;
omotor.Speed = -18;

for x = 1:7
start(mymotor)
start(omotor)

pause(0.385)

stop(mymotor)
stop(omotor)
pause(1)
end

for x = 1:1
start(mymotor)
start(omotor)

pause(0.58)

stop(mymotor)
stop(omotor)
pause(1)
end

material = '';
if binaryDigits(