import serial
import time
# ser = serial.Serial('/dev/tty.usbserial-14310', 9600, timeout=1.0)
# ser = serial.Serial('/dev/tty.usbserial-14310',  38400, timeout=1.0)
ser = serial.Serial('/dev/tty.usbserial-14310', 115200, timeout=1.0)

MARGIN=0.000
result = 1
for i in range(256):
  txd = i.to_bytes(1, 'big')
  ser.write(b'w') # memory write
  ser.write(txd)  # addr
  time.sleep(MARGIN)
  ser.write(txd)  # wdata
  # rxd = ser.read(1)
  time.sleep(MARGIN)

for i in range(256):
  addr = i.to_bytes(1, 'big')
  ser.write(b'm') # memory read
  ser.write(addr)  # addr
  ser.write(b'0')  # none
  #time.sleep(MARGIN) # 1ms
  rxd = ser.read(1)
  # time.sleep(MARGIN) # 1ms

  rdata = int.from_bytes(rxd, 'big')
  if(i != rdata):
    result = 0
    print("[NG] i[{0:02x}] rdata[{1:02x}]".format(i, rdata))

  if(i%10==0):
    print("#### i = " + str(i))

if(result==1):
  print("[OK] Memory Test")
ser.close()
