"""
This is a test program that I am going to be storing relevant information
regarding the python-ev3dev library.

It is important that I know how to access the data from the sensors, and
also control the motors.
"""

from ev3dev.ev3 import *
import time

# =============================   COLOR SENSOR   ===============================
sensor = ColorSensor()

# get the RGB in a range from 0-1020.
current_color = sensor.raw()

# get the light intensity reading from the marble.
light_intensity = sensor.reflected_light_intensity()

# ================================   MOTOR   ===================================
# connects to the motor in the A port.
m = LargeMotor('outA')
m.run_timed(time_sp=3000, speed_sp=500)
    # time_sp is the time in milliseconds that I want it to run... 3 seconds
    # speed_sp is in ticks/second. (need to calibrate this to find out how many
    #   equate to one rotation)
