clearvars -except myev3 mymotor mycolorsensor omotor
current_rgb = @() readColorRGB(mycolorsensor);

colorOptions = {'white glass','red glass','blue glass','steel/hdpe'};
cList = [0,0,0,0]
cList2 = [0,0,0,0]

stop(mymotor)
stop(omotor)

numbars = 9;
speed = 20;
mymotor.Speed = speed;
omotor.Speed = 20;

totalMaterials = {};
totalType1 = [];
totalType2 = [];
summedType1 = [];
summedType2 = [];
totalBinaryString = {};

scanTimes = 0;

while true
    if scanTimes == 4
        break
    end
    colorData = [];
    
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
    pause(1)

    % 3.84
    % 5.8
    for x = 1:2
    start(mymotor)
    start(omotor)

    % .28 worked twice
    pause(0.31)

    stop(mymotor)
    stop(omotor)

    c_data = readColorRGB(mycolorsensor);
    c_c = sum(c_data);
    colorData = [colorData, c_c];

    pause(1)
    end


    for x = 3:4
    start(mymotor)
    start(omotor)

    % .32 worked twice
    pause(0.4)

    stop(mymotor)
    stop(omotor)

    c_data = readColorRGB(mycolorsensor);
    c_c = sum(c_data);
    colorData = [colorData, c_c];

    pause(1)
    end

    for x = 5
    start(mymotor)
    start(omotor)

    pause(0.42)

    stop(mymotor)
    stop(omotor)

    c_data = readColorRGB(mycolorsensor);
    c_c = sum(c_data);
    colorData = [colorData, c_c];

    pause(1)
    end

    for x = 6
    start(mymotor)
    start(omotor)

    pause(0.4)

    stop(mymotor)
    stop(omotor)

    c_data = readColorRGB(mycolorsensor);
    c_c = sum(c_data);
    colorData = [colorData, c_c];

    pause(1)
    end

    for x = 7
    start(mymotor)
    start(omotor)

    pause(0.43)

    stop(mymotor)
    stop(omotor)

    c_data = readColorRGB(mycolorsensor);
    c_c = sum(c_data);
    colorData = [colorData, c_c];

    pause(1)
    end

    for x = 8
    start(mymotor)
    start(omotor)

    pause(0.49)

    stop(mymotor)
    stop(omotor)

    c_data = readColorRGB(mycolorsensor);
    c_c = sum(c_data);
    colorData = [colorData, c_c];

    pause(1)
    end


    for x = 9:numbars
    start(mymotor)
    start(omotor)

    pause(0.65)

    stop(mymotor)
    stop(omotor)

    c_data = readColorRGB(mycolorsensor);
    c_c = sum(c_data);
    colorData = [colorData, c_c];

    pause(1)
    end
    start(mymotor)
    start(omotor)
    pause(0.58)
    stop(mymotor)
    stop(omotor)

    binaryDigits = '';
    for x = 1:length(colorData)
        if colorData(x) > 500
            binaryDigits(x) = '0';
        else
            binaryDigits(x) = '1';
        end
    end

    [binaryString, material, types] = readbinary(binaryDigits)
    totalMaterials = {totalMaterials{1:end}, material};
    totalType1 = [totalType1, types(1)];
    if (material == 'white glass')
        cList(4) = cList(1) + types(1);
    elseif (material == 'red glass')
        cList(4) = cList(2) + types(1);
    elseif (material == 'blue glass')
        cList(4) = cList(3) + types(1);
    elseif (material == 'steel/hdpe')
        cList(4) = cList(4) + types(1);
    end
    totalType2 = [totalType2, types(2)];
    if (material == 'white glass')
        cList2(4) = cList(1) + types(2);
    elseif (material == 'red glass')
        cList2(4) = cList(2) + types(2);
    elseif (material == 'blue glass')
        cList2(4) = cList(3) + types(2);
    elseif (material == 'steel/hdpe')
        cList2(4) = cList(4) + types(2);
    end
    totalBinaryString = {totalBinaryString{1:end}, binaryString};
    scanTimes = scanTimes + 1;
end

for x = 1:4
    fprintf('%s means:\n\tMaterial: %s\n Type 1: %d\n Type 2: %d\n', totalBinaryString{x}, totalMaterials{x}, totalType1(x), totalType2(x))
end

disp('The following colors are not required:')
colorOptions{find(~contains(colorOptions,totalMaterials))}

% w r b s
disp('total white:')
disp(cList(1))
disp(cList2(1))

disp('total red:')
disp(cList(2))
disp(cList2(2))

disp('total blue:')
disp(cList(3))
disp(cList2(3))

disp('total steel:')
disp(cList(4))
disp(cList2(4))
