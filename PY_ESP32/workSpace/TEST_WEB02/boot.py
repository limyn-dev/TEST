print('============================================')
print('BOOT > START')
#-----------------------------------------------------
print('BOOT > IMPORT socket')
try:
  import usocket as socket
except:
  import socket
#-----------------------------------------------------
print('BOOT > IMPORT machine Pin, ADC'              )
from machine import Pin, ADC
#----------------------------------------------------
print('BOOT > IMPORT time'                          )
from time import sleep
#----------------------------------------------------
print('BOOT > IMPORT network'                       )
import network
#----------------------------------------------------
print('BOOT > IMPORT esp'                           )
import esp
esp.osdebug(None)
#----------------------------------------------------
print('BOOT > IMPORT gc'                            )
import gc
gc.collect()
#----------------------------------------------------
WID = '++'
WPW = '123412341234'
print('BOOT > Connect [' + WID + ']'                )
station = network.WLAN(network.STA_IF)
station.active(True)
station.connect(WID, WPW)
while station.isconnected() == False:
  pass
print('BOOT > Connection successful')
print(station.ifconfig())
#----------------------------------------------------
print('BOOT > INIT Pin'                             )
LED = Pin(2, Pin.OUT)
#----------------------------------------------------
print('BOOT > INIT ADC (34)')
P34 = ADC(Pin(34))
#----------------------------------------------------
print('BOOT > END')
print('============================================')

