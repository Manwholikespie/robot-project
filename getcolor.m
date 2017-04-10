function [total, isRed] = getcolor(scanData)
  total = sum(scanData);

  isRed = (scanData(1) > 3*scanData(2)) || (scanData(1) > 3*scanData(3));
end
