function [] = sizesorter(color,myev3)
    kickmotor=motor(myev3,'A');
    mymotor=motor(myev3,'C'); % spinning base
    myothermotor=motor(myev3,'D'); % arm

    if (color == 12)
        speeds = [65,-65];
    else
        speeds = [80,-50];
    end

    kickmotor.Speed=speeds(1);
    start(kickmotor)
    pause(0.6)
    stop(kickmotor)

    kickmotor.Speed=speeds(2);
    start(kickmotor)
    pause(1.2)
    stop(kickmotor)

    fix_constant = 0.15;

    if (color==5 | color==6)
        mymotor.Speed=30;
        start(mymotor)
        pause(1.38+fix_constant) 
        stop(mymotor)

        myothermotor.Speed=-9;
        start(myothermotor)
        pause(0.2)
        stop(myothermotor)
        pause(2)

        myothermotor.Speed=10;
        start(myothermotor)
        pause(0.3)
        stop(myothermotor)

        mymotor.Speed=-28;
        start(mymotor)
        pause(1.5)
        stop(mymotor)
        pause(1.5)
    elseif (color==1 | color==2)
        mymotor.Speed=30;
        start(mymotor)
        pause(1.75+fix_constant) 
        stop(mymotor)

        myothermotor.Speed=-9;
        start(myothermotor)
        pause(0.2)
        stop(myothermotor)
        pause(2)

        myothermotor.Speed=10;
        start(myothermotor)
        pause(0.3)
        stop(myothermotor)

        mymotor.Speed=-28;
        start(mymotor)
        pause(1.8)
        stop(mymotor)
        pause(1.5)    
    elseif (color==3 | color==4)
        mymotor.Speed=30;
        start(mymotor)
        pause(1.55+fix_constant) 
        stop(mymotor)

        myothermotor.Speed=-9;
        start(myothermotor)
        pause(0.25)
        stop(myothermotor)
        pause(2)

        myothermotor.Speed=10;
        start(myothermotor)
        pause(0.3)
        stop(myothermotor)

        mymotor.Speed=-28;
        start(mymotor)
        pause(1.6)
        stop(mymotor)
        pause(1.5)    
    elseif (color==7 | color==8 | color==9 | color==10)
        mymotor.Speed=30;
        start(mymotor)
        pause(2.05+fix_constant)
        stop(mymotor)

        myothermotor.Speed=-9;
        start(myothermotor)
        pause(0.2)
        stop(myothermotor)
        pause(2)

        myothermotor.Speed=10;
        start(myothermotor)
        pause(0.3)
        stop(myothermotor)

        mymotor.Speed=-28;
        start(mymotor)
        pause(2.5)
        stop(mymotor)
        pause(1.5)    
    elseif (color==12)
        mymotor.Speed=30;
        start(mymotor)
        pause(2.00+fix_constant)
        stop(mymotor)

        myothermotor.Speed=-9;
        start(myothermotor)
        pause(0.2)
        stop(myothermotor)
        pause(2)

        myothermotor.Speed=10;
        start(myothermotor)
        pause(0.3)
        stop(myothermotor)

        mymotor.Speed=-28;
        start(mymotor)
        pause(1.95)
        stop(mymotor)
        pause(1.5)    
    elseif (color==11)
        mymotor.Speed=30;
        start(mymotor)
        pause(2.0+fix_constant)
        stop(mymotor)

        myothermotor.Speed=-9;
        start(myothermotor)
        pause(0.2)
        stop(myothermotor)
        pause(2)

        myothermotor.Speed=10;
        start(myothermotor)
        pause(0.3)
        stop(myothermotor)

        mymotor.Speed=-28;
        start(mymotor)
        pause(1.92)
        stop(mymotor)
        pause(1.5)    
    end
end
