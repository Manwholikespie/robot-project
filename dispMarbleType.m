function [] = dispMarbleType(marbleNum)
    a = '';
    switch (marbleNum)
        case 1
            a = 'big white';
        case 2
            a = 'small white';
        case 3
            a = 'big red';
        case 4
            a = 'small red';
        case 5
            a = 'big blue';
        case 6
            a = 'small blue';
        case 7
            a = 'big green';
        case 8
            a = 'small green';
        case 9
            a = 'big yellow';
        case 10
            a = 'small yellow';
        case 11
            a = 'steel';
        case 12
            a = 'hdpe';
        case 13
            a = 'ground';
    end
    
    disp(a)
end