%%% GENERAL NOTES ON IMPORTANT FUNCTIONS %%%
% mycolorsensor = colorSensor(myev3);
% current_color = readColor(mycolorsensor)
% current_light = readLightIntensity(mycolorsensor)
% current_rgb = readColorRGB(mycolorsensor)


% scanner state goes from:
% feeding barcode, but not yet scanning... only reading tape. ->
%   scanning the B/W bars ->
%       B/W bars are past us, reading tape again... kill motor. ->
%           Done. Begin data analysis to generate binary number.

% anonymous function to summate the RGB values for a color.
clearvars -except myev3 mymotor mycolorsensor omotor
current_rgb = @() readColorRGB(mycolorsensor);

colorData = [];
beganScanning = false;
start(mymotor)
start(omotor)
while true
    % first few passes stay in here while it feeds the barcode, but
    % isn't yet scanning the B/W bars. Only reading tape.
    c_data = readColorRGB(mycolorsensor);
    c_c = sum(c_data);
    isRed = (c_data(1) > 3*c_data(2)) || (c_data(1) > 3*c_data(3));
%     [c_c, isRed] = getcolor(current_rgb());

    if ~isRed
        % a non-tape color was detected. Now scanning B/W bars.

        colorData = [colorData, c_c];
        if (beganScanning == false)
            % the scanning has now begun. start the timer.
            tic
        end
        beganScanning = true;
    elseif (isRed && beganScanning)
        % we have reached tape again. stop the motor, and begin
        % data analysis.
        totalT = toc;
        disp(totalT)
        stop(mymotor)
        stop(omotor)
        break
    end
end
stop(mymotor)
stop(omotor)

%%% BEGIN DATA ANALYSIS %%%

% first and last two points are inconsistent.
colorData = [colorData(1), colorData];
colorData(end-1:end) = [];

bins = linspace(0,20,length(colorData));
digitArray = zeros(1,20);

y = 1;
for x = 1:length(bins)
    index = ceil(bins(x));
    if (index == 0)
        % 0 rounds to 0. fix that for the first pass.
        index = 1;
    end
    % disp(index)
    digitArray(index) = digitArray(index) + colorData(x);
end

binaryDigits = '';
meanColorVal = mean(digitArray);
for x = 1:length(digitArray)
    if digitArray(x) > meanColorVal
        binaryDigits(x) = '0';
    else
        binaryDigits(x) = '1';
    end
end
disp(binaryDigits)
troughs = colorData < 220
find(diff(troughs) >= 1)
diff([1, find(diff(troughs) >= 1), length(colorData)])

% for x = 1:    
round(diff([0, find(diff(troughs) >= 1), length(colorData)])/4.885)
round(diff([0, find(diff(diff(colorData) > 200) >= 1), length(colorData)])/4.885)



