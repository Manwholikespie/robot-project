clearvars -except myev3 mycolorsensor m
% myev3 = legoev3('USB')
% m = motor(myev3, 'A')
% mycolorsensor = colorSensor(myev3)
m.Speed = -10;
stop(m)
start(m)

isRed = true;
while isRed
    % check to make sure the R channel in the RGB is 3x more potent
    % than the other channels.
    c_data = readColorRGB(mycolorsensor);
    isRed = ((c_data(1) > 3*c_data(2)) || (c_data(1) > 3*c_data(3)) && c_data(1) > 100);
end
color_data = [];
times = [];
tic
while ~isRed
    c_data = readColorRGB(mycolorsensor);
    color_data = [color_data, sum(c_data)];
    isRed = ((c_data(1) > 3*c_data(2)) || (c_data(1) > 3*c_data(3)) && c_data(1) > 100);
end
timeElapsed=toc
stop(m) % we have reached the barcode. We may begin scanning.
% moredatatests(color_data)
plottests