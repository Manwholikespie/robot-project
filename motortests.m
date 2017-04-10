clearvars -except oev3 myev3 omotor mycolorsensor omotor
omotor.Speed = -1;

start(omotor)

pause(2)

stopNow = true
isRed = true;
while isRed
    % check to make sure the R channel in the RGB is 3x more potent
    % than the other channels.
    c_data = readColorRGB(mycolorsensor);
    isRed = (c_data(1) > 3*c_data(2)) || (c_data(1) > 3*c_data(3));
end
color_data = [];
while ~isRed
    c_data = readColorRGB(mycolorsensor);
    color_data = [color_data, sum(c_data)];
    isRed = (c_data(1) > 3*c_data(2)) || (c_data(1) > 3*c_data(3));
end
stop(omotor) % we have reached the barcode. We may begin scanning.