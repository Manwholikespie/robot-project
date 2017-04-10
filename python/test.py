from ev3dev.ev3 import *
import time

sensor = ColorSensor()
m = LargeMotor('outA')

def categorizeColor(current_color,light_intensity):
    # current_color[0] is red value (0-1020)
    # current_color[1] is green value (0-1020)
    # current_color[2] is blue value (0-1020)

while True:
    # go ahead and rotate the motor to drop a single marble down.
    m.run_timed(time_sp=3000, speed_sp=500)
        # TODO: figure out what speed_sp needs to be for a full rotation.

    # check the color value of the marble.
    current_color = sensor.raw()
    light_intensity = sensor.reflected_light_intensity()
