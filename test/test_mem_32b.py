import time
import serial
# from serial import *

# ser = serial.Serial('/dev/tty.usbserial-14310', 9600, timeout=1.0)
# ser = serial.Serial('/dev/tty.usbserial-14310',  38400, timeout=1.0)
ser = serial.Serial('/dev/tty.usbserial-14310', 115200, timeout=1.0, parity=serial.PARITY_ODD, stopbits=serial.STOPBITS_TWO)

# # bd_en=1
ser.write(b'o')
ser.write(bytes([0x0]))
ser.write(bytes([0x1]))

MARGIN=0.000
def send_data(txd):
  # print("send_data: "+str(txd))
  ser.write(txd) # memory write
  time.sleep(MARGIN)

result = 1
NUM=256
for i in range(0, NUM, 4):
  txd = i.to_bytes(1, 'big')
  # ser.write(b'a') # memory write
  # send_data(b'a')
  send_data(bytes([0x61]))
  send_data(txd) # addr
  send_data(bytes([i + 0x0])) # wdata0
  send_data(bytes([i + 0x1])) # wdata1
  send_data(bytes([i + 0x2])) # wdata2
  send_data(bytes([i + 0x3])) # wdata3

for i in range(0, NUM, 4):
  for j in range(4):
    addr = i.to_bytes(1, 'big')
    ser.write(b'm') # memory read
    ser.write(addr)  # addr
    ser.write(bytes([j]))  # rstrb
    rxd = ser.read(1)
  
    rdata = int.from_bytes(rxd, 'big')
    if((i+j) != rdata):
      result = 0
      print("[NG] i[{0:02x}] rdata[{1:02x}]".format(i, rdata))

  if(i%10==0):
    print("#### i = " + str(i))

if(result==1):
  print("[OK] Memory Test")
ser.close()
