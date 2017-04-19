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
    pause(0.5)
    stop(kickmotor)

    kickmotor.Speed=speeds(2);
    start(kickmotor)
    pause(1.2)
    stop(kickmotor)

    fix_constant = -1.0;

    if (color==5 | color==6)
        mymotor.Speed=50;
        start(mymotor)
        pause(1.56+fix_constant) 
        stop(mymotor)

        myothermotor.Speed=-9;
        start(myothermotor)
        pause(0.2)
        stop(myothermotor)
        pause(1)

        myothermotor.Speed=10;
        start(myothermotor)
        pause(0.25)
        stop(myothermotor)

        mymotor.Speed=-50;
        start(mymotor)
        pause(0.6)
        stop(mymotor)
        pause(1.5)
    elseif (color==1 | color==2)
        mymotor.Speed=50;
        start(mymotor)
        pause(1.68+fix_constant) 
        stop(mymotor)

        myothermotor.Speed=-9;
        start(myothermotor)
        pause(0.2)
        stop(myothermotor)
        pause(1)

        myothermotor.Speed=10;
        start(myothermotor)
        pause(0.25)
        stop(myothermotor)

        mymotor.Speed=-50;
        start(mymotor)
        pause(0.8)
        stop(mymotor)
        pause(1.5)    
    elseif (color==3 | color==4)
        mymotor.Speed=50;
        start(mymotor)
        pause(1.63+fix_constant) 
        stop(mymotor)

        myothermotor.Speed=-9;
        start(myothermotor)
        pause(0.25)
        stop(myothermotor)
        pause(1)

        myothermotor.Speed=10;
        start(myothermotor)
        pause(0.25)
        stop(myothermotor)

        mymotor.Speed=-50;
        start(mymotor)
        pause(0.6)
        stop(mymotor)
        pause(1.5)    
    elseif (color==7 | color==8 | color==9 | color==10)
        mymotor.Speed=45;
        start(mymotor)
        pause(1.97+fix_constant)
        stop(mymotor)

        myothermotor.Speed=-9;
        start(myothermotor)
        pause(0.2)
        stop(myothermotor)
        pause(1)

        myothermotor.Speed=10;
        start(myothermotor)
        pause(0.28)
        stop(myothermotor)

        mymotor.Speed=-50;
        start(mymotor)
        pause(1.7)
        stop(mymotor)
        pause(1.5)    
    elseif (color==12)
        mymotor.Speed=50;
        start(mymotor)
        pause(1.73+fix_constant)
        stop(mymotor)

        myothermotor.Speed=-9;
        start(myothermotor)
        pause(0.2)
        stop(myothermotor)
        pause(1)

        myothermotor.Speed=10;
        start(myothermotor)
        pause(0.25)
        stop(myothermotor)

        mymotor.Speed=-50;
        start(mymotor)
        pause(0.9)
        stop(mymotor)
        pause(1.5)    
    elseif (color==11)
        mymotor.Speed=50;
        start(mymotor)
        pause(1.79+fix_constant)
        stop(mymotor)

        myothermotor.Speed=-9;
        start(myothermotor)
        pause(0.25)
        stop(myothermotor)
        pause(1)
        
        myothermotor.Speed=10;
        start(myothermotor)
        pause(0.25)
        stop(myothermotor)

        mymotor.Speed=-50;
        start(mymotor)
        pause(0.9)
        stop(mymotor)
        pause(1.5)    
    end
end
