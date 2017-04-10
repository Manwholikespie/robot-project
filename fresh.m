clearvars -except myev3 mymotor mycolorsensor omotor
% mymotor.Speed = 10;
omotor.Speed = -30;

start(omotor)
pause(0.15)
stop(omotor)