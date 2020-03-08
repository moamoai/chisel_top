import serial
import time
# ser = serial.Serial('/dev/tty.usbserial-14310', 9600, timeout=1.0)
ser = serial.Serial('/dev/tty.usbserial-14310', 115200, timeout=0.1)

result = 1
for i in range(256):
  txd = i.to_bytes(1, 'big')
  ser.write(b'o') # switch
  ser.write(txd)  # none
  ser.write(b'0')  # none
  time.sleep(1) # 1ms
