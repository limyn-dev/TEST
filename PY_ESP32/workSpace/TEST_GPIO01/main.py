# Complete project details at https://RandomNerdTutorials.com
# Created by Rui Santos

from machine import Pin, ADC, PWM
from time import sleep

OUT1 = Pin(1, Pin.OUT)
OUT2 = Pin(2, Pin.OUT)
OUT3 = Pin(3, Pin.OUT)

#Configure ADC for ESP32
#pot = ADC(Pin(34))
#pot.width(ADC.WIDTH_10BIT)
#pot.atten(ADC.ATTN_11DB)

#Configure ADC for ESP8266
#pot = ADC(0)

while True:
    OUT1.value(not OUT1.value())
    sleep(0.5)
    OUT2.value(not OUT2.value())
    sleep(0.5)
    OUT3.value(not OUT3.value())
    sleep(0.5)    