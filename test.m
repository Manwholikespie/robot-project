% colorsensor = colorSensor(myev3);
% while true
%     marbleNum = processColor(scanColor(colorsensor));
%     if marbleNum == 13
%         ; % its looking at the ground.
%     else
%         dispMarbleType(marbleNum);
%         sizesorter(marbleNum,myev3);
%         break
%     end
%     pause(2.5)
% end

a = scanColor(colorsensor)

for x = 1:length(a)
    fprintf('%.2f ',a(x))
end