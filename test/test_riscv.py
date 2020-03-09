from test_lib import *

inst_list = []
for line in open("../../chisel_riscv/inst.txt"):
  line = line.rstrip()
  line = line.split()
  inst_list.append(int(line[1], 16))

def mem_write():
  GPIO_SET(0, 1) # bd_en=1
  for i in range(0, 0x40):
    mem_write_4B(i*4, inst_list[i])
  # mem_write_4B(0    , 0x12345678)
  # mem_write_4B(8    , 0x88888888)
  # mem_write_4B(0xFC, 0xFFFFFFFF)

  for i in range(0, 0x40):
    rdata = mem_read_4B(4*i)
    if(rdata != inst_list[i]):
      print("[NG] i[{0:02x}] rdata[{1:08x}]".format(i, rdata))

  GPIO_SET(0, 0) # bd_en=0

# mem_write();
while(1):
  cmd = input()
  if(cmd=="reg_dump"):
    reg_dump()
  elif(cmd=="start"):
    GPIO_SET(0, 2) # start = 1
    GPIO_SET(0, 0) # start = 0
    status = GET_MONI(1)  # [0] inst_ready [1]error
    addr   = GET_MONI(2)  # [7:0] inst_addr
    print("[start] status: {0:08b} addr:0x{1:02x}".format(status, addr))
  elif(cmd=="valid"):
    GPIO_SET(0, 4) # inst_valid = 1
    GPIO_SET(0, 0) # inst_valid = 0
    status = GET_MONI(1)  # [0] inst_ready [1]error
    addr   = GET_MONI(2)  # [7:0] inst_addr
    print("[valid] status: {0:08b} addr:0x{1:02x}".format(status, addr))
  elif(cmd=="quit"):
    break;

# 
# 
# result = 1
# NUM=256
# for i in range(0, NUM, 4):
#   txd = i.to_bytes(1, 'big')
#   # ser.write(b'a') # memory write
#   # send_data(b'a')
#   send_data(bytes([0x61]))
#   send_data(txd) # addr
#   send_data(bytes([i + 0x0])) # wdata0
#   send_data(bytes([i + 0x1])) # wdata1
#   send_data(bytes([i + 0x2])) # wdata2
#   send_data(bytes([i + 0x3])) # wdata3
# 
# for i in range(0, NUM, 4):
#   for j in range(4):
#     addr = i.to_bytes(1, 'big')
#     ser.write(b'm') # memory read
#     ser.write(addr)  # addr
#     ser.write(bytes([j]))  # rstrb
#     rxd = ser.read(1)
#   
#     rdata = int.from_bytes(rxd, 'big')
#     if((i+j) != rdata):
#       result = 0
#       print("[NG] i[{0:02x}] rdata[{1:02x}]".format(i, rdata))
# 
#   if(i%10==0):
#     print("#### i = " + str(i))
# 
# if(result==1):
#   print("[OK] Memory Test")
# ser.close()
