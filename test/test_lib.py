import time
import serial
# from serial import *

# ser = serial.Serial('/dev/tty.usbserial-14310', 9600, timeout=1.0)
# ser = serial.Serial('/dev/tty.usbserial-14310',  38400, timeout=1.0)
ser = serial.Serial('/dev/tty.usbserial-14310', 115200, timeout=1.0, parity=serial.PARITY_ODD)

MARGIN=0.000
def send_data(txd):
  # print("send_data: "+str(txd))
  ser.write(txd) # memory write
  time.sleep(MARGIN)

def GPIO_SET(vec, bit):
  ser.write(b'o')
  ser.write(bytes([vec]))
  ser.write(bytes([bit]))

def GET_MONI(vec):
  ser.write(b's') # switch
  ser.write(bytes([vec])) # vec
  ser.write(b'0')  # none
  rxd = ser.read(1)
  rdata = int.from_bytes(rxd, 'big')
  # print("REG[0x{0:02x}] MONI[0x{1:02x}]".format(vec, rdata))
  return rdata
  
def reg_dump():
  for i in range(0, 32):
    GPIO_SET(1, i)    # [4:0] reg_sel
    mon = GET_MONI(3) # info_rf(reg_sel
    print("REG[0x{0:02x}] MONI[0x{1:02x}]".format(i, mon))
   
 
def mem_write_4B(addr, wdata):
  # ser.write(b'a') # memory write
  # send_data(b'a')
  send_data(bytes([0x61]))
  send_data(bytes([addr&0xFF])) # addr
  for i in range(4):
    send_data(bytes([(wdata>>(8*i)) &0xFF])) # wdata

def mem_read_4B(addr):
  rdata = 0
  for i in range(4):
    baddr = (addr+i).to_bytes(1, 'big')
    ser.write(b'm') # memory read
    ser.write(baddr)  # addr
    ser.write(bytes([i]))  # rstrb
    rxd   = ser.read(1)
    rxd = int.from_bytes(rxd, 'big')
    rdata += (rxd<<(8*i))
  print("# read_4B addr[0x{0:02x}] rdata[0x{1:08x}]".format(addr, rdata))
  return rdata

