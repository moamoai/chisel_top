
# make binary data
bs = bytes(range(256))
with open('sample.dat', 'bw') as f:
    # f.write(bs)
    # f.write(b'0')
    f.write(bytes([0, 1]))
# with open('sample.dat', 'br') as f:
#     print(f.read())

exit()
import serial
import time
# ser = serial.Serial('/dev/tty.usbserial-14310', 9600, timeout=1.0)
ser = serial.Serial('/dev/tty.usbserial-14310', 115200, timeout=0.1)
# ser.write(b'2')
# str = ser.read(1)
# print(str)
# ser.close()
# exit()

result = 1
for i in range(256):
  # txd = bytes(i)
  txd = i.to_bytes(1, 'big')
  ser.write(b'l') # loopback cmd
  ser.write(txd)  # arg0
  ser.write(b'0')  # none
  rxd = ser.read(1)
  rdata = int.from_bytes(rxd, 'big')
  if(i != rdata):
    result = 0
    print("[NG] i[{0:02x}] rdata[{1:02x}]".format(i, rdata))
  elif(i%10==0):
    print("#### i = " + str(i))

  # time.sleep(0.001) # 1ms

if(result==1):
  print("[OK] Serial Test")
ser.close()

# exit()
# 
# ser.write(b'2')
# str = ser.read(1)
# print(type(str))
# for i in range(1,10):
#   ser.write(i)
#   str = ser.read(1)
#   print(str)
# 
# # ser.write(b'2')
# # str = ser.read(1)
# # print(str)
# # str = ser.read(1)
# # line = ser.readline()
# # print(line)
# # ser.close()
