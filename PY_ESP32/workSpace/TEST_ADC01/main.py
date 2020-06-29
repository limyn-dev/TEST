
# Complete project details at https://RandomNerdTutorials.com
# Created by Rui Santos

from machine import Pin, ADC, PWM
from time import sleep

#Configure ADC for ESP32
pot = ADC(Pin(34))
pot.width(ADC.WIDTH_10BIT)
pot.atten(ADC.ATTN_11DB)

while True:
    val = pot.read()
    print('Val [' + str(val) + ']')
    sleep(0.5)

