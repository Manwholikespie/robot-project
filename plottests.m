% the indices in the matrix where the height of the scan is near white.

% function prediction = plottests(color_data)
    white = find(color_data > 600);
    whiteLengths = [];
    l = 0;
    
    for x=1:length(white)
        if x == 1
            i = white(x);
%             fprintf('start: %d\n',i);
            ; % we only care about x-1.
        else
            i = white(x);
            j = white(x-1);

            if ~(i-j == 1)
                whiteLengths = [whiteLengths, l];
%                 fprintf('stop: %d\n',j);
%                 fprintf('start: %d\n',i);
                l = 0;
            else
                l = l+1;
            end
        end
    end
%     fprintf('stop: %d\n',i);
    whiteLengths = [whiteLengths, l];
    whiteLengths./30
    prediction = round(whiteLengths./30)
% end