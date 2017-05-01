function [enough, marbleLog] = compareMarbles(marbleLog, barcode)

%marbleLog = [1, s(blue), l(blue), 2, s(red), 3, s(white), l(white), 4, hdpe,
%steel]

%barcode = [1, s(blue), l(blue), 2, s(red), 3, s(white), l(white), 4, hdpe,
%steel]


enough = true;

for(n = 1:3:12)
    if(enough)
        marbleLog(n + 1) = marbleLog(n + 1) - barcode(n + 1);
        marbleLog(n + 2) = marbleLog(n + 2) - barcode(n + 2);
        
        if((marbleLog(n + 1) <= 0)||(marbleLog(n + 2) <= 0))
            enough = false;
        end
    end
end

enough
marbleLog


end