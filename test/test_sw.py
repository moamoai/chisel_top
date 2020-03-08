import serial
import time
# ser = serial.Serial('/dev/tty.usbserial-14310', 9600, timeout=1.0)
ser = serial.Serial('/dev/tty.usbserial-14310', 115200, timeout=0.1)

result = 1
for i in range(256):
  # txd = bytes(i)
  txd = i.to_bytes(1, 'big')
  ser.write(b's') # switch
  ser.write(b'0')  # none
  ser.write(b'0')  # none
  rxd = ser.read(1)
  rdata = int.from_bytes(rxd, 'big')
  print("SW_IN: {0:d}".format(rdata))
  time.sleep(2) # 1ms
