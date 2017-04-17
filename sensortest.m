test = [];
for x=1:100
    test = [test,sum(readColorRGB(mycolorsensor))];
end