module Counter(
  input         clock,
  input         reset,
  input         io_en,
  input         io_rst,
  output [15:0] io_out
);
  reg [15:0] r_cnt; // @[Counter.scala 19:22]
  reg [31:0] _RAND_0;
  wire [15:0] _T_3; // @[Counter.scala 23:20]
  assign _T_3 = r_cnt + 16'h1; // @[Counter.scala 23:20]
  assign io_out = r_cnt; // @[Counter.scala 27:10]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  r_cnt = _RAND_0[15:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      r_cnt <= 16'h0;
    end else if (io_rst) begin
      r_cnt <= 16'h0;
    end else if (io_en) begin
      r_cnt <= _T_3;
    end
  end
endmodule
module Counter_1(
  input        clock,
  input        reset,
  input        io_en,
  input        io_rst,
  output [7:0] io_out
);
  reg [7:0] r_cnt; // @[Counter.scala 19:22]
  reg [31:0] _RAND_0;
  wire [7:0] _T_3; // @[Counter.scala 23:20]
  assign _T_3 = r_cnt + 8'h1; // @[Counter.scala 23:20]
  assign io_out = r_cnt; // @[Counter.scala 27:10]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  r_cnt = _RAND_0[7:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      r_cnt <= 8'h0;
    end else if (io_rst) begin
      r_cnt <= 8'h0;
    end else if (io_en) begin
      r_cnt <= _T_3;
    end
  end
endmodule
module UartRX(
  input        clock,
  input        reset,
  input        io_RD,
  output [7:0] io_recdata,
  output       io_received
);
  wire  i_counter_clock; // @[UartRX.scala 33:29]
  wire  i_counter_reset; // @[UartRX.scala 33:29]
  wire  i_counter_io_en; // @[UartRX.scala 33:29]
  wire  i_counter_io_rst; // @[UartRX.scala 33:29]
  wire [15:0] i_counter_io_out; // @[UartRX.scala 33:29]
  wire  i_uart_cnt_clock; // @[UartRX.scala 40:28]
  wire  i_uart_cnt_reset; // @[UartRX.scala 40:28]
  wire  i_uart_cnt_io_en; // @[UartRX.scala 40:28]
  wire  i_uart_cnt_io_rst; // @[UartRX.scala 40:28]
  wire [7:0] i_uart_cnt_io_out; // @[UartRX.scala 40:28]
  reg [1:0] state; // @[UartRX.scala 25:22]
  reg [31:0] _RAND_0;
  wire  _T_2; // @[UartRX.scala 34:27]
  wire [15:0] _T_4; // @[UartRX.scala 34:74]
  wire [15:0] counter_out; // @[UartRX.scala 32:25 UartRX.scala 36:15]
  wire  _T_5; // @[UartRX.scala 34:58]
  wire  _T_6; // @[UartRX.scala 34:42]
  wire  _T_7; // @[UartRX.scala 35:27]
  wire [15:0] _T_9; // @[UartRX.scala 35:74]
  wire  _T_10; // @[UartRX.scala 35:58]
  wire  _T_11; // @[UartRX.scala 35:42]
  wire  incr_uart_cnt; // @[UartRX.scala 34:82]
  wire  _T_13; // @[UartRX.scala 37:46]
  wire  _T_16; // @[Conditional.scala 37:30]
  wire  _T_17; // @[UartRX.scala 49:14]
  wire  _T_18; // @[Conditional.scala 37:30]
  wire  _T_22; // @[Conditional.scala 37:30]
  wire [15:0] uart_cnt_out; // @[UartRX.scala 41:26 UartRX.scala 44:21]
  wire  _T_23; // @[UartRX.scala 59:25]
  wire  _GEN_5; // @[Conditional.scala 39:67]
  wire  _GEN_7; // @[Conditional.scala 39:67]
  wire  clr_uart_cnt; // @[Conditional.scala 40:58]
  reg [7:0] r_recdata; // @[UartRX.scala 66:26]
  reg [31:0] _RAND_1;
  wire [6:0] _T_25; // @[UartRX.scala 68:35]
  wire [7:0] _T_26; // @[Cat.scala 29:58]
  wire  _T_29; // @[UartRX.scala 74:54]
  Counter i_counter ( // @[UartRX.scala 33:29]
    .clock(i_counter_clock),
    .reset(i_counter_reset),
    .io_en(i_counter_io_en),
    .io_rst(i_counter_io_rst),
    .io_out(i_counter_io_out)
  );
  Counter_1 i_uart_cnt ( // @[UartRX.scala 40:28]
    .clock(i_uart_cnt_clock),
    .reset(i_uart_cnt_reset),
    .io_en(i_uart_cnt_io_en),
    .io_rst(i_uart_cnt_io_rst),
    .io_out(i_uart_cnt_io_out)
  );
  assign _T_2 = state == 2'h1; // @[UartRX.scala 34:27]
  assign _T_4 = 16'h65b - 16'h1; // @[UartRX.scala 34:74]
  assign counter_out = i_counter_io_out; // @[UartRX.scala 32:25 UartRX.scala 36:15]
  assign _T_5 = counter_out == _T_4; // @[UartRX.scala 34:58]
  assign _T_6 = _T_2 & _T_5; // @[UartRX.scala 34:42]
  assign _T_7 = state == 2'h2; // @[UartRX.scala 35:27]
  assign _T_9 = 16'h43d - 16'h1; // @[UartRX.scala 35:74]
  assign _T_10 = counter_out == _T_9; // @[UartRX.scala 35:58]
  assign _T_11 = _T_7 & _T_10; // @[UartRX.scala 35:42]
  assign incr_uart_cnt = _T_6 | _T_11; // @[UartRX.scala 34:82]
  assign _T_13 = state == 2'h0; // @[UartRX.scala 37:46]
  assign _T_16 = 2'h0 == state; // @[Conditional.scala 37:30]
  assign _T_17 = io_RD == 1'h0; // @[UartRX.scala 49:14]
  assign _T_18 = 2'h1 == state; // @[Conditional.scala 37:30]
  assign _T_22 = 2'h2 == state; // @[Conditional.scala 37:30]
  assign uart_cnt_out = {{8'd0}, i_uart_cnt_io_out}; // @[UartRX.scala 41:26 UartRX.scala 44:21]
  assign _T_23 = uart_cnt_out == 16'ha; // @[UartRX.scala 59:25]
  assign _GEN_5 = _T_22 & _T_23; // @[Conditional.scala 39:67]
  assign _GEN_7 = _T_18 ? 1'h0 : _GEN_5; // @[Conditional.scala 39:67]
  assign clr_uart_cnt = _T_16 ? 1'h0 : _GEN_7; // @[Conditional.scala 40:58]
  assign _T_25 = r_recdata[7:1]; // @[UartRX.scala 68:35]
  assign _T_26 = {io_RD,_T_25}; // @[Cat.scala 29:58]
  assign _T_29 = uart_cnt_out == 16'h8; // @[UartRX.scala 74:54]
  assign io_recdata = r_recdata; // @[UartRX.scala 76:15]
  assign io_received = incr_uart_cnt & _T_29; // @[UartRX.scala 77:15]
  assign i_counter_clock = clock;
  assign i_counter_reset = reset;
  assign i_counter_io_en = state != 2'h0; // @[UartRX.scala 38:20]
  assign i_counter_io_rst = incr_uart_cnt | _T_13; // @[UartRX.scala 37:20]
  assign i_uart_cnt_clock = clock;
  assign i_uart_cnt_reset = reset;
  assign i_uart_cnt_io_en = _T_6 | _T_11; // @[UartRX.scala 43:21]
  assign i_uart_cnt_io_rst = _T_16 ? 1'h0 : _GEN_7; // @[UartRX.scala 42:21]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  r_recdata = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      state <= 2'h0;
    end else if (_T_16) begin
      if (_T_17) begin
        state <= 2'h1;
      end
    end else if (_T_18) begin
      if (_T_5) begin
        state <= 2'h2;
      end
    end else if (_T_22) begin
      if (_T_23) begin
        state <= 2'h0;
      end
    end
    if (reset) begin
      r_recdata <= 8'h0;
    end else if (incr_uart_cnt) begin
      r_recdata <= _T_26;
    end else if (clr_uart_cnt) begin
      r_recdata <= 8'h0;
    end
  end
endmodule
module Counter_2(
  input        clock,
  input        reset,
  input        io_en,
  input        io_rst,
  output [2:0] io_out
);
  reg [2:0] r_cnt; // @[Counter.scala 19:22]
  reg [31:0] _RAND_0;
  wire [2:0] _T_3; // @[Counter.scala 23:20]
  assign _T_3 = r_cnt + 3'h1; // @[Counter.scala 23:20]
  assign io_out = r_cnt; // @[Counter.scala 27:10]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  r_cnt = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      r_cnt <= 3'h0;
    end else if (io_rst) begin
      r_cnt <= 3'h0;
    end else if (io_en) begin
      r_cnt <= _T_3;
    end
  end
endmodule
module Terminal(
  input         clock,
  input         reset,
  input         io_in_en,
  input  [7:0]  io_in_data,
  output        io_transmit,
  output [7:0]  io_txdata,
  output        io_idle,
  input  [7:0]  io_MONITOR_0,
  input  [7:0]  io_MONITOR_1,
  input  [7:0]  io_MONITOR_2,
  input  [7:0]  io_MONITOR_3,
  output [7:0]  io_GPIO_0,
  output [7:0]  io_GPIO_1,
  output        io_we,
  output [31:0] io_addr,
  output [31:0] io_wdata,
  input  [31:0] io_rdata
);
  wire  i_cnt_clock; // @[Terminal.scala 59:22]
  wire  i_cnt_reset; // @[Terminal.scala 59:22]
  wire  i_cnt_io_en; // @[Terminal.scala 59:22]
  wire  i_cnt_io_rst; // @[Terminal.scala 59:22]
  wire [2:0] i_cnt_io_out; // @[Terminal.scala 59:22]
  reg [7:0] r_in_data_0; // @[Terminal.scala 43:26]
  reg [31:0] _RAND_0;
  reg [7:0] r_in_data_1; // @[Terminal.scala 43:26]
  reg [31:0] _RAND_1;
  reg [7:0] r_in_data_2; // @[Terminal.scala 43:26]
  reg [31:0] _RAND_2;
  reg [7:0] r_in_data_3; // @[Terminal.scala 43:26]
  reg [31:0] _RAND_3;
  reg [7:0] r_in_data_4; // @[Terminal.scala 43:26]
  reg [31:0] _RAND_4;
  reg [7:0] r_in_data_5; // @[Terminal.scala 43:26]
  reg [31:0] _RAND_5;
  wire [2:0] w_cnt_out; // @[Terminal.scala 41:23 Terminal.scala 61:16]
  wire  _T_2; // @[Terminal.scala 64:28]
  wire  _T_3; // @[Terminal.scala 64:52]
  wire  _T_4; // @[Terminal.scala 64:38]
  wire  _T_5; // @[Terminal.scala 65:27]
  wire  _T_6; // @[Terminal.scala 65:52]
  wire  _T_7; // @[Terminal.scala 65:38]
  wire  received_cmd; // @[Terminal.scala 64:62]
  wire  _T_9; // @[Terminal.scala 73:34]
  wire  s_cmd; // @[Terminal.scala 73:26]
  wire  _T_11; // @[Terminal.scala 74:34]
  wire  m_cmd; // @[Terminal.scala 74:26]
  wire  _T_13; // @[Terminal.scala 75:34]
  wire  w_cmd; // @[Terminal.scala 75:26]
  wire  a_cmd; // @[Terminal.scala 76:26]
  wire  _T_17; // @[Terminal.scala 77:34]
  wire  l_cmd; // @[Terminal.scala 77:26]
  wire  _T_19; // @[Terminal.scala 78:34]
  wire  o_cmd; // @[Terminal.scala 78:26]
  reg  r_m_cmd; // @[Terminal.scala 80:24]
  reg [31:0] _RAND_6;
  reg [7:0] r_GPIO_0; // @[Terminal.scala 86:26]
  reg [31:0] _RAND_7;
  reg [7:0] r_GPIO_1; // @[Terminal.scala 86:26]
  reg [31:0] _RAND_8;
  wire [1:0] _T_24;
  wire [7:0] _GEN_17; // @[Terminal.scala 94:12]
  wire [7:0] _GEN_18; // @[Terminal.scala 94:12]
  wire [7:0] _GEN_19; // @[Terminal.scala 94:12]
  wire  _T_26; // @[Terminal.scala 98:16]
  wire [7:0] _T_27; // @[Terminal.scala 99:26]
  wire  _T_28; // @[Terminal.scala 100:22]
  wire [7:0] _T_29; // @[Terminal.scala 101:26]
  wire  _T_30; // @[Terminal.scala 102:22]
  wire [7:0] _T_31; // @[Terminal.scala 103:26]
  wire  _T_32; // @[Terminal.scala 104:22]
  wire [7:0] _T_33; // @[Terminal.scala 105:26]
  wire [7:0] _GEN_20; // @[Terminal.scala 104:29]
  wire [7:0] _GEN_21; // @[Terminal.scala 102:29]
  wire [7:0] _GEN_22; // @[Terminal.scala 100:29]
  wire [7:0] _GEN_23; // @[Terminal.scala 98:23]
  wire [7:0] _GEN_24; // @[Terminal.scala 95:28]
  wire [7:0] _GEN_25; // @[Terminal.scala 93:26]
  wire [15:0] _T_36; // @[Cat.scala 29:58]
  wire [15:0] _T_37; // @[Cat.scala 29:58]
  wire  _T_42; // @[Terminal.scala 126:24]
  Counter_2 i_cnt ( // @[Terminal.scala 59:22]
    .clock(i_cnt_clock),
    .reset(i_cnt_reset),
    .io_en(i_cnt_io_en),
    .io_rst(i_cnt_io_rst),
    .io_out(i_cnt_io_out)
  );
  assign w_cnt_out = i_cnt_io_out; // @[Terminal.scala 41:23 Terminal.scala 61:16]
  assign _T_2 = r_in_data_0 != 8'h61; // @[Terminal.scala 64:28]
  assign _T_3 = w_cnt_out == 3'h3; // @[Terminal.scala 64:52]
  assign _T_4 = _T_2 & _T_3; // @[Terminal.scala 64:38]
  assign _T_5 = r_in_data_0 == 8'h61; // @[Terminal.scala 65:27]
  assign _T_6 = w_cnt_out == 3'h6; // @[Terminal.scala 65:52]
  assign _T_7 = _T_5 & _T_6; // @[Terminal.scala 65:38]
  assign received_cmd = _T_4 | _T_7; // @[Terminal.scala 64:62]
  assign _T_9 = r_in_data_0 == 8'h73; // @[Terminal.scala 73:34]
  assign s_cmd = received_cmd & _T_9; // @[Terminal.scala 73:26]
  assign _T_11 = r_in_data_0 == 8'h6d; // @[Terminal.scala 74:34]
  assign m_cmd = received_cmd & _T_11; // @[Terminal.scala 74:26]
  assign _T_13 = r_in_data_0 == 8'h77; // @[Terminal.scala 75:34]
  assign w_cmd = received_cmd & _T_13; // @[Terminal.scala 75:26]
  assign a_cmd = received_cmd & _T_5; // @[Terminal.scala 76:26]
  assign _T_17 = r_in_data_0 == 8'h6c; // @[Terminal.scala 77:34]
  assign l_cmd = received_cmd & _T_17; // @[Terminal.scala 77:26]
  assign _T_19 = r_in_data_0 == 8'h6f; // @[Terminal.scala 78:34]
  assign o_cmd = received_cmd & _T_19; // @[Terminal.scala 78:26]
  assign _T_24 = r_in_data_1[1:0];
  assign _GEN_17 = 2'h1 == _T_24 ? io_MONITOR_1 : io_MONITOR_0; // @[Terminal.scala 94:12]
  assign _GEN_18 = 2'h2 == _T_24 ? io_MONITOR_2 : _GEN_17; // @[Terminal.scala 94:12]
  assign _GEN_19 = 2'h3 == _T_24 ? io_MONITOR_3 : _GEN_18; // @[Terminal.scala 94:12]
  assign _T_26 = r_in_data_2 == 8'h0; // @[Terminal.scala 98:16]
  assign _T_27 = io_rdata[7:0]; // @[Terminal.scala 99:26]
  assign _T_28 = r_in_data_2 == 8'h1; // @[Terminal.scala 100:22]
  assign _T_29 = io_rdata[15:8]; // @[Terminal.scala 101:26]
  assign _T_30 = r_in_data_2 == 8'h2; // @[Terminal.scala 102:22]
  assign _T_31 = io_rdata[23:16]; // @[Terminal.scala 103:26]
  assign _T_32 = r_in_data_2 == 8'h3; // @[Terminal.scala 104:22]
  assign _T_33 = io_rdata[31:24]; // @[Terminal.scala 105:26]
  assign _GEN_20 = _T_32 ? _T_33 : 8'h0; // @[Terminal.scala 104:29]
  assign _GEN_21 = _T_30 ? _T_31 : _GEN_20; // @[Terminal.scala 102:29]
  assign _GEN_22 = _T_28 ? _T_29 : _GEN_21; // @[Terminal.scala 100:29]
  assign _GEN_23 = _T_26 ? _T_27 : _GEN_22; // @[Terminal.scala 98:23]
  assign _GEN_24 = r_m_cmd ? _GEN_23 : 8'h0; // @[Terminal.scala 95:28]
  assign _GEN_25 = s_cmd ? _GEN_19 : _GEN_24; // @[Terminal.scala 93:26]
  assign _T_36 = {r_in_data_3,r_in_data_2}; // @[Cat.scala 29:58]
  assign _T_37 = {r_in_data_5,r_in_data_4}; // @[Cat.scala 29:58]
  assign _T_42 = s_cmd | l_cmd; // @[Terminal.scala 126:24]
  assign io_transmit = _T_42 | r_m_cmd; // @[Terminal.scala 126:15]
  assign io_txdata = l_cmd ? r_in_data_1 : _GEN_25; // @[Terminal.scala 127:15]
  assign io_idle = i_cnt_io_out == 3'h0; // @[Terminal.scala 124:11]
  assign io_GPIO_0 = r_GPIO_0; // @[Terminal.scala 114:11]
  assign io_GPIO_1 = r_GPIO_1; // @[Terminal.scala 114:11]
  assign io_we = w_cmd | a_cmd; // @[Terminal.scala 120:12]
  assign io_addr = {{24'd0}, r_in_data_1}; // @[Terminal.scala 121:12]
  assign io_wdata = {_T_37,_T_36}; // @[Terminal.scala 122:12]
  assign i_cnt_clock = clock;
  assign i_cnt_reset = reset;
  assign i_cnt_io_en = io_in_en; // @[Terminal.scala 62:16]
  assign i_cnt_io_rst = _T_4 | _T_7; // @[Terminal.scala 63:16]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  r_in_data_0 = _RAND_0[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  r_in_data_1 = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  r_in_data_2 = _RAND_2[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  r_in_data_3 = _RAND_3[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  r_in_data_4 = _RAND_4[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  r_in_data_5 = _RAND_5[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  r_m_cmd = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  r_GPIO_0 = _RAND_7[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  r_GPIO_1 = _RAND_8[7:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      r_in_data_0 <= 8'h0;
    end else if (io_in_en) begin
      if (3'h0 == w_cnt_out) begin
        r_in_data_0 <= io_in_data;
      end
    end
    if (reset) begin
      r_in_data_1 <= 8'h0;
    end else if (io_in_en) begin
      if (3'h1 == w_cnt_out) begin
        r_in_data_1 <= io_in_data;
      end
    end
    if (reset) begin
      r_in_data_2 <= 8'h0;
    end else if (io_in_en) begin
      if (3'h2 == w_cnt_out) begin
        r_in_data_2 <= io_in_data;
      end
    end
    if (reset) begin
      r_in_data_3 <= 8'h0;
    end else if (io_in_en) begin
      if (3'h3 == w_cnt_out) begin
        r_in_data_3 <= io_in_data;
      end
    end
    if (reset) begin
      r_in_data_4 <= 8'h0;
    end else if (io_in_en) begin
      if (3'h4 == w_cnt_out) begin
        r_in_data_4 <= io_in_data;
      end
    end
    if (reset) begin
      r_in_data_5 <= 8'h0;
    end else if (io_in_en) begin
      if (3'h5 == w_cnt_out) begin
        r_in_data_5 <= io_in_data;
      end
    end
    if (reset) begin
      r_m_cmd <= 1'h0;
    end else begin
      r_m_cmd <= m_cmd;
    end
    if (reset) begin
      r_GPIO_0 <= 8'h0;
    end else if (o_cmd) begin
      if (2'h0 == _T_24) begin
        r_GPIO_0 <= r_in_data_2;
      end
    end
    if (reset) begin
      r_GPIO_1 <= 8'h0;
    end else if (o_cmd) begin
      if (2'h1 == _T_24) begin
        r_GPIO_1 <= r_in_data_2;
      end
    end
  end
endmodule
module UartTX(
  input        clock,
  input        reset,
  input        io_transmit,
  input  [7:0] io_txdata,
  output       io_TD
);
  wire  i_tx_cnt_clock; // @[UartTX.scala 29:25]
  wire  i_tx_cnt_reset; // @[UartTX.scala 29:25]
  wire  i_tx_cnt_io_en; // @[UartTX.scala 29:25]
  wire  i_tx_cnt_io_rst; // @[UartTX.scala 29:25]
  wire [15:0] i_tx_cnt_io_out; // @[UartTX.scala 29:25]
  wire  i_txd_cnt_clock; // @[UartTX.scala 36:28]
  wire  i_txd_cnt_reset; // @[UartTX.scala 36:28]
  wire  i_txd_cnt_io_en; // @[UartTX.scala 36:28]
  wire  i_txd_cnt_io_rst; // @[UartTX.scala 36:28]
  wire [7:0] i_txd_cnt_io_out; // @[UartTX.scala 36:28]
  reg [7:0] r_txdata; // @[UartTX.scala 22:25]
  reg [31:0] _RAND_0;
  reg  r_TD; // @[UartTX.scala 23:25]
  reg [31:0] _RAND_1;
  reg [2:0] tx_state; // @[UartTX.scala 26:25]
  reg [31:0] _RAND_2;
  wire  _T; // @[UartTX.scala 32:47]
  wire [15:0] tx_cnt; // @[UartTX.scala 28:23 UartTX.scala 31:19]
  wire  incr_txd_cnt; // @[UartTX.scala 40:31]
  wire  _T_4; // @[Conditional.scala 37:30]
  wire  _T_6; // @[Conditional.scala 37:30]
  wire  _T_8; // @[Conditional.scala 37:30]
  wire  _T_9; // @[UartTX.scala 61:23]
  wire [6:0] _T_11; // @[UartTX.scala 63:29]
  wire [7:0] txd_cnt; // @[UartTX.scala 35:26 UartTX.scala 43:20]
  wire  _T_12; // @[UartTX.scala 65:21]
  wire  _T_14; // @[UartTX.scala 65:29]
  wire  _T_15; // @[Conditional.scala 37:30]
  wire  _T_17; // @[Conditional.scala 37:30]
  wire  _T_18; // @[UartTX.scala 79:21]
  wire  _T_20; // @[UartTX.scala 79:29]
  wire  _GEN_10; // @[Conditional.scala 39:67]
  wire  _GEN_12; // @[Conditional.scala 39:67]
  wire  _GEN_13; // @[Conditional.scala 39:67]
  wire  _GEN_15; // @[Conditional.scala 39:67]
  wire  _GEN_16; // @[Conditional.scala 39:67]
  wire  _GEN_19; // @[Conditional.scala 39:67]
  wire  _GEN_20; // @[Conditional.scala 39:67]
  wire  _GEN_23; // @[Conditional.scala 39:67]
  wire  _GEN_24; // @[Conditional.scala 40:58]
  Counter i_tx_cnt ( // @[UartTX.scala 29:25]
    .clock(i_tx_cnt_clock),
    .reset(i_tx_cnt_reset),
    .io_en(i_tx_cnt_io_en),
    .io_rst(i_tx_cnt_io_rst),
    .io_out(i_tx_cnt_io_out)
  );
  Counter_1 i_txd_cnt ( // @[UartTX.scala 36:28]
    .clock(i_txd_cnt_clock),
    .reset(i_txd_cnt_reset),
    .io_en(i_txd_cnt_io_en),
    .io_rst(i_txd_cnt_io_rst),
    .io_out(i_txd_cnt_io_out)
  );
  assign _T = tx_state == 3'h0; // @[UartTX.scala 32:47]
  assign tx_cnt = i_tx_cnt_io_out; // @[UartTX.scala 28:23 UartTX.scala 31:19]
  assign incr_txd_cnt = tx_cnt == 16'h43d; // @[UartTX.scala 40:31]
  assign _T_4 = 3'h0 == tx_state; // @[Conditional.scala 37:30]
  assign _T_6 = 3'h1 == tx_state; // @[Conditional.scala 37:30]
  assign _T_8 = 3'h2 == tx_state; // @[Conditional.scala 37:30]
  assign _T_9 = r_txdata[0]; // @[UartTX.scala 61:23]
  assign _T_11 = r_txdata[7:1]; // @[UartTX.scala 63:29]
  assign txd_cnt = i_txd_cnt_io_out; // @[UartTX.scala 35:26 UartTX.scala 43:20]
  assign _T_12 = txd_cnt == 8'h8; // @[UartTX.scala 65:21]
  assign _T_14 = _T_12 & incr_txd_cnt; // @[UartTX.scala 65:29]
  assign _T_15 = 3'h3 == tx_state; // @[Conditional.scala 37:30]
  assign _T_17 = 3'h4 == tx_state; // @[Conditional.scala 37:30]
  assign _T_18 = txd_cnt == 8'h1; // @[UartTX.scala 79:21]
  assign _T_20 = _T_18 & incr_txd_cnt; // @[UartTX.scala 79:29]
  assign _GEN_10 = _T_17 | r_TD; // @[Conditional.scala 39:67]
  assign _GEN_12 = _T_17 & _T_20; // @[Conditional.scala 39:67]
  assign _GEN_13 = _T_15 ? 1'h0 : _GEN_10; // @[Conditional.scala 39:67]
  assign _GEN_15 = _T_15 ? incr_txd_cnt : _GEN_12; // @[Conditional.scala 39:67]
  assign _GEN_16 = _T_8 ? _T_9 : _GEN_13; // @[Conditional.scala 39:67]
  assign _GEN_19 = _T_8 ? _T_14 : _GEN_15; // @[Conditional.scala 39:67]
  assign _GEN_20 = _T_6 ? 1'h0 : _GEN_16; // @[Conditional.scala 39:67]
  assign _GEN_23 = _T_6 ? 1'h0 : _GEN_19; // @[Conditional.scala 39:67]
  assign _GEN_24 = _T_4 | _GEN_20; // @[Conditional.scala 40:58]
  assign io_TD = r_TD; // @[UartTX.scala 86:13]
  assign i_tx_cnt_clock = clock;
  assign i_tx_cnt_reset = reset;
  assign i_tx_cnt_io_en = tx_state != 3'h0; // @[UartTX.scala 33:19]
  assign i_tx_cnt_io_rst = incr_txd_cnt | _T; // @[UartTX.scala 32:19]
  assign i_txd_cnt_clock = clock;
  assign i_txd_cnt_reset = reset;
  assign i_txd_cnt_io_en = tx_cnt == 16'h43d; // @[UartTX.scala 42:20]
  assign i_txd_cnt_io_rst = _T_4 ? 1'h0 : _GEN_23; // @[UartTX.scala 41:20]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  r_txdata = _RAND_0[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  r_TD = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  tx_state = _RAND_2[2:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      r_txdata <= 8'h0;
    end else if (_T_4) begin
      if (io_transmit) begin
        r_txdata <= io_txdata;
      end
    end else if (!(_T_6)) begin
      if (_T_8) begin
        if (incr_txd_cnt) begin
          r_txdata <= {{1'd0}, _T_11};
        end
      end
    end
    r_TD <= reset | _GEN_24;
    if (reset) begin
      tx_state <= 3'h0;
    end else if (_T_4) begin
      if (io_transmit) begin
        tx_state <= 3'h1;
      end
    end else if (_T_6) begin
      if (incr_txd_cnt) begin
        tx_state <= 3'h2;
      end
    end else if (_T_8) begin
      if (_T_14) begin
        tx_state <= 3'h3;
      end
    end else if (_T_15) begin
      if (incr_txd_cnt) begin
        tx_state <= 3'h4;
      end
    end else if (_T_17) begin
      if (_T_20) begin
        tx_state <= 3'h0;
      end
    end
  end
endmodule
module Uart(
  input         clock,
  input         reset,
  output        io_TD,
  input         io_RD,
  input  [7:0]  io_MONITOR_0,
  input  [7:0]  io_MONITOR_1,
  input  [7:0]  io_MONITOR_2,
  input  [7:0]  io_MONITOR_3,
  output [7:0]  io_GPIO_0,
  output [7:0]  io_GPIO_1,
  output        io_idle,
  output        io_we,
  output [31:0] io_addr,
  output [31:0] io_wdata,
  input  [31:0] io_rdata
);
  wire  i_uart_rx_clock; // @[Uart.scala 32:26]
  wire  i_uart_rx_reset; // @[Uart.scala 32:26]
  wire  i_uart_rx_io_RD; // @[Uart.scala 32:26]
  wire [7:0] i_uart_rx_io_recdata; // @[Uart.scala 32:26]
  wire  i_uart_rx_io_received; // @[Uart.scala 32:26]
  wire  i_term_clock; // @[Uart.scala 39:23]
  wire  i_term_reset; // @[Uart.scala 39:23]
  wire  i_term_io_in_en; // @[Uart.scala 39:23]
  wire [7:0] i_term_io_in_data; // @[Uart.scala 39:23]
  wire  i_term_io_transmit; // @[Uart.scala 39:23]
  wire [7:0] i_term_io_txdata; // @[Uart.scala 39:23]
  wire  i_term_io_idle; // @[Uart.scala 39:23]
  wire [7:0] i_term_io_MONITOR_0; // @[Uart.scala 39:23]
  wire [7:0] i_term_io_MONITOR_1; // @[Uart.scala 39:23]
  wire [7:0] i_term_io_MONITOR_2; // @[Uart.scala 39:23]
  wire [7:0] i_term_io_MONITOR_3; // @[Uart.scala 39:23]
  wire [7:0] i_term_io_GPIO_0; // @[Uart.scala 39:23]
  wire [7:0] i_term_io_GPIO_1; // @[Uart.scala 39:23]
  wire  i_term_io_we; // @[Uart.scala 39:23]
  wire [31:0] i_term_io_addr; // @[Uart.scala 39:23]
  wire [31:0] i_term_io_wdata; // @[Uart.scala 39:23]
  wire [31:0] i_term_io_rdata; // @[Uart.scala 39:23]
  wire  i_uart_tx_clock; // @[Uart.scala 49:26]
  wire  i_uart_tx_reset; // @[Uart.scala 49:26]
  wire  i_uart_tx_io_transmit; // @[Uart.scala 49:26]
  wire [7:0] i_uart_tx_io_txdata; // @[Uart.scala 49:26]
  wire  i_uart_tx_io_TD; // @[Uart.scala 49:26]
  UartRX i_uart_rx ( // @[Uart.scala 32:26]
    .clock(i_uart_rx_clock),
    .reset(i_uart_rx_reset),
    .io_RD(i_uart_rx_io_RD),
    .io_recdata(i_uart_rx_io_recdata),
    .io_received(i_uart_rx_io_received)
  );
  Terminal i_term ( // @[Uart.scala 39:23]
    .clock(i_term_clock),
    .reset(i_term_reset),
    .io_in_en(i_term_io_in_en),
    .io_in_data(i_term_io_in_data),
    .io_transmit(i_term_io_transmit),
    .io_txdata(i_term_io_txdata),
    .io_idle(i_term_io_idle),
    .io_MONITOR_0(i_term_io_MONITOR_0),
    .io_MONITOR_1(i_term_io_MONITOR_1),
    .io_MONITOR_2(i_term_io_MONITOR_2),
    .io_MONITOR_3(i_term_io_MONITOR_3),
    .io_GPIO_0(i_term_io_GPIO_0),
    .io_GPIO_1(i_term_io_GPIO_1),
    .io_we(i_term_io_we),
    .io_addr(i_term_io_addr),
    .io_wdata(i_term_io_wdata),
    .io_rdata(i_term_io_rdata)
  );
  UartTX i_uart_tx ( // @[Uart.scala 49:26]
    .clock(i_uart_tx_clock),
    .reset(i_uart_tx_reset),
    .io_transmit(i_uart_tx_io_transmit),
    .io_txdata(i_uart_tx_io_txdata),
    .io_TD(i_uart_tx_io_TD)
  );
  assign io_TD = i_uart_tx_io_TD; // @[Uart.scala 53:11]
  assign io_GPIO_0 = i_term_io_GPIO_0; // @[Uart.scala 54:11]
  assign io_GPIO_1 = i_term_io_GPIO_1; // @[Uart.scala 54:11]
  assign io_idle = i_term_io_idle; // @[Uart.scala 55:11]
  assign io_we = i_term_io_we; // @[Uart.scala 44:19]
  assign io_addr = i_term_io_addr; // @[Uart.scala 45:19]
  assign io_wdata = i_term_io_wdata; // @[Uart.scala 46:19]
  assign i_uart_rx_clock = clock;
  assign i_uart_rx_reset = reset;
  assign i_uart_rx_io_RD = io_RD; // @[Uart.scala 35:19]
  assign i_term_clock = clock;
  assign i_term_reset = reset;
  assign i_term_io_in_en = i_uart_rx_io_received; // @[Uart.scala 40:21]
  assign i_term_io_in_data = i_uart_rx_io_recdata; // @[Uart.scala 41:21]
  assign i_term_io_MONITOR_0 = io_MONITOR_0; // @[Uart.scala 42:21]
  assign i_term_io_MONITOR_1 = io_MONITOR_1; // @[Uart.scala 42:21]
  assign i_term_io_MONITOR_2 = io_MONITOR_2; // @[Uart.scala 42:21]
  assign i_term_io_MONITOR_3 = io_MONITOR_3; // @[Uart.scala 42:21]
  assign i_term_io_rdata = io_rdata; // @[Uart.scala 47:19]
  assign i_uart_tx_clock = clock;
  assign i_uart_tx_reset = reset;
  assign i_uart_tx_io_transmit = i_term_io_transmit; // @[Uart.scala 50:25]
  assign i_uart_tx_io_txdata = i_term_io_txdata; // @[Uart.scala 51:25]
endmodule
module IF(
  input         clock,
  input         reset,
  input  [31:0] io_inst_code,
  input         io_inst_valid,
  input         io_ready,
  output [31:0] io_if_IFtoID_opcode,
  output        io_if_IFtoID_valid,
  output [31:0] io_if_IFtoID_PC,
  input  [31:0] io_if_IDtoIF_jump_addr,
  input         io_if_IDtoIF_jump_valid,
  output [31:0] io_inst_addr
);
  reg [31:0] r_PC; // @[IF.scala 17:24]
  reg [31:0] _RAND_0;
  wire [31:0] _T_5; // @[IF.scala 32:18]
  assign _T_5 = r_PC + 32'h4; // @[IF.scala 32:18]
  assign io_if_IFtoID_opcode = io_inst_code; // @[IF.scala 36:23]
  assign io_if_IFtoID_valid = io_inst_valid; // @[IF.scala 37:23]
  assign io_if_IFtoID_PC = r_PC; // @[IF.scala 38:23]
  assign io_inst_addr = r_PC; // @[IF.scala 20:16]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  r_PC = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      r_PC <= 32'h80000000;
    end else if (io_if_IDtoIF_jump_valid) begin
      r_PC <= io_if_IDtoIF_jump_addr;
    end else if (io_ready) begin
      r_PC <= _T_5;
    end
  end
endmodule
module ID(
  output [31:0] io_if_IDtoIF_jump_addr,
  output        io_if_IDtoIF_jump_valid,
  output [5:0]  io_if_IDtoEX_alu_func,
  output [5:0]  io_if_IDtoEX_ldst_func,
  output [31:0] io_if_IDtoEX_imm,
  output        io_if_IDtoEX_imm_sel,
  output [4:0]  io_if_IDtoEX_rd,
  output        io_if_IDtoEX_load_valid,
  output        io_if_IDtoEX_alu_valid,
  output        io_if_IDtoEX_store_valid,
  output [4:0]  io_if_IDtoRF_rs1,
  output [4:0]  io_if_IDtoRF_rs2,
  input  [31:0] io_if_IFtoID_opcode,
  input         io_if_IFtoID_valid,
  input  [31:0] io_if_IFtoID_PC,
  input  [31:0] io_if_RFtoID_d_rs1,
  input  [31:0] io_if_RFtoID_d_rs2,
  output        io_illigal_op
);
  wire [6:0] opcode; // @[ID.scala 19:25]
  wire [2:0] func3; // @[ID.scala 22:24]
  wire [6:0] func7; // @[ID.scala 25:24]
  wire  _T; // @[ID.scala 30:17]
  wire  _T_1; // @[ID.scala 30:21]
  wire [11:0] _T_2; // @[ID.scala 31:28]
  wire [31:0] _GEN_137; // @[ID.scala 33:34]
  wire [31:0] _T_4; // @[ID.scala 33:34]
  wire [31:0] imm_I; // @[ID.scala 30:28]
  wire [11:0] _T_8; // @[ID.scala 37:31]
  wire [4:0] _T_9; // @[ID.scala 37:47]
  wire [11:0] _GEN_138; // @[ID.scala 37:36]
  wire [11:0] _T_11; // @[ID.scala 37:36]
  wire [31:0] _GEN_140; // @[ID.scala 39:29]
  wire [31:0] _T_17; // @[ID.scala 39:29]
  wire [31:0] imm_S; // @[ID.scala 36:28]
  wire [19:0] _T_18; // @[ID.scala 42:25]
  wire [31:0] imm_U; // @[ID.scala 42:33]
  wire [7:0] _T_19; // @[ID.scala 48:25]
  wire [19:0] _T_20; // @[ID.scala 48:32]
  wire  _T_21; // @[ID.scala 49:25]
  wire [11:0] _T_22; // @[ID.scala 49:32]
  wire [19:0] _GEN_141; // @[ID.scala 48:38]
  wire [19:0] _T_24; // @[ID.scala 48:38]
  wire [9:0] _T_25; // @[ID.scala 50:25]
  wire [10:0] _T_26; // @[ID.scala 50:32]
  wire [19:0] _GEN_142; // @[ID.scala 49:38]
  wire [19:0] imm_J_20; // @[ID.scala 49:38]
  wire [11:0] _T_31; // @[Bitwise.scala 71:12]
  wire [31:0] imm_J; // @[Cat.scala 29:58]
  wire  _T_33; // @[ID.scala 56:25]
  wire [11:0] _T_34; // @[ID.scala 56:33]
  wire [5:0] _T_35; // @[ID.scala 57:25]
  wire [10:0] _T_36; // @[ID.scala 57:33]
  wire [11:0] _GEN_143; // @[ID.scala 56:39]
  wire [11:0] _T_38; // @[ID.scala 56:39]
  wire [3:0] _T_39; // @[ID.scala 58:25]
  wire [4:0] _T_40; // @[ID.scala 58:33]
  wire [11:0] _GEN_144; // @[ID.scala 57:39]
  wire [11:0] imm_B_12; // @[ID.scala 57:39]
  wire [19:0] _T_45; // @[Bitwise.scala 71:12]
  wire [31:0] imm_B; // @[Cat.scala 29:58]
  wire  _T_54; // @[ID.scala 111:16]
  wire  _T_55; // @[ID.scala 114:22]
  wire  _T_61; // @[ID.scala 122:22]
  wire  _T_66; // @[ID.scala 126:22]
  wire  _T_67; // @[ID.scala 129:22]
  wire  _T_68; // @[ID.scala 133:22]
  wire  _T_71; // @[ID.scala 137:22]
  wire  _T_74; // @[ID.scala 141:22]
  wire  _T_77; // @[ID.scala 145:22]
  wire  _T_78; // @[ID.scala 147:22]
  wire  _T_79; // @[ID.scala 148:17]
  wire  _GEN_10; // @[ID.scala 147:32]
  wire  _GEN_17; // @[ID.scala 145:32]
  wire  _GEN_27; // @[ID.scala 141:32]
  wire  _GEN_36; // @[ID.scala 137:32]
  wire  _GEN_46; // @[ID.scala 133:32]
  wire  _GEN_57; // @[ID.scala 129:32]
  wire  _GEN_69; // @[ID.scala 126:32]
  wire  _GEN_82; // @[ID.scala 122:32]
  wire  _GEN_96; // @[ID.scala 114:32]
  wire  _GEN_111; // @[ID.scala 111:26]
  wire  csrw_valid; // @[ID.scala 110:35]
  wire  _GEN_26; // @[ID.scala 141:32]
  wire  _GEN_35; // @[ID.scala 137:32]
  wire  _GEN_45; // @[ID.scala 133:32]
  wire  _GEN_56; // @[ID.scala 129:32]
  wire  _GEN_68; // @[ID.scala 126:32]
  wire  _GEN_81; // @[ID.scala 122:32]
  wire  _GEN_95; // @[ID.scala 114:32]
  wire  _GEN_110; // @[ID.scala 111:26]
  wire  bra_valid; // @[ID.scala 110:35]
  wire  _T_49; // @[ID.scala 103:28]
  wire  _T_80; // @[ID.scala 153:22]
  wire  _GEN_12; // @[ID.scala 147:32]
  wire  _GEN_19; // @[ID.scala 145:32]
  wire  _GEN_29; // @[ID.scala 141:32]
  wire  _GEN_38; // @[ID.scala 137:32]
  wire  _GEN_48; // @[ID.scala 133:32]
  wire  _GEN_59; // @[ID.scala 129:32]
  wire  _GEN_71; // @[ID.scala 126:32]
  wire  _GEN_84; // @[ID.scala 122:32]
  wire  _GEN_98; // @[ID.scala 114:32]
  wire  _GEN_113; // @[ID.scala 111:26]
  wire  fence_valid; // @[ID.scala 110:35]
  wire  _T_51; // @[ID.scala 103:51]
  wire  _T_56; // @[ID.scala 117:17]
  wire  _T_58; // @[ID.scala 118:39]
  wire [3:0] _T_59; // @[ID.scala 118:55]
  wire [3:0] _GEN_145; // @[ID.scala 118:60]
  wire [3:0] _T_60; // @[ID.scala 118:60]
  wire [3:0] _GEN_3; // @[ID.scala 117:24]
  wire [31:0] _T_70; // @[ID.scala 136:17]
  wire [31:0] _T_73; // @[ID.scala 140:17]
  wire  _GEN_5; // @[ID.scala 148:29]
  wire  _GEN_7; // @[ID.scala 153:32]
  wire [3:0] _GEN_8; // @[ID.scala 153:32]
  wire  _GEN_11; // @[ID.scala 147:32]
  wire  _GEN_13; // @[ID.scala 147:32]
  wire [3:0] _GEN_14; // @[ID.scala 147:32]
  wire  _GEN_18; // @[ID.scala 145:32]
  wire  _GEN_20; // @[ID.scala 145:32]
  wire [3:0] _GEN_21; // @[ID.scala 145:32]
  wire [3:0] _GEN_23; // @[ID.scala 141:32]
  wire [31:0] _GEN_24; // @[ID.scala 141:32]
  wire  _GEN_28; // @[ID.scala 141:32]
  wire  _GEN_30; // @[ID.scala 141:32]
  wire [3:0] _GEN_31; // @[ID.scala 137:32]
  wire [31:0] _GEN_33; // @[ID.scala 137:32]
  wire  _GEN_34; // @[ID.scala 137:32]
  wire  _GEN_37; // @[ID.scala 137:32]
  wire  _GEN_39; // @[ID.scala 137:32]
  wire [3:0] _GEN_40; // @[ID.scala 133:32]
  wire [31:0] _GEN_42; // @[ID.scala 133:32]
  wire  _GEN_43; // @[ID.scala 133:32]
  wire  _GEN_44; // @[ID.scala 133:32]
  wire  _GEN_47; // @[ID.scala 133:32]
  wire  _GEN_49; // @[ID.scala 133:32]
  wire [3:0] _GEN_50; // @[ID.scala 129:32]
  wire [31:0] _GEN_52; // @[ID.scala 129:32]
  wire  _GEN_53; // @[ID.scala 129:32]
  wire  _GEN_54; // @[ID.scala 129:32]
  wire  _GEN_55; // @[ID.scala 129:32]
  wire  _GEN_58; // @[ID.scala 129:32]
  wire  _GEN_60; // @[ID.scala 129:32]
  wire [31:0] _GEN_62; // @[ID.scala 126:32]
  wire [3:0] _GEN_63; // @[ID.scala 126:32]
  wire  _GEN_64; // @[ID.scala 126:32]
  wire  _GEN_65; // @[ID.scala 126:32]
  wire  _GEN_66; // @[ID.scala 126:32]
  wire  _GEN_67; // @[ID.scala 126:32]
  wire  _GEN_70; // @[ID.scala 126:32]
  wire  _GEN_72; // @[ID.scala 126:32]
  wire [31:0] _GEN_74; // @[ID.scala 122:32]
  wire [3:0] _GEN_75; // @[ID.scala 122:32]
  wire  _GEN_76; // @[ID.scala 122:32]
  wire  _GEN_77; // @[ID.scala 122:32]
  wire  _GEN_78; // @[ID.scala 122:32]
  wire  _GEN_79; // @[ID.scala 122:32]
  wire  _GEN_80; // @[ID.scala 122:32]
  wire  _GEN_83; // @[ID.scala 122:32]
  wire  _GEN_85; // @[ID.scala 122:32]
  wire [31:0] _GEN_87; // @[ID.scala 114:32]
  wire [3:0] _GEN_88; // @[ID.scala 114:32]
  wire  _GEN_89; // @[ID.scala 114:32]
  wire  _GEN_90; // @[ID.scala 114:32]
  wire  _GEN_91; // @[ID.scala 114:32]
  wire  _GEN_92; // @[ID.scala 114:32]
  wire  _GEN_93; // @[ID.scala 114:32]
  wire  _GEN_94; // @[ID.scala 114:32]
  wire  _GEN_97; // @[ID.scala 114:32]
  wire  _GEN_99; // @[ID.scala 114:32]
  wire [31:0] _GEN_101; // @[ID.scala 111:26]
  wire  _GEN_102; // @[ID.scala 111:26]
  wire [3:0] _GEN_103; // @[ID.scala 111:26]
  wire  _GEN_104; // @[ID.scala 111:26]
  wire  _GEN_105; // @[ID.scala 111:26]
  wire  _GEN_106; // @[ID.scala 111:26]
  wire  _GEN_107; // @[ID.scala 111:26]
  wire  _GEN_108; // @[ID.scala 111:26]
  wire  _GEN_109; // @[ID.scala 111:26]
  wire  _GEN_112; // @[ID.scala 111:26]
  wire  _GEN_114; // @[ID.scala 111:26]
  wire  op_imm_valid; // @[ID.scala 110:35]
  wire [3:0] _GEN_118; // @[ID.scala 110:35]
  wire  op_valid; // @[ID.scala 110:35]
  wire  lui_valid; // @[ID.scala 110:35]
  wire  auipc_valid; // @[ID.scala 110:35]
  wire  jal_valid; // @[ID.scala 110:35]
  wire  jalr_valid; // @[ID.scala 110:35]
  wire  csrr_valid; // @[ID.scala 110:35]
  wire  jump_valid; // @[ID.scala 169:31]
  wire [31:0] _T_84; // @[ID.scala 171:22]
  wire [31:0] _T_87; // @[ID.scala 173:25]
  wire [31:0] _T_90; // @[ID.scala 175:22]
  wire  _T_91; // @[ID.scala 176:17]
  wire  _T_92; // @[ID.scala 176:35]
  wire  _T_93; // @[ID.scala 176:25]
  wire  _T_95; // @[ID.scala 177:35]
  wire  _T_96; // @[ID.scala 177:25]
  wire  _T_97; // @[ID.scala 176:45]
  wire  _T_98; // @[ID.scala 178:17]
  wire [31:0] _T_99; // @[ID.scala 178:35]
  wire [31:0] _T_100; // @[ID.scala 178:51]
  wire  _T_101; // @[ID.scala 178:42]
  wire  _T_102; // @[ID.scala 178:25]
  wire  _T_103; // @[ID.scala 177:45]
  wire  _T_107; // @[ID.scala 179:42]
  wire  _T_108; // @[ID.scala 179:25]
  wire  _T_109; // @[ID.scala 178:59]
  wire  _T_110; // @[ID.scala 180:17]
  wire  _T_111; // @[ID.scala 180:36]
  wire  _T_112; // @[ID.scala 180:25]
  wire  _T_113; // @[ID.scala 179:59]
  wire  _T_114; // @[ID.scala 181:17]
  wire  _T_115; // @[ID.scala 181:35]
  wire  _T_116; // @[ID.scala 181:25]
  wire  _T_117; // @[ID.scala 180:45]
  wire [31:0] _GEN_131; // @[ID.scala 174:30]
  wire  _GEN_132; // @[ID.scala 174:30]
  wire [31:0] _GEN_133; // @[ID.scala 172:31]
  wire  _GEN_134; // @[ID.scala 172:31]
  wire  bra_valid_true; // @[ID.scala 170:24]
  wire  _T_119; // @[ID.scala 193:44]
  wire  _T_120; // @[ID.scala 193:56]
  wire  _T_121; // @[ID.scala 194:41]
  wire  _T_123; // @[ID.scala 197:42]
  wire  _T_124; // @[ID.scala 197:57]
  wire  _T_125; // @[ID.scala 198:42]
  wire  _T_126; // @[ID.scala 198:56]
  wire  _T_127; // @[ID.scala 199:42]
  wire  _T_128; // @[ID.scala 199:56]
  wire  _T_129; // @[ID.scala 200:42]
  wire  _T_130; // @[ID.scala 200:55]
  assign opcode = io_if_IFtoID_opcode[6:0]; // @[ID.scala 19:25]
  assign func3 = io_if_IFtoID_opcode[14:12]; // @[ID.scala 22:24]
  assign func7 = io_if_IFtoID_opcode[31:25]; // @[ID.scala 25:24]
  assign _T = io_if_IFtoID_opcode[31]; // @[ID.scala 30:17]
  assign _T_1 = _T == 1'h0; // @[ID.scala 30:21]
  assign _T_2 = io_if_IFtoID_opcode[31:20]; // @[ID.scala 31:28]
  assign _GEN_137 = {{20'd0}, _T_2}; // @[ID.scala 33:34]
  assign _T_4 = 32'hfffff000 | _GEN_137; // @[ID.scala 33:34]
  assign imm_I = _T_1 ? {{20'd0}, _T_2} : _T_4; // @[ID.scala 30:28]
  assign _T_8 = {func7, 5'h0}; // @[ID.scala 37:31]
  assign _T_9 = io_if_IFtoID_opcode[11:7]; // @[ID.scala 37:47]
  assign _GEN_138 = {{7'd0}, _T_9}; // @[ID.scala 37:36]
  assign _T_11 = _T_8 + _GEN_138; // @[ID.scala 37:36]
  assign _GEN_140 = {{20'd0}, _T_11}; // @[ID.scala 39:29]
  assign _T_17 = 32'hfffff000 | _GEN_140; // @[ID.scala 39:29]
  assign imm_S = _T_1 ? {{20'd0}, _T_11} : _T_17; // @[ID.scala 36:28]
  assign _T_18 = io_if_IFtoID_opcode[31:12]; // @[ID.scala 42:25]
  assign imm_U = {_T_18, 12'h0}; // @[ID.scala 42:33]
  assign _T_19 = io_if_IFtoID_opcode[19:12]; // @[ID.scala 48:25]
  assign _T_20 = {_T_19, 12'h0}; // @[ID.scala 48:32]
  assign _T_21 = io_if_IFtoID_opcode[20]; // @[ID.scala 49:25]
  assign _T_22 = {_T_21, 11'h0}; // @[ID.scala 49:32]
  assign _GEN_141 = {{8'd0}, _T_22}; // @[ID.scala 48:38]
  assign _T_24 = _T_20 + _GEN_141; // @[ID.scala 48:38]
  assign _T_25 = io_if_IFtoID_opcode[30:21]; // @[ID.scala 50:25]
  assign _T_26 = {_T_25, 1'h0}; // @[ID.scala 50:32]
  assign _GEN_142 = {{9'd0}, _T_26}; // @[ID.scala 49:38]
  assign imm_J_20 = _T_24 + _GEN_142; // @[ID.scala 49:38]
  assign _T_31 = _T ? 12'hfff : 12'h0; // @[Bitwise.scala 71:12]
  assign imm_J = {_T_31,imm_J_20}; // @[Cat.scala 29:58]
  assign _T_33 = io_if_IFtoID_opcode[7]; // @[ID.scala 56:25]
  assign _T_34 = {_T_33, 11'h0}; // @[ID.scala 56:33]
  assign _T_35 = io_if_IFtoID_opcode[30:25]; // @[ID.scala 57:25]
  assign _T_36 = {_T_35, 5'h0}; // @[ID.scala 57:33]
  assign _GEN_143 = {{1'd0}, _T_36}; // @[ID.scala 56:39]
  assign _T_38 = _T_34 + _GEN_143; // @[ID.scala 56:39]
  assign _T_39 = io_if_IFtoID_opcode[11:8]; // @[ID.scala 58:25]
  assign _T_40 = {_T_39, 1'h0}; // @[ID.scala 58:33]
  assign _GEN_144 = {{7'd0}, _T_40}; // @[ID.scala 57:39]
  assign imm_B_12 = _T_38 + _GEN_144; // @[ID.scala 57:39]
  assign _T_45 = _T ? 20'hfffff : 20'h0; // @[Bitwise.scala 71:12]
  assign imm_B = {_T_45,imm_B_12}; // @[Cat.scala 29:58]
  assign _T_54 = opcode == 7'h3; // @[ID.scala 111:16]
  assign _T_55 = opcode == 7'h13; // @[ID.scala 114:22]
  assign _T_61 = opcode == 7'h33; // @[ID.scala 122:22]
  assign _T_66 = opcode == 7'h23; // @[ID.scala 126:22]
  assign _T_67 = opcode == 7'h37; // @[ID.scala 129:22]
  assign _T_68 = opcode == 7'h17; // @[ID.scala 133:22]
  assign _T_71 = opcode == 7'h6f; // @[ID.scala 137:22]
  assign _T_74 = opcode == 7'h67; // @[ID.scala 141:22]
  assign _T_77 = opcode == 7'h63; // @[ID.scala 145:22]
  assign _T_78 = opcode == 7'h73; // @[ID.scala 147:22]
  assign _T_79 = func3 == 3'h1; // @[ID.scala 148:17]
  assign _GEN_10 = _T_78 & _T_79; // @[ID.scala 147:32]
  assign _GEN_17 = _T_77 ? 1'h0 : _GEN_10; // @[ID.scala 145:32]
  assign _GEN_27 = _T_74 ? 1'h0 : _GEN_17; // @[ID.scala 141:32]
  assign _GEN_36 = _T_71 ? 1'h0 : _GEN_27; // @[ID.scala 137:32]
  assign _GEN_46 = _T_68 ? 1'h0 : _GEN_36; // @[ID.scala 133:32]
  assign _GEN_57 = _T_67 ? 1'h0 : _GEN_46; // @[ID.scala 129:32]
  assign _GEN_69 = _T_66 ? 1'h0 : _GEN_57; // @[ID.scala 126:32]
  assign _GEN_82 = _T_61 ? 1'h0 : _GEN_69; // @[ID.scala 122:32]
  assign _GEN_96 = _T_55 ? 1'h0 : _GEN_82; // @[ID.scala 114:32]
  assign _GEN_111 = _T_54 ? 1'h0 : _GEN_96; // @[ID.scala 111:26]
  assign csrw_valid = io_if_IFtoID_valid & _GEN_111; // @[ID.scala 110:35]
  assign _GEN_26 = _T_74 ? 1'h0 : _T_77; // @[ID.scala 141:32]
  assign _GEN_35 = _T_71 ? 1'h0 : _GEN_26; // @[ID.scala 137:32]
  assign _GEN_45 = _T_68 ? 1'h0 : _GEN_35; // @[ID.scala 133:32]
  assign _GEN_56 = _T_67 ? 1'h0 : _GEN_45; // @[ID.scala 129:32]
  assign _GEN_68 = _T_66 ? 1'h0 : _GEN_56; // @[ID.scala 126:32]
  assign _GEN_81 = _T_61 ? 1'h0 : _GEN_68; // @[ID.scala 122:32]
  assign _GEN_95 = _T_55 ? 1'h0 : _GEN_81; // @[ID.scala 114:32]
  assign _GEN_110 = _T_54 ? 1'h0 : _GEN_95; // @[ID.scala 111:26]
  assign bra_valid = io_if_IFtoID_valid & _GEN_110; // @[ID.scala 110:35]
  assign _T_49 = csrw_valid | bra_valid; // @[ID.scala 103:28]
  assign _T_80 = opcode == 7'hf; // @[ID.scala 153:22]
  assign _GEN_12 = _T_78 ? 1'h0 : _T_80; // @[ID.scala 147:32]
  assign _GEN_19 = _T_77 ? 1'h0 : _GEN_12; // @[ID.scala 145:32]
  assign _GEN_29 = _T_74 ? 1'h0 : _GEN_19; // @[ID.scala 141:32]
  assign _GEN_38 = _T_71 ? 1'h0 : _GEN_29; // @[ID.scala 137:32]
  assign _GEN_48 = _T_68 ? 1'h0 : _GEN_38; // @[ID.scala 133:32]
  assign _GEN_59 = _T_67 ? 1'h0 : _GEN_48; // @[ID.scala 129:32]
  assign _GEN_71 = _T_66 ? 1'h0 : _GEN_59; // @[ID.scala 126:32]
  assign _GEN_84 = _T_61 ? 1'h0 : _GEN_71; // @[ID.scala 122:32]
  assign _GEN_98 = _T_55 ? 1'h0 : _GEN_84; // @[ID.scala 114:32]
  assign _GEN_113 = _T_54 ? 1'h0 : _GEN_98; // @[ID.scala 111:26]
  assign fence_valid = io_if_IFtoID_valid & _GEN_113; // @[ID.scala 110:35]
  assign _T_51 = _T_49 | fence_valid; // @[ID.scala 103:51]
  assign _T_56 = func3 == 3'h5; // @[ID.scala 117:17]
  assign _T_58 = func7 == 7'h20; // @[ID.scala 118:39]
  assign _T_59 = {_T_58, 3'h0}; // @[ID.scala 118:55]
  assign _GEN_145 = {{1'd0}, func3}; // @[ID.scala 118:60]
  assign _T_60 = _T_59 | _GEN_145; // @[ID.scala 118:60]
  assign _GEN_3 = _T_56 ? _T_60 : {{1'd0}, func3}; // @[ID.scala 117:24]
  assign _T_70 = io_if_IFtoID_PC + imm_U; // @[ID.scala 136:17]
  assign _T_73 = io_if_IFtoID_PC + 32'h4; // @[ID.scala 140:17]
  assign _GEN_5 = _T_79 ? 1'h0 : 1'h1; // @[ID.scala 148:29]
  assign _GEN_7 = _T_80 ? 1'h0 : 1'h1; // @[ID.scala 153:32]
  assign _GEN_8 = _T_80 ? 4'h0 : 4'ha; // @[ID.scala 153:32]
  assign _GEN_11 = _T_78 & _GEN_5; // @[ID.scala 147:32]
  assign _GEN_13 = _T_78 ? 1'h0 : _GEN_7; // @[ID.scala 147:32]
  assign _GEN_14 = _T_78 ? 4'h0 : _GEN_8; // @[ID.scala 147:32]
  assign _GEN_18 = _T_77 ? 1'h0 : _GEN_11; // @[ID.scala 145:32]
  assign _GEN_20 = _T_77 ? 1'h0 : _GEN_13; // @[ID.scala 145:32]
  assign _GEN_21 = _T_77 ? 4'h0 : _GEN_14; // @[ID.scala 145:32]
  assign _GEN_23 = _T_74 ? 4'ha : _GEN_21; // @[ID.scala 141:32]
  assign _GEN_24 = _T_74 ? _T_73 : 32'h0; // @[ID.scala 141:32]
  assign _GEN_28 = _T_74 ? 1'h0 : _GEN_18; // @[ID.scala 141:32]
  assign _GEN_30 = _T_74 ? 1'h0 : _GEN_20; // @[ID.scala 141:32]
  assign _GEN_31 = _T_71 ? 4'ha : _GEN_23; // @[ID.scala 137:32]
  assign _GEN_33 = _T_71 ? _T_73 : _GEN_24; // @[ID.scala 137:32]
  assign _GEN_34 = _T_71 ? 1'h0 : _T_74; // @[ID.scala 137:32]
  assign _GEN_37 = _T_71 ? 1'h0 : _GEN_28; // @[ID.scala 137:32]
  assign _GEN_39 = _T_71 ? 1'h0 : _GEN_30; // @[ID.scala 137:32]
  assign _GEN_40 = _T_68 ? 4'ha : _GEN_31; // @[ID.scala 133:32]
  assign _GEN_42 = _T_68 ? _T_70 : _GEN_33; // @[ID.scala 133:32]
  assign _GEN_43 = _T_68 ? 1'h0 : _T_71; // @[ID.scala 133:32]
  assign _GEN_44 = _T_68 ? 1'h0 : _GEN_34; // @[ID.scala 133:32]
  assign _GEN_47 = _T_68 ? 1'h0 : _GEN_37; // @[ID.scala 133:32]
  assign _GEN_49 = _T_68 ? 1'h0 : _GEN_39; // @[ID.scala 133:32]
  assign _GEN_50 = _T_67 ? 4'ha : _GEN_40; // @[ID.scala 129:32]
  assign _GEN_52 = _T_67 ? imm_U : _GEN_42; // @[ID.scala 129:32]
  assign _GEN_53 = _T_67 ? 1'h0 : _T_68; // @[ID.scala 129:32]
  assign _GEN_54 = _T_67 ? 1'h0 : _GEN_43; // @[ID.scala 129:32]
  assign _GEN_55 = _T_67 ? 1'h0 : _GEN_44; // @[ID.scala 129:32]
  assign _GEN_58 = _T_67 ? 1'h0 : _GEN_47; // @[ID.scala 129:32]
  assign _GEN_60 = _T_67 ? 1'h0 : _GEN_49; // @[ID.scala 129:32]
  assign _GEN_62 = _T_66 ? imm_S : _GEN_52; // @[ID.scala 126:32]
  assign _GEN_63 = _T_66 ? 4'h0 : _GEN_50; // @[ID.scala 126:32]
  assign _GEN_64 = _T_66 ? 1'h0 : _T_67; // @[ID.scala 126:32]
  assign _GEN_65 = _T_66 ? 1'h0 : _GEN_53; // @[ID.scala 126:32]
  assign _GEN_66 = _T_66 ? 1'h0 : _GEN_54; // @[ID.scala 126:32]
  assign _GEN_67 = _T_66 ? 1'h0 : _GEN_55; // @[ID.scala 126:32]
  assign _GEN_70 = _T_66 ? 1'h0 : _GEN_58; // @[ID.scala 126:32]
  assign _GEN_72 = _T_66 ? 1'h0 : _GEN_60; // @[ID.scala 126:32]
  assign _GEN_74 = _T_61 ? 32'h0 : _GEN_62; // @[ID.scala 122:32]
  assign _GEN_75 = _T_61 ? _T_60 : _GEN_63; // @[ID.scala 122:32]
  assign _GEN_76 = _T_61 ? 1'h0 : _T_66; // @[ID.scala 122:32]
  assign _GEN_77 = _T_61 ? 1'h0 : _GEN_64; // @[ID.scala 122:32]
  assign _GEN_78 = _T_61 ? 1'h0 : _GEN_65; // @[ID.scala 122:32]
  assign _GEN_79 = _T_61 ? 1'h0 : _GEN_66; // @[ID.scala 122:32]
  assign _GEN_80 = _T_61 ? 1'h0 : _GEN_67; // @[ID.scala 122:32]
  assign _GEN_83 = _T_61 ? 1'h0 : _GEN_70; // @[ID.scala 122:32]
  assign _GEN_85 = _T_61 ? 1'h0 : _GEN_72; // @[ID.scala 122:32]
  assign _GEN_87 = _T_55 ? imm_I : _GEN_74; // @[ID.scala 114:32]
  assign _GEN_88 = _T_55 ? _GEN_3 : _GEN_75; // @[ID.scala 114:32]
  assign _GEN_89 = _T_55 ? 1'h0 : _T_61; // @[ID.scala 114:32]
  assign _GEN_90 = _T_55 ? 1'h0 : _GEN_76; // @[ID.scala 114:32]
  assign _GEN_91 = _T_55 ? 1'h0 : _GEN_77; // @[ID.scala 114:32]
  assign _GEN_92 = _T_55 ? 1'h0 : _GEN_78; // @[ID.scala 114:32]
  assign _GEN_93 = _T_55 ? 1'h0 : _GEN_79; // @[ID.scala 114:32]
  assign _GEN_94 = _T_55 ? 1'h0 : _GEN_80; // @[ID.scala 114:32]
  assign _GEN_97 = _T_55 ? 1'h0 : _GEN_83; // @[ID.scala 114:32]
  assign _GEN_99 = _T_55 ? 1'h0 : _GEN_85; // @[ID.scala 114:32]
  assign _GEN_101 = _T_54 ? imm_I : _GEN_87; // @[ID.scala 111:26]
  assign _GEN_102 = _T_54 ? 1'h0 : _T_55; // @[ID.scala 111:26]
  assign _GEN_103 = _T_54 ? 4'h0 : _GEN_88; // @[ID.scala 111:26]
  assign _GEN_104 = _T_54 ? 1'h0 : _GEN_89; // @[ID.scala 111:26]
  assign _GEN_105 = _T_54 ? 1'h0 : _GEN_90; // @[ID.scala 111:26]
  assign _GEN_106 = _T_54 ? 1'h0 : _GEN_91; // @[ID.scala 111:26]
  assign _GEN_107 = _T_54 ? 1'h0 : _GEN_92; // @[ID.scala 111:26]
  assign _GEN_108 = _T_54 ? 1'h0 : _GEN_93; // @[ID.scala 111:26]
  assign _GEN_109 = _T_54 ? 1'h0 : _GEN_94; // @[ID.scala 111:26]
  assign _GEN_112 = _T_54 ? 1'h0 : _GEN_97; // @[ID.scala 111:26]
  assign _GEN_114 = _T_54 ? 1'h0 : _GEN_99; // @[ID.scala 111:26]
  assign op_imm_valid = io_if_IFtoID_valid & _GEN_102; // @[ID.scala 110:35]
  assign _GEN_118 = io_if_IFtoID_valid ? _GEN_103 : 4'h0; // @[ID.scala 110:35]
  assign op_valid = io_if_IFtoID_valid & _GEN_104; // @[ID.scala 110:35]
  assign lui_valid = io_if_IFtoID_valid & _GEN_106; // @[ID.scala 110:35]
  assign auipc_valid = io_if_IFtoID_valid & _GEN_107; // @[ID.scala 110:35]
  assign jal_valid = io_if_IFtoID_valid & _GEN_108; // @[ID.scala 110:35]
  assign jalr_valid = io_if_IFtoID_valid & _GEN_109; // @[ID.scala 110:35]
  assign csrr_valid = io_if_IFtoID_valid & _GEN_112; // @[ID.scala 110:35]
  assign jump_valid = jal_valid | jalr_valid; // @[ID.scala 169:31]
  assign _T_84 = io_if_IFtoID_PC + imm_J; // @[ID.scala 171:22]
  assign _T_87 = io_if_RFtoID_d_rs1 + imm_I; // @[ID.scala 173:25]
  assign _T_90 = io_if_IFtoID_PC + imm_B; // @[ID.scala 175:22]
  assign _T_91 = func3 == 3'h0; // @[ID.scala 176:17]
  assign _T_92 = io_if_RFtoID_d_rs1 == io_if_RFtoID_d_rs2; // @[ID.scala 176:35]
  assign _T_93 = _T_91 & _T_92; // @[ID.scala 176:25]
  assign _T_95 = io_if_RFtoID_d_rs1 != io_if_RFtoID_d_rs2; // @[ID.scala 177:35]
  assign _T_96 = _T_79 & _T_95; // @[ID.scala 177:25]
  assign _T_97 = _T_93 | _T_96; // @[ID.scala 176:45]
  assign _T_98 = func3 == 3'h4; // @[ID.scala 178:17]
  assign _T_99 = $signed(io_if_RFtoID_d_rs1); // @[ID.scala 178:35]
  assign _T_100 = $signed(io_if_RFtoID_d_rs2); // @[ID.scala 178:51]
  assign _T_101 = $signed(_T_99) < $signed(_T_100); // @[ID.scala 178:42]
  assign _T_102 = _T_98 & _T_101; // @[ID.scala 178:25]
  assign _T_103 = _T_97 | _T_102; // @[ID.scala 177:45]
  assign _T_107 = $signed(_T_99) >= $signed(_T_100); // @[ID.scala 179:42]
  assign _T_108 = _T_56 & _T_107; // @[ID.scala 179:25]
  assign _T_109 = _T_103 | _T_108; // @[ID.scala 178:59]
  assign _T_110 = func3 == 3'h6; // @[ID.scala 180:17]
  assign _T_111 = io_if_RFtoID_d_rs1 < io_if_RFtoID_d_rs2; // @[ID.scala 180:36]
  assign _T_112 = _T_110 & _T_111; // @[ID.scala 180:25]
  assign _T_113 = _T_109 | _T_112; // @[ID.scala 179:59]
  assign _T_114 = func3 == 3'h7; // @[ID.scala 181:17]
  assign _T_115 = io_if_RFtoID_d_rs1 >= io_if_RFtoID_d_rs2; // @[ID.scala 181:35]
  assign _T_116 = _T_114 & _T_115; // @[ID.scala 181:25]
  assign _T_117 = _T_113 | _T_116; // @[ID.scala 180:45]
  assign _GEN_131 = bra_valid ? _T_90 : 32'h0; // @[ID.scala 174:30]
  assign _GEN_132 = bra_valid & _T_117; // @[ID.scala 174:30]
  assign _GEN_133 = jalr_valid ? _T_87 : _GEN_131; // @[ID.scala 172:31]
  assign _GEN_134 = jalr_valid ? 1'h0 : _GEN_132; // @[ID.scala 172:31]
  assign bra_valid_true = jal_valid ? 1'h0 : _GEN_134; // @[ID.scala 170:24]
  assign _T_119 = op_imm_valid | lui_valid; // @[ID.scala 193:44]
  assign _T_120 = _T_119 | jal_valid; // @[ID.scala 193:56]
  assign _T_121 = _T_120 | jalr_valid; // @[ID.scala 194:41]
  assign _T_123 = op_valid | op_imm_valid; // @[ID.scala 197:42]
  assign _T_124 = _T_123 | lui_valid; // @[ID.scala 197:57]
  assign _T_125 = _T_124 | auipc_valid; // @[ID.scala 198:42]
  assign _T_126 = _T_125 | jal_valid; // @[ID.scala 198:56]
  assign _T_127 = _T_126 | jalr_valid; // @[ID.scala 199:42]
  assign _T_128 = _T_127 | csrw_valid; // @[ID.scala 199:56]
  assign _T_129 = _T_128 | csrr_valid; // @[ID.scala 200:42]
  assign _T_130 = _T_129 | bra_valid; // @[ID.scala 200:55]
  assign io_if_IDtoIF_jump_addr = jal_valid ? _T_84 : _GEN_133; // @[ID.scala 186:27]
  assign io_if_IDtoIF_jump_valid = jump_valid | bra_valid_true; // @[ID.scala 187:27]
  assign io_if_IDtoEX_alu_func = {{2'd0}, _GEN_118}; // @[ID.scala 190:28]
  assign io_if_IDtoEX_ldst_func = {{3'd0}, func3}; // @[ID.scala 191:28]
  assign io_if_IDtoEX_imm = io_if_IFtoID_valid ? _GEN_101 : 32'h0; // @[ID.scala 192:28]
  assign io_if_IDtoEX_imm_sel = _T_121 | auipc_valid; // @[ID.scala 193:28]
  assign io_if_IDtoEX_rd = _T_51 ? 5'h0 : _T_9; // @[ID.scala 196:28]
  assign io_if_IDtoEX_load_valid = io_if_IFtoID_valid & _T_54; // @[ID.scala 202:28]
  assign io_if_IDtoEX_alu_valid = _T_130 | fence_valid; // @[ID.scala 197:28]
  assign io_if_IDtoEX_store_valid = io_if_IFtoID_valid & _GEN_105; // @[ID.scala 203:28]
  assign io_if_IDtoRF_rs1 = io_if_IFtoID_opcode[19:15]; // @[ID.scala 205:28]
  assign io_if_IDtoRF_rs2 = io_if_IFtoID_opcode[24:20]; // @[ID.scala 206:28]
  assign io_illigal_op = io_if_IFtoID_valid & _GEN_114; // @[ID.scala 208:17]
endmodule
module RF(
  input         clock,
  input         reset,
  output [31:0] io_if_RFtoEX_d_rs1,
  output [31:0] io_if_RFtoEX_d_rs2,
  input  [4:0]  io_if_WBtoRF_rd,
  input  [31:0] io_if_WBtoRF_wdata,
  input         io_if_WBtoRF_valid,
  input  [4:0]  io_if_IDtoRF_rs1,
  input  [4:0]  io_if_IDtoRF_rs2,
  output [31:0] io_if_RFtoID_d_rs1,
  output [31:0] io_if_RFtoID_d_rs2,
  output [31:0] io_info_rf_0,
  output [31:0] io_info_rf_1,
  output [31:0] io_info_rf_2,
  output [31:0] io_info_rf_3,
  output [31:0] io_info_rf_4,
  output [31:0] io_info_rf_5,
  output [31:0] io_info_rf_6,
  output [31:0] io_info_rf_7,
  output [31:0] io_info_rf_8,
  output [31:0] io_info_rf_9,
  output [31:0] io_info_rf_10,
  output [31:0] io_info_rf_11,
  output [31:0] io_info_rf_12,
  output [31:0] io_info_rf_13,
  output [31:0] io_info_rf_14,
  output [31:0] io_info_rf_15,
  output [31:0] io_info_rf_16,
  output [31:0] io_info_rf_17,
  output [31:0] io_info_rf_18,
  output [31:0] io_info_rf_19,
  output [31:0] io_info_rf_20,
  output [31:0] io_info_rf_21,
  output [31:0] io_info_rf_22,
  output [31:0] io_info_rf_23,
  output [31:0] io_info_rf_24,
  output [31:0] io_info_rf_25,
  output [31:0] io_info_rf_26,
  output [31:0] io_info_rf_27,
  output [31:0] io_info_rf_28,
  output [31:0] io_info_rf_29,
  output [31:0] io_info_rf_30,
  output [31:0] io_info_rf_31
);
  reg [31:0] r_RegFile_0; // @[RF.scala 16:26]
  reg [31:0] _RAND_0;
  reg [31:0] r_RegFile_1; // @[RF.scala 16:26]
  reg [31:0] _RAND_1;
  reg [31:0] r_RegFile_2; // @[RF.scala 16:26]
  reg [31:0] _RAND_2;
  reg [31:0] r_RegFile_3; // @[RF.scala 16:26]
  reg [31:0] _RAND_3;
  reg [31:0] r_RegFile_4; // @[RF.scala 16:26]
  reg [31:0] _RAND_4;
  reg [31:0] r_RegFile_5; // @[RF.scala 16:26]
  reg [31:0] _RAND_5;
  reg [31:0] r_RegFile_6; // @[RF.scala 16:26]
  reg [31:0] _RAND_6;
  reg [31:0] r_RegFile_7; // @[RF.scala 16:26]
  reg [31:0] _RAND_7;
  reg [31:0] r_RegFile_8; // @[RF.scala 16:26]
  reg [31:0] _RAND_8;
  reg [31:0] r_RegFile_9; // @[RF.scala 16:26]
  reg [31:0] _RAND_9;
  reg [31:0] r_RegFile_10; // @[RF.scala 16:26]
  reg [31:0] _RAND_10;
  reg [31:0] r_RegFile_11; // @[RF.scala 16:26]
  reg [31:0] _RAND_11;
  reg [31:0] r_RegFile_12; // @[RF.scala 16:26]
  reg [31:0] _RAND_12;
  reg [31:0] r_RegFile_13; // @[RF.scala 16:26]
  reg [31:0] _RAND_13;
  reg [31:0] r_RegFile_14; // @[RF.scala 16:26]
  reg [31:0] _RAND_14;
  reg [31:0] r_RegFile_15; // @[RF.scala 16:26]
  reg [31:0] _RAND_15;
  reg [31:0] r_RegFile_16; // @[RF.scala 16:26]
  reg [31:0] _RAND_16;
  reg [31:0] r_RegFile_17; // @[RF.scala 16:26]
  reg [31:0] _RAND_17;
  reg [31:0] r_RegFile_18; // @[RF.scala 16:26]
  reg [31:0] _RAND_18;
  reg [31:0] r_RegFile_19; // @[RF.scala 16:26]
  reg [31:0] _RAND_19;
  reg [31:0] r_RegFile_20; // @[RF.scala 16:26]
  reg [31:0] _RAND_20;
  reg [31:0] r_RegFile_21; // @[RF.scala 16:26]
  reg [31:0] _RAND_21;
  reg [31:0] r_RegFile_22; // @[RF.scala 16:26]
  reg [31:0] _RAND_22;
  reg [31:0] r_RegFile_23; // @[RF.scala 16:26]
  reg [31:0] _RAND_23;
  reg [31:0] r_RegFile_24; // @[RF.scala 16:26]
  reg [31:0] _RAND_24;
  reg [31:0] r_RegFile_25; // @[RF.scala 16:26]
  reg [31:0] _RAND_25;
  reg [31:0] r_RegFile_26; // @[RF.scala 16:26]
  reg [31:0] _RAND_26;
  reg [31:0] r_RegFile_27; // @[RF.scala 16:26]
  reg [31:0] _RAND_27;
  reg [31:0] r_RegFile_28; // @[RF.scala 16:26]
  reg [31:0] _RAND_28;
  reg [31:0] r_RegFile_29; // @[RF.scala 16:26]
  reg [31:0] _RAND_29;
  reg [31:0] r_RegFile_30; // @[RF.scala 16:26]
  reg [31:0] _RAND_30;
  reg [31:0] r_RegFile_31; // @[RF.scala 16:26]
  reg [31:0] _RAND_31;
  wire [31:0] _GEN_33; // @[RF.scala 34:22]
  wire [31:0] _GEN_34; // @[RF.scala 34:22]
  wire [31:0] _GEN_35; // @[RF.scala 34:22]
  wire [31:0] _GEN_36; // @[RF.scala 34:22]
  wire [31:0] _GEN_37; // @[RF.scala 34:22]
  wire [31:0] _GEN_38; // @[RF.scala 34:22]
  wire [31:0] _GEN_39; // @[RF.scala 34:22]
  wire [31:0] _GEN_40; // @[RF.scala 34:22]
  wire [31:0] _GEN_41; // @[RF.scala 34:22]
  wire [31:0] _GEN_42; // @[RF.scala 34:22]
  wire [31:0] _GEN_43; // @[RF.scala 34:22]
  wire [31:0] _GEN_44; // @[RF.scala 34:22]
  wire [31:0] _GEN_45; // @[RF.scala 34:22]
  wire [31:0] _GEN_46; // @[RF.scala 34:22]
  wire [31:0] _GEN_47; // @[RF.scala 34:22]
  wire [31:0] _GEN_48; // @[RF.scala 34:22]
  wire [31:0] _GEN_49; // @[RF.scala 34:22]
  wire [31:0] _GEN_50; // @[RF.scala 34:22]
  wire [31:0] _GEN_51; // @[RF.scala 34:22]
  wire [31:0] _GEN_52; // @[RF.scala 34:22]
  wire [31:0] _GEN_53; // @[RF.scala 34:22]
  wire [31:0] _GEN_54; // @[RF.scala 34:22]
  wire [31:0] _GEN_55; // @[RF.scala 34:22]
  wire [31:0] _GEN_56; // @[RF.scala 34:22]
  wire [31:0] _GEN_57; // @[RF.scala 34:22]
  wire [31:0] _GEN_58; // @[RF.scala 34:22]
  wire [31:0] _GEN_59; // @[RF.scala 34:22]
  wire [31:0] _GEN_60; // @[RF.scala 34:22]
  wire [31:0] _GEN_61; // @[RF.scala 34:22]
  wire [31:0] _GEN_62; // @[RF.scala 34:22]
  wire [31:0] _GEN_65; // @[RF.scala 35:22]
  wire [31:0] _GEN_66; // @[RF.scala 35:22]
  wire [31:0] _GEN_67; // @[RF.scala 35:22]
  wire [31:0] _GEN_68; // @[RF.scala 35:22]
  wire [31:0] _GEN_69; // @[RF.scala 35:22]
  wire [31:0] _GEN_70; // @[RF.scala 35:22]
  wire [31:0] _GEN_71; // @[RF.scala 35:22]
  wire [31:0] _GEN_72; // @[RF.scala 35:22]
  wire [31:0] _GEN_73; // @[RF.scala 35:22]
  wire [31:0] _GEN_74; // @[RF.scala 35:22]
  wire [31:0] _GEN_75; // @[RF.scala 35:22]
  wire [31:0] _GEN_76; // @[RF.scala 35:22]
  wire [31:0] _GEN_77; // @[RF.scala 35:22]
  wire [31:0] _GEN_78; // @[RF.scala 35:22]
  wire [31:0] _GEN_79; // @[RF.scala 35:22]
  wire [31:0] _GEN_80; // @[RF.scala 35:22]
  wire [31:0] _GEN_81; // @[RF.scala 35:22]
  wire [31:0] _GEN_82; // @[RF.scala 35:22]
  wire [31:0] _GEN_83; // @[RF.scala 35:22]
  wire [31:0] _GEN_84; // @[RF.scala 35:22]
  wire [31:0] _GEN_85; // @[RF.scala 35:22]
  wire [31:0] _GEN_86; // @[RF.scala 35:22]
  wire [31:0] _GEN_87; // @[RF.scala 35:22]
  wire [31:0] _GEN_88; // @[RF.scala 35:22]
  wire [31:0] _GEN_89; // @[RF.scala 35:22]
  wire [31:0] _GEN_90; // @[RF.scala 35:22]
  wire [31:0] _GEN_91; // @[RF.scala 35:22]
  wire [31:0] _GEN_92; // @[RF.scala 35:22]
  wire [31:0] _GEN_93; // @[RF.scala 35:22]
  wire [31:0] _GEN_94; // @[RF.scala 35:22]
  wire  _T_2; // @[RF.scala 41:15]
  assign _GEN_33 = 5'h1 == io_if_IDtoRF_rs1 ? r_RegFile_1 : r_RegFile_0; // @[RF.scala 34:22]
  assign _GEN_34 = 5'h2 == io_if_IDtoRF_rs1 ? r_RegFile_2 : _GEN_33; // @[RF.scala 34:22]
  assign _GEN_35 = 5'h3 == io_if_IDtoRF_rs1 ? r_RegFile_3 : _GEN_34; // @[RF.scala 34:22]
  assign _GEN_36 = 5'h4 == io_if_IDtoRF_rs1 ? r_RegFile_4 : _GEN_35; // @[RF.scala 34:22]
  assign _GEN_37 = 5'h5 == io_if_IDtoRF_rs1 ? r_RegFile_5 : _GEN_36; // @[RF.scala 34:22]
  assign _GEN_38 = 5'h6 == io_if_IDtoRF_rs1 ? r_RegFile_6 : _GEN_37; // @[RF.scala 34:22]
  assign _GEN_39 = 5'h7 == io_if_IDtoRF_rs1 ? r_RegFile_7 : _GEN_38; // @[RF.scala 34:22]
  assign _GEN_40 = 5'h8 == io_if_IDtoRF_rs1 ? r_RegFile_8 : _GEN_39; // @[RF.scala 34:22]
  assign _GEN_41 = 5'h9 == io_if_IDtoRF_rs1 ? r_RegFile_9 : _GEN_40; // @[RF.scala 34:22]
  assign _GEN_42 = 5'ha == io_if_IDtoRF_rs1 ? r_RegFile_10 : _GEN_41; // @[RF.scala 34:22]
  assign _GEN_43 = 5'hb == io_if_IDtoRF_rs1 ? r_RegFile_11 : _GEN_42; // @[RF.scala 34:22]
  assign _GEN_44 = 5'hc == io_if_IDtoRF_rs1 ? r_RegFile_12 : _GEN_43; // @[RF.scala 34:22]
  assign _GEN_45 = 5'hd == io_if_IDtoRF_rs1 ? r_RegFile_13 : _GEN_44; // @[RF.scala 34:22]
  assign _GEN_46 = 5'he == io_if_IDtoRF_rs1 ? r_RegFile_14 : _GEN_45; // @[RF.scala 34:22]
  assign _GEN_47 = 5'hf == io_if_IDtoRF_rs1 ? r_RegFile_15 : _GEN_46; // @[RF.scala 34:22]
  assign _GEN_48 = 5'h10 == io_if_IDtoRF_rs1 ? r_RegFile_16 : _GEN_47; // @[RF.scala 34:22]
  assign _GEN_49 = 5'h11 == io_if_IDtoRF_rs1 ? r_RegFile_17 : _GEN_48; // @[RF.scala 34:22]
  assign _GEN_50 = 5'h12 == io_if_IDtoRF_rs1 ? r_RegFile_18 : _GEN_49; // @[RF.scala 34:22]
  assign _GEN_51 = 5'h13 == io_if_IDtoRF_rs1 ? r_RegFile_19 : _GEN_50; // @[RF.scala 34:22]
  assign _GEN_52 = 5'h14 == io_if_IDtoRF_rs1 ? r_RegFile_20 : _GEN_51; // @[RF.scala 34:22]
  assign _GEN_53 = 5'h15 == io_if_IDtoRF_rs1 ? r_RegFile_21 : _GEN_52; // @[RF.scala 34:22]
  assign _GEN_54 = 5'h16 == io_if_IDtoRF_rs1 ? r_RegFile_22 : _GEN_53; // @[RF.scala 34:22]
  assign _GEN_55 = 5'h17 == io_if_IDtoRF_rs1 ? r_RegFile_23 : _GEN_54; // @[RF.scala 34:22]
  assign _GEN_56 = 5'h18 == io_if_IDtoRF_rs1 ? r_RegFile_24 : _GEN_55; // @[RF.scala 34:22]
  assign _GEN_57 = 5'h19 == io_if_IDtoRF_rs1 ? r_RegFile_25 : _GEN_56; // @[RF.scala 34:22]
  assign _GEN_58 = 5'h1a == io_if_IDtoRF_rs1 ? r_RegFile_26 : _GEN_57; // @[RF.scala 34:22]
  assign _GEN_59 = 5'h1b == io_if_IDtoRF_rs1 ? r_RegFile_27 : _GEN_58; // @[RF.scala 34:22]
  assign _GEN_60 = 5'h1c == io_if_IDtoRF_rs1 ? r_RegFile_28 : _GEN_59; // @[RF.scala 34:22]
  assign _GEN_61 = 5'h1d == io_if_IDtoRF_rs1 ? r_RegFile_29 : _GEN_60; // @[RF.scala 34:22]
  assign _GEN_62 = 5'h1e == io_if_IDtoRF_rs1 ? r_RegFile_30 : _GEN_61; // @[RF.scala 34:22]
  assign _GEN_65 = 5'h1 == io_if_IDtoRF_rs2 ? r_RegFile_1 : r_RegFile_0; // @[RF.scala 35:22]
  assign _GEN_66 = 5'h2 == io_if_IDtoRF_rs2 ? r_RegFile_2 : _GEN_65; // @[RF.scala 35:22]
  assign _GEN_67 = 5'h3 == io_if_IDtoRF_rs2 ? r_RegFile_3 : _GEN_66; // @[RF.scala 35:22]
  assign _GEN_68 = 5'h4 == io_if_IDtoRF_rs2 ? r_RegFile_4 : _GEN_67; // @[RF.scala 35:22]
  assign _GEN_69 = 5'h5 == io_if_IDtoRF_rs2 ? r_RegFile_5 : _GEN_68; // @[RF.scala 35:22]
  assign _GEN_70 = 5'h6 == io_if_IDtoRF_rs2 ? r_RegFile_6 : _GEN_69; // @[RF.scala 35:22]
  assign _GEN_71 = 5'h7 == io_if_IDtoRF_rs2 ? r_RegFile_7 : _GEN_70; // @[RF.scala 35:22]
  assign _GEN_72 = 5'h8 == io_if_IDtoRF_rs2 ? r_RegFile_8 : _GEN_71; // @[RF.scala 35:22]
  assign _GEN_73 = 5'h9 == io_if_IDtoRF_rs2 ? r_RegFile_9 : _GEN_72; // @[RF.scala 35:22]
  assign _GEN_74 = 5'ha == io_if_IDtoRF_rs2 ? r_RegFile_10 : _GEN_73; // @[RF.scala 35:22]
  assign _GEN_75 = 5'hb == io_if_IDtoRF_rs2 ? r_RegFile_11 : _GEN_74; // @[RF.scala 35:22]
  assign _GEN_76 = 5'hc == io_if_IDtoRF_rs2 ? r_RegFile_12 : _GEN_75; // @[RF.scala 35:22]
  assign _GEN_77 = 5'hd == io_if_IDtoRF_rs2 ? r_RegFile_13 : _GEN_76; // @[RF.scala 35:22]
  assign _GEN_78 = 5'he == io_if_IDtoRF_rs2 ? r_RegFile_14 : _GEN_77; // @[RF.scala 35:22]
  assign _GEN_79 = 5'hf == io_if_IDtoRF_rs2 ? r_RegFile_15 : _GEN_78; // @[RF.scala 35:22]
  assign _GEN_80 = 5'h10 == io_if_IDtoRF_rs2 ? r_RegFile_16 : _GEN_79; // @[RF.scala 35:22]
  assign _GEN_81 = 5'h11 == io_if_IDtoRF_rs2 ? r_RegFile_17 : _GEN_80; // @[RF.scala 35:22]
  assign _GEN_82 = 5'h12 == io_if_IDtoRF_rs2 ? r_RegFile_18 : _GEN_81; // @[RF.scala 35:22]
  assign _GEN_83 = 5'h13 == io_if_IDtoRF_rs2 ? r_RegFile_19 : _GEN_82; // @[RF.scala 35:22]
  assign _GEN_84 = 5'h14 == io_if_IDtoRF_rs2 ? r_RegFile_20 : _GEN_83; // @[RF.scala 35:22]
  assign _GEN_85 = 5'h15 == io_if_IDtoRF_rs2 ? r_RegFile_21 : _GEN_84; // @[RF.scala 35:22]
  assign _GEN_86 = 5'h16 == io_if_IDtoRF_rs2 ? r_RegFile_22 : _GEN_85; // @[RF.scala 35:22]
  assign _GEN_87 = 5'h17 == io_if_IDtoRF_rs2 ? r_RegFile_23 : _GEN_86; // @[RF.scala 35:22]
  assign _GEN_88 = 5'h18 == io_if_IDtoRF_rs2 ? r_RegFile_24 : _GEN_87; // @[RF.scala 35:22]
  assign _GEN_89 = 5'h19 == io_if_IDtoRF_rs2 ? r_RegFile_25 : _GEN_88; // @[RF.scala 35:22]
  assign _GEN_90 = 5'h1a == io_if_IDtoRF_rs2 ? r_RegFile_26 : _GEN_89; // @[RF.scala 35:22]
  assign _GEN_91 = 5'h1b == io_if_IDtoRF_rs2 ? r_RegFile_27 : _GEN_90; // @[RF.scala 35:22]
  assign _GEN_92 = 5'h1c == io_if_IDtoRF_rs2 ? r_RegFile_28 : _GEN_91; // @[RF.scala 35:22]
  assign _GEN_93 = 5'h1d == io_if_IDtoRF_rs2 ? r_RegFile_29 : _GEN_92; // @[RF.scala 35:22]
  assign _GEN_94 = 5'h1e == io_if_IDtoRF_rs2 ? r_RegFile_30 : _GEN_93; // @[RF.scala 35:22]
  assign _T_2 = io_if_WBtoRF_rd != 5'h0; // @[RF.scala 41:15]
  assign io_if_RFtoEX_d_rs1 = 5'h1f == io_if_IDtoRF_rs1 ? r_RegFile_31 : _GEN_62; // @[RF.scala 34:22]
  assign io_if_RFtoEX_d_rs2 = 5'h1f == io_if_IDtoRF_rs2 ? r_RegFile_31 : _GEN_94; // @[RF.scala 35:22]
  assign io_if_RFtoID_d_rs1 = 5'h1f == io_if_IDtoRF_rs1 ? r_RegFile_31 : _GEN_62; // @[RF.scala 37:22]
  assign io_if_RFtoID_d_rs2 = 5'h1f == io_if_IDtoRF_rs2 ? r_RegFile_31 : _GEN_94; // @[RF.scala 38:22]
  assign io_info_rf_0 = r_RegFile_0; // @[RF.scala 18:14]
  assign io_info_rf_1 = r_RegFile_1; // @[RF.scala 18:14]
  assign io_info_rf_2 = r_RegFile_2; // @[RF.scala 18:14]
  assign io_info_rf_3 = r_RegFile_3; // @[RF.scala 18:14]
  assign io_info_rf_4 = r_RegFile_4; // @[RF.scala 18:14]
  assign io_info_rf_5 = r_RegFile_5; // @[RF.scala 18:14]
  assign io_info_rf_6 = r_RegFile_6; // @[RF.scala 18:14]
  assign io_info_rf_7 = r_RegFile_7; // @[RF.scala 18:14]
  assign io_info_rf_8 = r_RegFile_8; // @[RF.scala 18:14]
  assign io_info_rf_9 = r_RegFile_9; // @[RF.scala 18:14]
  assign io_info_rf_10 = r_RegFile_10; // @[RF.scala 18:14]
  assign io_info_rf_11 = r_RegFile_11; // @[RF.scala 18:14]
  assign io_info_rf_12 = r_RegFile_12; // @[RF.scala 18:14]
  assign io_info_rf_13 = r_RegFile_13; // @[RF.scala 18:14]
  assign io_info_rf_14 = r_RegFile_14; // @[RF.scala 18:14]
  assign io_info_rf_15 = r_RegFile_15; // @[RF.scala 18:14]
  assign io_info_rf_16 = r_RegFile_16; // @[RF.scala 18:14]
  assign io_info_rf_17 = r_RegFile_17; // @[RF.scala 18:14]
  assign io_info_rf_18 = r_RegFile_18; // @[RF.scala 18:14]
  assign io_info_rf_19 = r_RegFile_19; // @[RF.scala 18:14]
  assign io_info_rf_20 = r_RegFile_20; // @[RF.scala 18:14]
  assign io_info_rf_21 = r_RegFile_21; // @[RF.scala 18:14]
  assign io_info_rf_22 = r_RegFile_22; // @[RF.scala 18:14]
  assign io_info_rf_23 = r_RegFile_23; // @[RF.scala 18:14]
  assign io_info_rf_24 = r_RegFile_24; // @[RF.scala 18:14]
  assign io_info_rf_25 = r_RegFile_25; // @[RF.scala 18:14]
  assign io_info_rf_26 = r_RegFile_26; // @[RF.scala 18:14]
  assign io_info_rf_27 = r_RegFile_27; // @[RF.scala 18:14]
  assign io_info_rf_28 = r_RegFile_28; // @[RF.scala 18:14]
  assign io_info_rf_29 = r_RegFile_29; // @[RF.scala 18:14]
  assign io_info_rf_30 = r_RegFile_30; // @[RF.scala 18:14]
  assign io_info_rf_31 = r_RegFile_31; // @[RF.scala 18:14]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  r_RegFile_0 = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  r_RegFile_1 = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  r_RegFile_2 = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  r_RegFile_3 = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  r_RegFile_4 = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  r_RegFile_5 = _RAND_5[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  r_RegFile_6 = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  r_RegFile_7 = _RAND_7[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  r_RegFile_8 = _RAND_8[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  r_RegFile_9 = _RAND_9[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  r_RegFile_10 = _RAND_10[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  r_RegFile_11 = _RAND_11[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  r_RegFile_12 = _RAND_12[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  r_RegFile_13 = _RAND_13[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  r_RegFile_14 = _RAND_14[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  r_RegFile_15 = _RAND_15[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  r_RegFile_16 = _RAND_16[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  r_RegFile_17 = _RAND_17[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  r_RegFile_18 = _RAND_18[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  r_RegFile_19 = _RAND_19[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  r_RegFile_20 = _RAND_20[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  r_RegFile_21 = _RAND_21[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  r_RegFile_22 = _RAND_22[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  r_RegFile_23 = _RAND_23[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  r_RegFile_24 = _RAND_24[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  r_RegFile_25 = _RAND_25[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  r_RegFile_26 = _RAND_26[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  r_RegFile_27 = _RAND_27[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  r_RegFile_28 = _RAND_28[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  r_RegFile_29 = _RAND_29[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  r_RegFile_30 = _RAND_30[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{`RANDOM}};
  r_RegFile_31 = _RAND_31[31:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      r_RegFile_0 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'h0 == io_if_WBtoRF_rd) begin
          r_RegFile_0 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_1 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'h1 == io_if_WBtoRF_rd) begin
          r_RegFile_1 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_2 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'h2 == io_if_WBtoRF_rd) begin
          r_RegFile_2 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_3 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'h3 == io_if_WBtoRF_rd) begin
          r_RegFile_3 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_4 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'h4 == io_if_WBtoRF_rd) begin
          r_RegFile_4 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_5 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'h5 == io_if_WBtoRF_rd) begin
          r_RegFile_5 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_6 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'h6 == io_if_WBtoRF_rd) begin
          r_RegFile_6 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_7 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'h7 == io_if_WBtoRF_rd) begin
          r_RegFile_7 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_8 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'h8 == io_if_WBtoRF_rd) begin
          r_RegFile_8 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_9 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'h9 == io_if_WBtoRF_rd) begin
          r_RegFile_9 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_10 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'ha == io_if_WBtoRF_rd) begin
          r_RegFile_10 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_11 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'hb == io_if_WBtoRF_rd) begin
          r_RegFile_11 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_12 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'hc == io_if_WBtoRF_rd) begin
          r_RegFile_12 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_13 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'hd == io_if_WBtoRF_rd) begin
          r_RegFile_13 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_14 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'he == io_if_WBtoRF_rd) begin
          r_RegFile_14 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_15 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'hf == io_if_WBtoRF_rd) begin
          r_RegFile_15 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_16 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'h10 == io_if_WBtoRF_rd) begin
          r_RegFile_16 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_17 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'h11 == io_if_WBtoRF_rd) begin
          r_RegFile_17 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_18 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'h12 == io_if_WBtoRF_rd) begin
          r_RegFile_18 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_19 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'h13 == io_if_WBtoRF_rd) begin
          r_RegFile_19 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_20 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'h14 == io_if_WBtoRF_rd) begin
          r_RegFile_20 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_21 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'h15 == io_if_WBtoRF_rd) begin
          r_RegFile_21 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_22 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'h16 == io_if_WBtoRF_rd) begin
          r_RegFile_22 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_23 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'h17 == io_if_WBtoRF_rd) begin
          r_RegFile_23 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_24 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'h18 == io_if_WBtoRF_rd) begin
          r_RegFile_24 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_25 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'h19 == io_if_WBtoRF_rd) begin
          r_RegFile_25 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_26 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'h1a == io_if_WBtoRF_rd) begin
          r_RegFile_26 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_27 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'h1b == io_if_WBtoRF_rd) begin
          r_RegFile_27 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_28 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'h1c == io_if_WBtoRF_rd) begin
          r_RegFile_28 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_29 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'h1d == io_if_WBtoRF_rd) begin
          r_RegFile_29 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_30 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'h1e == io_if_WBtoRF_rd) begin
          r_RegFile_30 <= io_if_WBtoRF_wdata;
        end
      end
    end
    if (reset) begin
      r_RegFile_31 <= 32'h0;
    end else if (io_if_WBtoRF_valid) begin
      if (_T_2) begin
        if (5'h1f == io_if_WBtoRF_rd) begin
          r_RegFile_31 <= io_if_WBtoRF_wdata;
        end
      end
    end
  end
endmodule
module EX(
  input  [5:0]  io_if_IDtoEX_alu_func,
  input  [5:0]  io_if_IDtoEX_ldst_func,
  input  [31:0] io_if_IDtoEX_imm,
  input         io_if_IDtoEX_imm_sel,
  input  [4:0]  io_if_IDtoEX_rd,
  input         io_if_IDtoEX_load_valid,
  input         io_if_IDtoEX_alu_valid,
  input         io_if_IDtoEX_store_valid,
  input  [31:0] io_if_RFtoEX_d_rs1,
  input  [31:0] io_if_RFtoEX_d_rs2,
  output [4:0]  io_if_EXtoWB_rd,
  output [31:0] io_if_EXtoWB_wbdata,
  output        io_if_EXtoWB_wbvalid,
  output        io_if_EXtoWB_valid,
  output        io_if_mem_we,
  output [31:0] io_if_mem_wdata,
  output [15:0] io_if_mem_addr,
  input  [31:0] io_if_mem_rdata
);
  wire [31:0] alu_b; // @[EX.scala 23:24]
  wire [3:0] _T_1; // @[EX.scala 30:18]
  wire  _T_2; // @[Conditional.scala 37:30]
  wire [31:0] _T_4; // @[EX.scala 31:46]
  wire  _T_5; // @[Conditional.scala 37:30]
  wire [4:0] _T_6; // @[EX.scala 32:54]
  wire [62:0] _GEN_40; // @[EX.scala 32:46]
  wire [62:0] _T_7; // @[EX.scala 32:46]
  wire  _T_8; // @[Conditional.scala 37:30]
  wire [31:0] _T_9; // @[EX.scala 33:46]
  wire [31:0] _T_10; // @[EX.scala 33:61]
  wire  _T_11; // @[EX.scala 33:53]
  wire  _T_12; // @[Conditional.scala 37:30]
  wire  _T_13; // @[EX.scala 34:46]
  wire  _T_14; // @[Conditional.scala 37:30]
  wire [31:0] _T_16; // @[EX.scala 35:54]
  wire  _T_17; // @[Conditional.scala 37:30]
  wire [31:0] _T_20; // @[EX.scala 36:54]
  wire [31:0] _T_21; // @[EX.scala 36:69]
  wire  _T_22; // @[Conditional.scala 37:30]
  wire [31:0] _T_23; // @[EX.scala 38:45]
  wire  _T_24; // @[Conditional.scala 37:30]
  wire [31:0] _T_25; // @[EX.scala 39:45]
  wire  _T_26; // @[Conditional.scala 37:30]
  wire [31:0] _T_27; // @[EX.scala 40:45]
  wire  _T_28; // @[Conditional.scala 37:30]
  wire [31:0] _T_30; // @[EX.scala 41:45]
  wire  _T_31; // @[Conditional.scala 37:30]
  wire  _T_32; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_1; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_2; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_3; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_4; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_5; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_6; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_7; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_8; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_9; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_10; // @[Conditional.scala 39:67]
  wire [62:0] _GEN_11; // @[Conditional.scala 39:67]
  wire [62:0] _GEN_12; // @[Conditional.scala 40:58]
  wire [15:0] d_rs2_h; // @[EX.scala 53:23]
  wire [7:0] d_rs2_b; // @[EX.scala 54:23]
  wire [31:0] _T_34; // @[EX.scala 55:41]
  wire [15:0] addr; // @[EX.scala 55:60]
  wire  _T_37; // @[EX.scala 57:19]
  wire [1:0] _T_38; // @[EX.scala 58:16]
  wire  _T_39; // @[EX.scala 58:22]
  wire [23:0] _T_40; // @[EX.scala 59:27]
  wire [31:0] _T_41; // @[Cat.scala 29:58]
  wire  _T_43; // @[EX.scala 60:28]
  wire [15:0] _T_44; // @[EX.scala 61:27]
  wire [7:0] _T_45; // @[EX.scala 61:50]
  wire [31:0] _T_47; // @[Cat.scala 29:58]
  wire  _T_49; // @[EX.scala 62:28]
  wire [7:0] _T_50; // @[EX.scala 63:27]
  wire [15:0] _T_51; // @[EX.scala 63:50]
  wire [31:0] _T_53; // @[Cat.scala 29:58]
  wire  _T_55; // @[EX.scala 64:28]
  wire [23:0] _T_56; // @[EX.scala 65:36]
  wire [31:0] _T_57; // @[Cat.scala 29:58]
  wire [31:0] _GEN_13; // @[EX.scala 64:38]
  wire [31:0] _GEN_14; // @[EX.scala 62:38]
  wire [31:0] _GEN_15; // @[EX.scala 60:38]
  wire [31:0] _GEN_16; // @[EX.scala 58:32]
  wire  _T_58; // @[EX.scala 67:26]
  wire [31:0] _T_62; // @[Cat.scala 29:58]
  wire [31:0] _T_66; // @[Cat.scala 29:58]
  wire [31:0] _GEN_17; // @[EX.scala 70:37]
  wire [31:0] _GEN_18; // @[EX.scala 68:32]
  wire  _T_67; // @[EX.scala 73:26]
  wire [31:0] _GEN_19; // @[EX.scala 73:34]
  wire [31:0] _GEN_20; // @[EX.scala 67:34]
  wire [31:0] _GEN_21; // @[EX.scala 57:26]
  wire  wb_valid; // @[EX.scala 91:39]
  wire [7:0] _T_77; // @[EX.scala 99:23]
  wire [7:0] _T_80; // @[EX.scala 101:23]
  wire [7:0] _GEN_23; // @[EX.scala 102:36]
  wire [7:0] _GEN_24; // @[EX.scala 100:36]
  wire [7:0] _GEN_25; // @[EX.scala 98:36]
  wire [7:0] _GEN_26; // @[EX.scala 96:30]
  wire [15:0] _GEN_27; // @[EX.scala 107:35]
  wire [15:0] _GEN_28; // @[EX.scala 105:30]
  wire [7:0] _GEN_34; // @[EX.scala 95:46]
  wire [7:0] rdata_b; // @[EX.scala 93:39]
  wire  _T_91; // @[EX.scala 112:38]
  wire [23:0] _T_93; // @[Bitwise.scala 71:12]
  wire [31:0] _T_95; // @[Cat.scala 29:58]
  wire  _T_96; // @[EX.scala 113:25]
  wire [15:0] _GEN_35; // @[EX.scala 95:46]
  wire [15:0] rdata_h; // @[EX.scala 93:39]
  wire  _T_98; // @[EX.scala 116:38]
  wire [15:0] _T_100; // @[Bitwise.scala 71:12]
  wire [31:0] _T_102; // @[Cat.scala 29:58]
  wire  _T_103; // @[EX.scala 117:26]
  wire [31:0] _GEN_29; // @[EX.scala 119:34]
  wire [31:0] _GEN_30; // @[EX.scala 117:34]
  wire [31:0] _GEN_31; // @[EX.scala 115:34]
  wire [31:0] _GEN_32; // @[EX.scala 113:32]
  wire [31:0] _GEN_33; // @[EX.scala 111:26]
  wire [31:0] _GEN_36; // @[EX.scala 95:46]
  wire [31:0] o_alu; // @[EX.scala 21:22 EX.scala 28:9 EX.scala 31:36 EX.scala 32:36 EX.scala 33:36 EX.scala 34:36 EX.scala 35:36 EX.scala 36:36 EX.scala 38:36 EX.scala 39:36 EX.scala 40:36 EX.scala 41:36 EX.scala 42:36 EX.scala 43:36]
  assign alu_b = io_if_IDtoEX_imm_sel ? io_if_IDtoEX_imm : io_if_RFtoEX_d_rs2; // @[EX.scala 23:24]
  assign _T_1 = io_if_IDtoEX_alu_func[3:0]; // @[EX.scala 30:18]
  assign _T_2 = 4'h0 == _T_1; // @[Conditional.scala 37:30]
  assign _T_4 = io_if_RFtoEX_d_rs1 + alu_b; // @[EX.scala 31:46]
  assign _T_5 = 4'h1 == _T_1; // @[Conditional.scala 37:30]
  assign _T_6 = alu_b[4:0]; // @[EX.scala 32:54]
  assign _GEN_40 = {{31'd0}, io_if_RFtoEX_d_rs1}; // @[EX.scala 32:46]
  assign _T_7 = _GEN_40 << _T_6; // @[EX.scala 32:46]
  assign _T_8 = 4'h2 == _T_1; // @[Conditional.scala 37:30]
  assign _T_9 = $signed(io_if_RFtoEX_d_rs1); // @[EX.scala 33:46]
  assign _T_10 = $signed(alu_b); // @[EX.scala 33:61]
  assign _T_11 = $signed(_T_9) < $signed(_T_10); // @[EX.scala 33:53]
  assign _T_12 = 4'h3 == _T_1; // @[Conditional.scala 37:30]
  assign _T_13 = io_if_RFtoEX_d_rs1 < alu_b; // @[EX.scala 34:46]
  assign _T_14 = 4'h5 == _T_1; // @[Conditional.scala 37:30]
  assign _T_16 = io_if_RFtoEX_d_rs1 >> _T_6; // @[EX.scala 35:54]
  assign _T_17 = 4'hd == _T_1; // @[Conditional.scala 37:30]
  assign _T_20 = $signed(_T_9) >>> _T_6; // @[EX.scala 36:54]
  assign _T_21 = $unsigned(_T_20); // @[EX.scala 36:69]
  assign _T_22 = 4'h4 == _T_1; // @[Conditional.scala 37:30]
  assign _T_23 = io_if_RFtoEX_d_rs1 ^ alu_b; // @[EX.scala 38:45]
  assign _T_24 = 4'h6 == _T_1; // @[Conditional.scala 37:30]
  assign _T_25 = io_if_RFtoEX_d_rs1 | alu_b; // @[EX.scala 39:45]
  assign _T_26 = 4'h7 == _T_1; // @[Conditional.scala 37:30]
  assign _T_27 = io_if_RFtoEX_d_rs1 & alu_b; // @[EX.scala 40:45]
  assign _T_28 = 4'h8 == _T_1; // @[Conditional.scala 37:30]
  assign _T_30 = io_if_RFtoEX_d_rs1 - alu_b; // @[EX.scala 41:45]
  assign _T_31 = 4'h9 == _T_1; // @[Conditional.scala 37:30]
  assign _T_32 = 4'ha == _T_1; // @[Conditional.scala 37:30]
  assign _GEN_1 = _T_32 ? alu_b : 32'h0; // @[Conditional.scala 39:67]
  assign _GEN_2 = _T_31 ? io_if_RFtoEX_d_rs1 : _GEN_1; // @[Conditional.scala 39:67]
  assign _GEN_3 = _T_28 ? _T_30 : _GEN_2; // @[Conditional.scala 39:67]
  assign _GEN_4 = _T_26 ? _T_27 : _GEN_3; // @[Conditional.scala 39:67]
  assign _GEN_5 = _T_24 ? _T_25 : _GEN_4; // @[Conditional.scala 39:67]
  assign _GEN_6 = _T_22 ? _T_23 : _GEN_5; // @[Conditional.scala 39:67]
  assign _GEN_7 = _T_17 ? _T_21 : _GEN_6; // @[Conditional.scala 39:67]
  assign _GEN_8 = _T_14 ? _T_16 : _GEN_7; // @[Conditional.scala 39:67]
  assign _GEN_9 = _T_12 ? {{31'd0}, _T_13} : _GEN_8; // @[Conditional.scala 39:67]
  assign _GEN_10 = _T_8 ? {{31'd0}, _T_11} : _GEN_9; // @[Conditional.scala 39:67]
  assign _GEN_11 = _T_5 ? _T_7 : {{31'd0}, _GEN_10}; // @[Conditional.scala 39:67]
  assign _GEN_12 = _T_2 ? {{31'd0}, _T_4} : _GEN_11; // @[Conditional.scala 40:58]
  assign d_rs2_h = io_if_RFtoEX_d_rs2[15:0]; // @[EX.scala 53:23]
  assign d_rs2_b = io_if_RFtoEX_d_rs2[7:0]; // @[EX.scala 54:23]
  assign _T_34 = io_if_RFtoEX_d_rs1 + io_if_IDtoEX_imm; // @[EX.scala 55:41]
  assign addr = _T_34[15:0]; // @[EX.scala 55:60]
  assign _T_37 = io_if_IDtoEX_ldst_func == 6'h0; // @[EX.scala 57:19]
  assign _T_38 = addr[1:0]; // @[EX.scala 58:16]
  assign _T_39 = _T_38 == 2'h0; // @[EX.scala 58:22]
  assign _T_40 = io_if_mem_rdata[31:8]; // @[EX.scala 59:27]
  assign _T_41 = {_T_40,d_rs2_b}; // @[Cat.scala 29:58]
  assign _T_43 = _T_38 == 2'h1; // @[EX.scala 60:28]
  assign _T_44 = io_if_mem_rdata[31:16]; // @[EX.scala 61:27]
  assign _T_45 = io_if_mem_rdata[7:0]; // @[EX.scala 61:50]
  assign _T_47 = {_T_44,d_rs2_b,_T_45}; // @[Cat.scala 29:58]
  assign _T_49 = _T_38 == 2'h2; // @[EX.scala 62:28]
  assign _T_50 = io_if_mem_rdata[31:24]; // @[EX.scala 63:27]
  assign _T_51 = io_if_mem_rdata[15:0]; // @[EX.scala 63:50]
  assign _T_53 = {_T_50,d_rs2_b,_T_51}; // @[Cat.scala 29:58]
  assign _T_55 = _T_38 == 2'h3; // @[EX.scala 64:28]
  assign _T_56 = io_if_mem_rdata[23:0]; // @[EX.scala 65:36]
  assign _T_57 = {d_rs2_b,_T_56}; // @[Cat.scala 29:58]
  assign _GEN_13 = _T_55 ? _T_57 : 32'h0; // @[EX.scala 64:38]
  assign _GEN_14 = _T_49 ? _T_53 : _GEN_13; // @[EX.scala 62:38]
  assign _GEN_15 = _T_43 ? _T_47 : _GEN_14; // @[EX.scala 60:38]
  assign _GEN_16 = _T_39 ? _T_41 : _GEN_15; // @[EX.scala 58:32]
  assign _T_58 = io_if_IDtoEX_ldst_func == 6'h1; // @[EX.scala 67:26]
  assign _T_62 = {_T_44,d_rs2_h}; // @[Cat.scala 29:58]
  assign _T_66 = {d_rs2_h,_T_51}; // @[Cat.scala 29:58]
  assign _GEN_17 = _T_49 ? _T_66 : 32'h0; // @[EX.scala 70:37]
  assign _GEN_18 = _T_39 ? _T_62 : _GEN_17; // @[EX.scala 68:32]
  assign _T_67 = io_if_IDtoEX_ldst_func == 6'h2; // @[EX.scala 73:26]
  assign _GEN_19 = _T_67 ? io_if_RFtoEX_d_rs2 : 32'h0; // @[EX.scala 73:34]
  assign _GEN_20 = _T_58 ? _GEN_18 : _GEN_19; // @[EX.scala 67:34]
  assign _GEN_21 = _T_37 ? _GEN_16 : _GEN_20; // @[EX.scala 57:26]
  assign wb_valid = io_if_IDtoEX_alu_valid | io_if_IDtoEX_load_valid; // @[EX.scala 91:39]
  assign _T_77 = io_if_mem_rdata[15:8]; // @[EX.scala 99:23]
  assign _T_80 = io_if_mem_rdata[23:16]; // @[EX.scala 101:23]
  assign _GEN_23 = _T_55 ? _T_50 : 8'h0; // @[EX.scala 102:36]
  assign _GEN_24 = _T_49 ? _T_80 : _GEN_23; // @[EX.scala 100:36]
  assign _GEN_25 = _T_43 ? _T_77 : _GEN_24; // @[EX.scala 98:36]
  assign _GEN_26 = _T_39 ? _T_45 : _GEN_25; // @[EX.scala 96:30]
  assign _GEN_27 = _T_49 ? _T_44 : 16'h0; // @[EX.scala 107:35]
  assign _GEN_28 = _T_39 ? _T_51 : _GEN_27; // @[EX.scala 105:30]
  assign _GEN_34 = io_if_IDtoEX_load_valid ? _GEN_26 : 8'h0; // @[EX.scala 95:46]
  assign rdata_b = io_if_IDtoEX_alu_valid ? 8'h0 : _GEN_34; // @[EX.scala 93:39]
  assign _T_91 = rdata_b[7]; // @[EX.scala 112:38]
  assign _T_93 = _T_91 ? 24'hffffff : 24'h0; // @[Bitwise.scala 71:12]
  assign _T_95 = {_T_93,rdata_b}; // @[Cat.scala 29:58]
  assign _T_96 = io_if_IDtoEX_ldst_func == 6'h4; // @[EX.scala 113:25]
  assign _GEN_35 = io_if_IDtoEX_load_valid ? _GEN_28 : 16'h0; // @[EX.scala 95:46]
  assign rdata_h = io_if_IDtoEX_alu_valid ? 16'h0 : _GEN_35; // @[EX.scala 93:39]
  assign _T_98 = rdata_h[15]; // @[EX.scala 116:38]
  assign _T_100 = _T_98 ? 16'hffff : 16'h0; // @[Bitwise.scala 71:12]
  assign _T_102 = {_T_100,rdata_h}; // @[Cat.scala 29:58]
  assign _T_103 = io_if_IDtoEX_ldst_func == 6'h5; // @[EX.scala 117:26]
  assign _GEN_29 = _T_67 ? io_if_mem_rdata : 32'h0; // @[EX.scala 119:34]
  assign _GEN_30 = _T_103 ? {{16'd0}, rdata_h} : _GEN_29; // @[EX.scala 117:34]
  assign _GEN_31 = _T_58 ? _T_102 : _GEN_30; // @[EX.scala 115:34]
  assign _GEN_32 = _T_96 ? {{24'd0}, rdata_b} : _GEN_31; // @[EX.scala 113:32]
  assign _GEN_33 = _T_37 ? _T_95 : _GEN_32; // @[EX.scala 111:26]
  assign _GEN_36 = io_if_IDtoEX_load_valid ? _GEN_33 : 32'h0; // @[EX.scala 95:46]
  assign o_alu = _GEN_12[31:0]; // @[EX.scala 21:22 EX.scala 28:9 EX.scala 31:36 EX.scala 32:36 EX.scala 33:36 EX.scala 34:36 EX.scala 35:36 EX.scala 36:36 EX.scala 38:36 EX.scala 39:36 EX.scala 40:36 EX.scala 41:36 EX.scala 42:36 EX.scala 43:36]
  assign io_if_EXtoWB_rd = io_if_IDtoEX_rd; // @[EX.scala 129:25]
  assign io_if_EXtoWB_wbdata = io_if_IDtoEX_alu_valid ? o_alu : _GEN_36; // @[EX.scala 130:25]
  assign io_if_EXtoWB_wbvalid = io_if_IDtoEX_alu_valid | io_if_IDtoEX_load_valid; // @[EX.scala 131:24]
  assign io_if_EXtoWB_valid = wb_valid | io_if_IDtoEX_store_valid; // @[EX.scala 132:25]
  assign io_if_mem_we = io_if_IDtoEX_store_valid; // @[EX.scala 79:19]
  assign io_if_mem_wdata = io_if_IDtoEX_store_valid ? _GEN_21 : 32'h0; // @[EX.scala 78:19]
  assign io_if_mem_addr = addr & 16'hfffc; // @[EX.scala 80:19]
endmodule
module WB(
  input  [4:0]  io_if_EXtoWB_rd,
  input  [31:0] io_if_EXtoWB_wbdata,
  input         io_if_EXtoWB_wbvalid,
  input         io_if_EXtoWB_valid,
  output [4:0]  io_if_WBtoRF_rd,
  output [31:0] io_if_WBtoRF_wdata,
  output        io_if_WBtoRF_valid,
  output        io_ready
);
  assign io_if_WBtoRF_rd = io_if_EXtoWB_rd; // @[WB.scala 12:22]
  assign io_if_WBtoRF_wdata = io_if_EXtoWB_wbdata; // @[WB.scala 13:22]
  assign io_if_WBtoRF_valid = io_if_EXtoWB_wbvalid; // @[WB.scala 14:22]
  assign io_ready = io_if_EXtoWB_valid; // @[WB.scala 15:22]
endmodule
module Memory(
  input         clock,
  input         io_we,
  input  [31:0] io_wdata,
  input  [15:0] io_addr,
  input  [15:0] io_addr2,
  output [31:0] io_rdata,
  output [31:0] io_rdata2
);
  reg [31:0] my_mem [0:2175]; // @[Memory.scala 75:19]
  reg [31:0] _RAND_0;
  wire [31:0] my_mem__T_6_data; // @[Memory.scala 75:19]
  wire [11:0] my_mem__T_6_addr; // @[Memory.scala 75:19]
  reg [31:0] _RAND_1;
  wire [31:0] my_mem__T_9_data; // @[Memory.scala 75:19]
  wire [11:0] my_mem__T_9_addr; // @[Memory.scala 75:19]
  reg [31:0] _RAND_2;
  wire [31:0] my_mem__T_3_data; // @[Memory.scala 75:19]
  wire [11:0] my_mem__T_3_addr; // @[Memory.scala 75:19]
  wire  my_mem__T_3_mask; // @[Memory.scala 75:19]
  wire  my_mem__T_3_en; // @[Memory.scala 75:19]
  wire [15:0] _T_1; // @[Memory.scala 80:16]
  wire [15:0] _T_7; // @[Memory.scala 83:25]
  assign my_mem__T_6_addr = _T_1[11:0];
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign my_mem__T_6_data = my_mem[my_mem__T_6_addr]; // @[Memory.scala 75:19]
  `else
  assign my_mem__T_6_data = my_mem__T_6_addr >= 12'h880 ? _RAND_1[31:0] : my_mem[my_mem__T_6_addr]; // @[Memory.scala 75:19]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign my_mem__T_9_addr = _T_7[11:0];
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign my_mem__T_9_data = my_mem[my_mem__T_9_addr]; // @[Memory.scala 75:19]
  `else
  assign my_mem__T_9_data = my_mem__T_9_addr >= 12'h880 ? _RAND_2[31:0] : my_mem[my_mem__T_9_addr]; // @[Memory.scala 75:19]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign my_mem__T_3_data = io_wdata;
  assign my_mem__T_3_addr = _T_1[11:0];
  assign my_mem__T_3_mask = 1'h1;
  assign my_mem__T_3_en = io_we;
  assign _T_1 = io_addr / 16'h4; // @[Memory.scala 80:16]
  assign _T_7 = io_addr2 / 16'h4; // @[Memory.scala 83:25]
  assign io_rdata = my_mem__T_6_data; // @[Memory.scala 85:13]
  assign io_rdata2 = my_mem__T_9_data; // @[Memory.scala 86:13]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2176; initvar = initvar+1)
    my_mem[initvar] = _RAND_0[31:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {1{`RANDOM}};
  _RAND_2 = {1{`RANDOM}};
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(my_mem__T_3_en & my_mem__T_3_mask) begin
      my_mem[my_mem__T_3_addr] <= my_mem__T_3_data; // @[Memory.scala 75:19]
    end
  end
endmodule
module Memory_BD(
  input         clock,
  input         io_if_mem_bd_bd_en,
  input         io_if_mem_bd_we,
  input  [31:0] io_if_mem_bd_wdata,
  input  [15:0] io_if_mem_bd_addr,
  output [31:0] io_if_mem_bd_rdata,
  input         io_we,
  input  [31:0] io_wdata,
  input  [15:0] io_addr,
  input  [15:0] io_addr2,
  output [31:0] io_rdata,
  output [31:0] io_rdata2
);
  wire  i_mem_clock; // @[Memory.scala 25:21]
  wire  i_mem_io_we; // @[Memory.scala 25:21]
  wire [31:0] i_mem_io_wdata; // @[Memory.scala 25:21]
  wire [15:0] i_mem_io_addr; // @[Memory.scala 25:21]
  wire [15:0] i_mem_io_addr2; // @[Memory.scala 25:21]
  wire [31:0] i_mem_io_rdata; // @[Memory.scala 25:21]
  wire [31:0] i_mem_io_rdata2; // @[Memory.scala 25:21]
  Memory i_mem ( // @[Memory.scala 25:21]
    .clock(i_mem_clock),
    .io_we(i_mem_io_we),
    .io_wdata(i_mem_io_wdata),
    .io_addr(i_mem_io_addr),
    .io_addr2(i_mem_io_addr2),
    .io_rdata(i_mem_io_rdata),
    .io_rdata2(i_mem_io_rdata2)
  );
  assign io_if_mem_bd_rdata = i_mem_io_rdata; // @[Memory.scala 40:22]
  assign io_rdata = i_mem_io_rdata; // @[Memory.scala 38:18]
  assign io_rdata2 = i_mem_io_rdata2; // @[Memory.scala 39:18]
  assign i_mem_clock = clock;
  assign i_mem_io_we = io_if_mem_bd_bd_en ? io_if_mem_bd_we : io_we; // @[Memory.scala 34:18]
  assign i_mem_io_wdata = io_if_mem_bd_bd_en ? io_if_mem_bd_wdata : io_wdata; // @[Memory.scala 33:18]
  assign i_mem_io_addr = io_if_mem_bd_bd_en ? io_if_mem_bd_addr : io_addr; // @[Memory.scala 35:18]
  assign i_mem_io_addr2 = io_addr2; // @[Memory.scala 36:18]
endmodule
module ErrorM(
  input   io_illigal_op,
  output  io_error
);
  assign io_error = io_illigal_op; // @[ErrorM.scala 11:12]
endmodule
module RiscV(
  input         clock,
  input         reset,
  input         io_inst_valid,
  output [31:0] io_inst_addr,
  output        io_inst_ready,
  output        io_error,
  input         io_if_mem_bd_bd_en,
  input         io_if_mem_bd_we,
  input  [31:0] io_if_mem_bd_wdata,
  input  [15:0] io_if_mem_bd_addr,
  output [31:0] io_if_mem_bd_rdata,
  output [31:0] io_info_rf_0,
  output [31:0] io_info_rf_1,
  output [31:0] io_info_rf_2,
  output [31:0] io_info_rf_3,
  output [31:0] io_info_rf_4,
  output [31:0] io_info_rf_5,
  output [31:0] io_info_rf_6,
  output [31:0] io_info_rf_7,
  output [31:0] io_info_rf_8,
  output [31:0] io_info_rf_9,
  output [31:0] io_info_rf_10,
  output [31:0] io_info_rf_11,
  output [31:0] io_info_rf_12,
  output [31:0] io_info_rf_13,
  output [31:0] io_info_rf_14,
  output [31:0] io_info_rf_15,
  output [31:0] io_info_rf_16,
  output [31:0] io_info_rf_17,
  output [31:0] io_info_rf_18,
  output [31:0] io_info_rf_19,
  output [31:0] io_info_rf_20,
  output [31:0] io_info_rf_21,
  output [31:0] io_info_rf_22,
  output [31:0] io_info_rf_23,
  output [31:0] io_info_rf_24,
  output [31:0] io_info_rf_25,
  output [31:0] io_info_rf_26,
  output [31:0] io_info_rf_27,
  output [31:0] io_info_rf_28,
  output [31:0] io_info_rf_29,
  output [31:0] io_info_rf_30,
  output [31:0] io_info_rf_31
);
  wire  i_if_clock; // @[RiscV.scala 30:20]
  wire  i_if_reset; // @[RiscV.scala 30:20]
  wire [31:0] i_if_io_inst_code; // @[RiscV.scala 30:20]
  wire  i_if_io_inst_valid; // @[RiscV.scala 30:20]
  wire  i_if_io_ready; // @[RiscV.scala 30:20]
  wire [31:0] i_if_io_if_IFtoID_opcode; // @[RiscV.scala 30:20]
  wire  i_if_io_if_IFtoID_valid; // @[RiscV.scala 30:20]
  wire [31:0] i_if_io_if_IFtoID_PC; // @[RiscV.scala 30:20]
  wire [31:0] i_if_io_if_IDtoIF_jump_addr; // @[RiscV.scala 30:20]
  wire  i_if_io_if_IDtoIF_jump_valid; // @[RiscV.scala 30:20]
  wire [31:0] i_if_io_inst_addr; // @[RiscV.scala 30:20]
  wire [31:0] i_id_io_if_IDtoIF_jump_addr; // @[RiscV.scala 31:20]
  wire  i_id_io_if_IDtoIF_jump_valid; // @[RiscV.scala 31:20]
  wire [5:0] i_id_io_if_IDtoEX_alu_func; // @[RiscV.scala 31:20]
  wire [5:0] i_id_io_if_IDtoEX_ldst_func; // @[RiscV.scala 31:20]
  wire [31:0] i_id_io_if_IDtoEX_imm; // @[RiscV.scala 31:20]
  wire  i_id_io_if_IDtoEX_imm_sel; // @[RiscV.scala 31:20]
  wire [4:0] i_id_io_if_IDtoEX_rd; // @[RiscV.scala 31:20]
  wire  i_id_io_if_IDtoEX_load_valid; // @[RiscV.scala 31:20]
  wire  i_id_io_if_IDtoEX_alu_valid; // @[RiscV.scala 31:20]
  wire  i_id_io_if_IDtoEX_store_valid; // @[RiscV.scala 31:20]
  wire [4:0] i_id_io_if_IDtoRF_rs1; // @[RiscV.scala 31:20]
  wire [4:0] i_id_io_if_IDtoRF_rs2; // @[RiscV.scala 31:20]
  wire [31:0] i_id_io_if_IFtoID_opcode; // @[RiscV.scala 31:20]
  wire  i_id_io_if_IFtoID_valid; // @[RiscV.scala 31:20]
  wire [31:0] i_id_io_if_IFtoID_PC; // @[RiscV.scala 31:20]
  wire [31:0] i_id_io_if_RFtoID_d_rs1; // @[RiscV.scala 31:20]
  wire [31:0] i_id_io_if_RFtoID_d_rs2; // @[RiscV.scala 31:20]
  wire  i_id_io_illigal_op; // @[RiscV.scala 31:20]
  wire  i_rf_clock; // @[RiscV.scala 32:20]
  wire  i_rf_reset; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_if_RFtoEX_d_rs1; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_if_RFtoEX_d_rs2; // @[RiscV.scala 32:20]
  wire [4:0] i_rf_io_if_WBtoRF_rd; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_if_WBtoRF_wdata; // @[RiscV.scala 32:20]
  wire  i_rf_io_if_WBtoRF_valid; // @[RiscV.scala 32:20]
  wire [4:0] i_rf_io_if_IDtoRF_rs1; // @[RiscV.scala 32:20]
  wire [4:0] i_rf_io_if_IDtoRF_rs2; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_if_RFtoID_d_rs1; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_if_RFtoID_d_rs2; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_0; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_1; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_2; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_3; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_4; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_5; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_6; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_7; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_8; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_9; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_10; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_11; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_12; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_13; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_14; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_15; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_16; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_17; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_18; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_19; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_20; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_21; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_22; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_23; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_24; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_25; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_26; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_27; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_28; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_29; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_30; // @[RiscV.scala 32:20]
  wire [31:0] i_rf_io_info_rf_31; // @[RiscV.scala 32:20]
  wire [5:0] i_ex_io_if_IDtoEX_alu_func; // @[RiscV.scala 33:20]
  wire [5:0] i_ex_io_if_IDtoEX_ldst_func; // @[RiscV.scala 33:20]
  wire [31:0] i_ex_io_if_IDtoEX_imm; // @[RiscV.scala 33:20]
  wire  i_ex_io_if_IDtoEX_imm_sel; // @[RiscV.scala 33:20]
  wire [4:0] i_ex_io_if_IDtoEX_rd; // @[RiscV.scala 33:20]
  wire  i_ex_io_if_IDtoEX_load_valid; // @[RiscV.scala 33:20]
  wire  i_ex_io_if_IDtoEX_alu_valid; // @[RiscV.scala 33:20]
  wire  i_ex_io_if_IDtoEX_store_valid; // @[RiscV.scala 33:20]
  wire [31:0] i_ex_io_if_RFtoEX_d_rs1; // @[RiscV.scala 33:20]
  wire [31:0] i_ex_io_if_RFtoEX_d_rs2; // @[RiscV.scala 33:20]
  wire [4:0] i_ex_io_if_EXtoWB_rd; // @[RiscV.scala 33:20]
  wire [31:0] i_ex_io_if_EXtoWB_wbdata; // @[RiscV.scala 33:20]
  wire  i_ex_io_if_EXtoWB_wbvalid; // @[RiscV.scala 33:20]
  wire  i_ex_io_if_EXtoWB_valid; // @[RiscV.scala 33:20]
  wire  i_ex_io_if_mem_we; // @[RiscV.scala 33:20]
  wire [31:0] i_ex_io_if_mem_wdata; // @[RiscV.scala 33:20]
  wire [15:0] i_ex_io_if_mem_addr; // @[RiscV.scala 33:20]
  wire [31:0] i_ex_io_if_mem_rdata; // @[RiscV.scala 33:20]
  wire [4:0] i_wb_io_if_EXtoWB_rd; // @[RiscV.scala 34:20]
  wire [31:0] i_wb_io_if_EXtoWB_wbdata; // @[RiscV.scala 34:20]
  wire  i_wb_io_if_EXtoWB_wbvalid; // @[RiscV.scala 34:20]
  wire  i_wb_io_if_EXtoWB_valid; // @[RiscV.scala 34:20]
  wire [4:0] i_wb_io_if_WBtoRF_rd; // @[RiscV.scala 34:20]
  wire [31:0] i_wb_io_if_WBtoRF_wdata; // @[RiscV.scala 34:20]
  wire  i_wb_io_if_WBtoRF_valid; // @[RiscV.scala 34:20]
  wire  i_wb_io_ready; // @[RiscV.scala 34:20]
  wire  i_mem_clock; // @[RiscV.scala 61:21]
  wire  i_mem_io_if_mem_bd_bd_en; // @[RiscV.scala 61:21]
  wire  i_mem_io_if_mem_bd_we; // @[RiscV.scala 61:21]
  wire [31:0] i_mem_io_if_mem_bd_wdata; // @[RiscV.scala 61:21]
  wire [15:0] i_mem_io_if_mem_bd_addr; // @[RiscV.scala 61:21]
  wire [31:0] i_mem_io_if_mem_bd_rdata; // @[RiscV.scala 61:21]
  wire  i_mem_io_we; // @[RiscV.scala 61:21]
  wire [31:0] i_mem_io_wdata; // @[RiscV.scala 61:21]
  wire [15:0] i_mem_io_addr; // @[RiscV.scala 61:21]
  wire [15:0] i_mem_io_addr2; // @[RiscV.scala 61:21]
  wire [31:0] i_mem_io_rdata; // @[RiscV.scala 61:21]
  wire [31:0] i_mem_io_rdata2; // @[RiscV.scala 61:21]
  wire  i_err_io_illigal_op; // @[RiscV.scala 74:21]
  wire  i_err_io_error; // @[RiscV.scala 74:21]
  IF i_if ( // @[RiscV.scala 30:20]
    .clock(i_if_clock),
    .reset(i_if_reset),
    .io_inst_code(i_if_io_inst_code),
    .io_inst_valid(i_if_io_inst_valid),
    .io_ready(i_if_io_ready),
    .io_if_IFtoID_opcode(i_if_io_if_IFtoID_opcode),
    .io_if_IFtoID_valid(i_if_io_if_IFtoID_valid),
    .io_if_IFtoID_PC(i_if_io_if_IFtoID_PC),
    .io_if_IDtoIF_jump_addr(i_if_io_if_IDtoIF_jump_addr),
    .io_if_IDtoIF_jump_valid(i_if_io_if_IDtoIF_jump_valid),
    .io_inst_addr(i_if_io_inst_addr)
  );
  ID i_id ( // @[RiscV.scala 31:20]
    .io_if_IDtoIF_jump_addr(i_id_io_if_IDtoIF_jump_addr),
    .io_if_IDtoIF_jump_valid(i_id_io_if_IDtoIF_jump_valid),
    .io_if_IDtoEX_alu_func(i_id_io_if_IDtoEX_alu_func),
    .io_if_IDtoEX_ldst_func(i_id_io_if_IDtoEX_ldst_func),
    .io_if_IDtoEX_imm(i_id_io_if_IDtoEX_imm),
    .io_if_IDtoEX_imm_sel(i_id_io_if_IDtoEX_imm_sel),
    .io_if_IDtoEX_rd(i_id_io_if_IDtoEX_rd),
    .io_if_IDtoEX_load_valid(i_id_io_if_IDtoEX_load_valid),
    .io_if_IDtoEX_alu_valid(i_id_io_if_IDtoEX_alu_valid),
    .io_if_IDtoEX_store_valid(i_id_io_if_IDtoEX_store_valid),
    .io_if_IDtoRF_rs1(i_id_io_if_IDtoRF_rs1),
    .io_if_IDtoRF_rs2(i_id_io_if_IDtoRF_rs2),
    .io_if_IFtoID_opcode(i_id_io_if_IFtoID_opcode),
    .io_if_IFtoID_valid(i_id_io_if_IFtoID_valid),
    .io_if_IFtoID_PC(i_id_io_if_IFtoID_PC),
    .io_if_RFtoID_d_rs1(i_id_io_if_RFtoID_d_rs1),
    .io_if_RFtoID_d_rs2(i_id_io_if_RFtoID_d_rs2),
    .io_illigal_op(i_id_io_illigal_op)
  );
  RF i_rf ( // @[RiscV.scala 32:20]
    .clock(i_rf_clock),
    .reset(i_rf_reset),
    .io_if_RFtoEX_d_rs1(i_rf_io_if_RFtoEX_d_rs1),
    .io_if_RFtoEX_d_rs2(i_rf_io_if_RFtoEX_d_rs2),
    .io_if_WBtoRF_rd(i_rf_io_if_WBtoRF_rd),
    .io_if_WBtoRF_wdata(i_rf_io_if_WBtoRF_wdata),
    .io_if_WBtoRF_valid(i_rf_io_if_WBtoRF_valid),
    .io_if_IDtoRF_rs1(i_rf_io_if_IDtoRF_rs1),
    .io_if_IDtoRF_rs2(i_rf_io_if_IDtoRF_rs2),
    .io_if_RFtoID_d_rs1(i_rf_io_if_RFtoID_d_rs1),
    .io_if_RFtoID_d_rs2(i_rf_io_if_RFtoID_d_rs2),
    .io_info_rf_0(i_rf_io_info_rf_0),
    .io_info_rf_1(i_rf_io_info_rf_1),
    .io_info_rf_2(i_rf_io_info_rf_2),
    .io_info_rf_3(i_rf_io_info_rf_3),
    .io_info_rf_4(i_rf_io_info_rf_4),
    .io_info_rf_5(i_rf_io_info_rf_5),
    .io_info_rf_6(i_rf_io_info_rf_6),
    .io_info_rf_7(i_rf_io_info_rf_7),
    .io_info_rf_8(i_rf_io_info_rf_8),
    .io_info_rf_9(i_rf_io_info_rf_9),
    .io_info_rf_10(i_rf_io_info_rf_10),
    .io_info_rf_11(i_rf_io_info_rf_11),
    .io_info_rf_12(i_rf_io_info_rf_12),
    .io_info_rf_13(i_rf_io_info_rf_13),
    .io_info_rf_14(i_rf_io_info_rf_14),
    .io_info_rf_15(i_rf_io_info_rf_15),
    .io_info_rf_16(i_rf_io_info_rf_16),
    .io_info_rf_17(i_rf_io_info_rf_17),
    .io_info_rf_18(i_rf_io_info_rf_18),
    .io_info_rf_19(i_rf_io_info_rf_19),
    .io_info_rf_20(i_rf_io_info_rf_20),
    .io_info_rf_21(i_rf_io_info_rf_21),
    .io_info_rf_22(i_rf_io_info_rf_22),
    .io_info_rf_23(i_rf_io_info_rf_23),
    .io_info_rf_24(i_rf_io_info_rf_24),
    .io_info_rf_25(i_rf_io_info_rf_25),
    .io_info_rf_26(i_rf_io_info_rf_26),
    .io_info_rf_27(i_rf_io_info_rf_27),
    .io_info_rf_28(i_rf_io_info_rf_28),
    .io_info_rf_29(i_rf_io_info_rf_29),
    .io_info_rf_30(i_rf_io_info_rf_30),
    .io_info_rf_31(i_rf_io_info_rf_31)
  );
  EX i_ex ( // @[RiscV.scala 33:20]
    .io_if_IDtoEX_alu_func(i_ex_io_if_IDtoEX_alu_func),
    .io_if_IDtoEX_ldst_func(i_ex_io_if_IDtoEX_ldst_func),
    .io_if_IDtoEX_imm(i_ex_io_if_IDtoEX_imm),
    .io_if_IDtoEX_imm_sel(i_ex_io_if_IDtoEX_imm_sel),
    .io_if_IDtoEX_rd(i_ex_io_if_IDtoEX_rd),
    .io_if_IDtoEX_load_valid(i_ex_io_if_IDtoEX_load_valid),
    .io_if_IDtoEX_alu_valid(i_ex_io_if_IDtoEX_alu_valid),
    .io_if_IDtoEX_store_valid(i_ex_io_if_IDtoEX_store_valid),
    .io_if_RFtoEX_d_rs1(i_ex_io_if_RFtoEX_d_rs1),
    .io_if_RFtoEX_d_rs2(i_ex_io_if_RFtoEX_d_rs2),
    .io_if_EXtoWB_rd(i_ex_io_if_EXtoWB_rd),
    .io_if_EXtoWB_wbdata(i_ex_io_if_EXtoWB_wbdata),
    .io_if_EXtoWB_wbvalid(i_ex_io_if_EXtoWB_wbvalid),
    .io_if_EXtoWB_valid(i_ex_io_if_EXtoWB_valid),
    .io_if_mem_we(i_ex_io_if_mem_we),
    .io_if_mem_wdata(i_ex_io_if_mem_wdata),
    .io_if_mem_addr(i_ex_io_if_mem_addr),
    .io_if_mem_rdata(i_ex_io_if_mem_rdata)
  );
  WB i_wb ( // @[RiscV.scala 34:20]
    .io_if_EXtoWB_rd(i_wb_io_if_EXtoWB_rd),
    .io_if_EXtoWB_wbdata(i_wb_io_if_EXtoWB_wbdata),
    .io_if_EXtoWB_wbvalid(i_wb_io_if_EXtoWB_wbvalid),
    .io_if_EXtoWB_valid(i_wb_io_if_EXtoWB_valid),
    .io_if_WBtoRF_rd(i_wb_io_if_WBtoRF_rd),
    .io_if_WBtoRF_wdata(i_wb_io_if_WBtoRF_wdata),
    .io_if_WBtoRF_valid(i_wb_io_if_WBtoRF_valid),
    .io_ready(i_wb_io_ready)
  );
  Memory_BD i_mem ( // @[RiscV.scala 61:21]
    .clock(i_mem_clock),
    .io_if_mem_bd_bd_en(i_mem_io_if_mem_bd_bd_en),
    .io_if_mem_bd_we(i_mem_io_if_mem_bd_we),
    .io_if_mem_bd_wdata(i_mem_io_if_mem_bd_wdata),
    .io_if_mem_bd_addr(i_mem_io_if_mem_bd_addr),
    .io_if_mem_bd_rdata(i_mem_io_if_mem_bd_rdata),
    .io_we(i_mem_io_we),
    .io_wdata(i_mem_io_wdata),
    .io_addr(i_mem_io_addr),
    .io_addr2(i_mem_io_addr2),
    .io_rdata(i_mem_io_rdata),
    .io_rdata2(i_mem_io_rdata2)
  );
  ErrorM i_err ( // @[RiscV.scala 74:21]
    .io_illigal_op(i_err_io_illigal_op),
    .io_error(i_err_io_error)
  );
  assign io_inst_addr = i_if_io_inst_addr; // @[RiscV.scala 42:22]
  assign io_inst_ready = i_wb_io_ready; // @[RiscV.scala 80:18]
  assign io_error = i_err_io_error; // @[RiscV.scala 76:12]
  assign io_if_mem_bd_rdata = i_mem_io_if_mem_bd_rdata; // @[RiscV.scala 71:22]
  assign io_info_rf_0 = i_rf_io_info_rf_0; // @[RiscV.scala 83:14]
  assign io_info_rf_1 = i_rf_io_info_rf_1; // @[RiscV.scala 83:14]
  assign io_info_rf_2 = i_rf_io_info_rf_2; // @[RiscV.scala 83:14]
  assign io_info_rf_3 = i_rf_io_info_rf_3; // @[RiscV.scala 83:14]
  assign io_info_rf_4 = i_rf_io_info_rf_4; // @[RiscV.scala 83:14]
  assign io_info_rf_5 = i_rf_io_info_rf_5; // @[RiscV.scala 83:14]
  assign io_info_rf_6 = i_rf_io_info_rf_6; // @[RiscV.scala 83:14]
  assign io_info_rf_7 = i_rf_io_info_rf_7; // @[RiscV.scala 83:14]
  assign io_info_rf_8 = i_rf_io_info_rf_8; // @[RiscV.scala 83:14]
  assign io_info_rf_9 = i_rf_io_info_rf_9; // @[RiscV.scala 83:14]
  assign io_info_rf_10 = i_rf_io_info_rf_10; // @[RiscV.scala 83:14]
  assign io_info_rf_11 = i_rf_io_info_rf_11; // @[RiscV.scala 83:14]
  assign io_info_rf_12 = i_rf_io_info_rf_12; // @[RiscV.scala 83:14]
  assign io_info_rf_13 = i_rf_io_info_rf_13; // @[RiscV.scala 83:14]
  assign io_info_rf_14 = i_rf_io_info_rf_14; // @[RiscV.scala 83:14]
  assign io_info_rf_15 = i_rf_io_info_rf_15; // @[RiscV.scala 83:14]
  assign io_info_rf_16 = i_rf_io_info_rf_16; // @[RiscV.scala 83:14]
  assign io_info_rf_17 = i_rf_io_info_rf_17; // @[RiscV.scala 83:14]
  assign io_info_rf_18 = i_rf_io_info_rf_18; // @[RiscV.scala 83:14]
  assign io_info_rf_19 = i_rf_io_info_rf_19; // @[RiscV.scala 83:14]
  assign io_info_rf_20 = i_rf_io_info_rf_20; // @[RiscV.scala 83:14]
  assign io_info_rf_21 = i_rf_io_info_rf_21; // @[RiscV.scala 83:14]
  assign io_info_rf_22 = i_rf_io_info_rf_22; // @[RiscV.scala 83:14]
  assign io_info_rf_23 = i_rf_io_info_rf_23; // @[RiscV.scala 83:14]
  assign io_info_rf_24 = i_rf_io_info_rf_24; // @[RiscV.scala 83:14]
  assign io_info_rf_25 = i_rf_io_info_rf_25; // @[RiscV.scala 83:14]
  assign io_info_rf_26 = i_rf_io_info_rf_26; // @[RiscV.scala 83:14]
  assign io_info_rf_27 = i_rf_io_info_rf_27; // @[RiscV.scala 83:14]
  assign io_info_rf_28 = i_rf_io_info_rf_28; // @[RiscV.scala 83:14]
  assign io_info_rf_29 = i_rf_io_info_rf_29; // @[RiscV.scala 83:14]
  assign io_info_rf_30 = i_rf_io_info_rf_30; // @[RiscV.scala 83:14]
  assign io_info_rf_31 = i_rf_io_info_rf_31; // @[RiscV.scala 83:14]
  assign i_if_clock = clock;
  assign i_if_reset = reset;
  assign i_if_io_inst_code = i_mem_io_rdata2; // @[RiscV.scala 39:22]
  assign i_if_io_inst_valid = io_inst_valid; // @[RiscV.scala 40:22]
  assign i_if_io_ready = i_wb_io_ready; // @[RiscV.scala 38:22]
  assign i_if_io_if_IDtoIF_jump_addr = i_id_io_if_IDtoIF_jump_addr; // @[RiscV.scala 48:21]
  assign i_if_io_if_IDtoIF_jump_valid = i_id_io_if_IDtoIF_jump_valid; // @[RiscV.scala 48:21]
  assign i_id_io_if_IFtoID_opcode = i_if_io_if_IFtoID_opcode; // @[RiscV.scala 41:22]
  assign i_id_io_if_IFtoID_valid = i_if_io_if_IFtoID_valid; // @[RiscV.scala 41:22]
  assign i_id_io_if_IFtoID_PC = i_if_io_if_IFtoID_PC; // @[RiscV.scala 41:22]
  assign i_id_io_if_RFtoID_d_rs1 = i_rf_io_if_RFtoID_d_rs1; // @[RiscV.scala 49:21]
  assign i_id_io_if_RFtoID_d_rs2 = i_rf_io_if_RFtoID_d_rs2; // @[RiscV.scala 49:21]
  assign i_rf_clock = clock;
  assign i_rf_reset = reset;
  assign i_rf_io_if_WBtoRF_rd = i_wb_io_if_WBtoRF_rd; // @[RiscV.scala 57:21]
  assign i_rf_io_if_WBtoRF_wdata = i_wb_io_if_WBtoRF_wdata; // @[RiscV.scala 57:21]
  assign i_rf_io_if_WBtoRF_valid = i_wb_io_if_WBtoRF_valid; // @[RiscV.scala 57:21]
  assign i_rf_io_if_IDtoRF_rs1 = i_id_io_if_IDtoRF_rs1; // @[RiscV.scala 46:21]
  assign i_rf_io_if_IDtoRF_rs2 = i_id_io_if_IDtoRF_rs2; // @[RiscV.scala 46:21]
  assign i_ex_io_if_IDtoEX_alu_func = i_id_io_if_IDtoEX_alu_func; // @[RiscV.scala 45:21]
  assign i_ex_io_if_IDtoEX_ldst_func = i_id_io_if_IDtoEX_ldst_func; // @[RiscV.scala 45:21]
  assign i_ex_io_if_IDtoEX_imm = i_id_io_if_IDtoEX_imm; // @[RiscV.scala 45:21]
  assign i_ex_io_if_IDtoEX_imm_sel = i_id_io_if_IDtoEX_imm_sel; // @[RiscV.scala 45:21]
  assign i_ex_io_if_IDtoEX_rd = i_id_io_if_IDtoEX_rd; // @[RiscV.scala 45:21]
  assign i_ex_io_if_IDtoEX_load_valid = i_id_io_if_IDtoEX_load_valid; // @[RiscV.scala 45:21]
  assign i_ex_io_if_IDtoEX_alu_valid = i_id_io_if_IDtoEX_alu_valid; // @[RiscV.scala 45:21]
  assign i_ex_io_if_IDtoEX_store_valid = i_id_io_if_IDtoEX_store_valid; // @[RiscV.scala 45:21]
  assign i_ex_io_if_RFtoEX_d_rs1 = i_rf_io_if_RFtoEX_d_rs1; // @[RiscV.scala 52:21]
  assign i_ex_io_if_RFtoEX_d_rs2 = i_rf_io_if_RFtoEX_d_rs2; // @[RiscV.scala 52:21]
  assign i_ex_io_if_mem_rdata = i_mem_io_rdata; // @[RiscV.scala 65:24]
  assign i_wb_io_if_EXtoWB_rd = i_ex_io_if_EXtoWB_rd; // @[RiscV.scala 53:21]
  assign i_wb_io_if_EXtoWB_wbdata = i_ex_io_if_EXtoWB_wbdata; // @[RiscV.scala 53:21]
  assign i_wb_io_if_EXtoWB_wbvalid = i_ex_io_if_EXtoWB_wbvalid; // @[RiscV.scala 53:21]
  assign i_wb_io_if_EXtoWB_valid = i_ex_io_if_EXtoWB_valid; // @[RiscV.scala 53:21]
  assign i_mem_clock = clock;
  assign i_mem_io_if_mem_bd_bd_en = io_if_mem_bd_bd_en; // @[RiscV.scala 71:22]
  assign i_mem_io_if_mem_bd_we = io_if_mem_bd_we; // @[RiscV.scala 71:22]
  assign i_mem_io_if_mem_bd_wdata = io_if_mem_bd_wdata; // @[RiscV.scala 71:22]
  assign i_mem_io_if_mem_bd_addr = io_if_mem_bd_addr; // @[RiscV.scala 71:22]
  assign i_mem_io_we = i_ex_io_if_mem_we; // @[RiscV.scala 62:24]
  assign i_mem_io_wdata = i_ex_io_if_mem_wdata; // @[RiscV.scala 64:24]
  assign i_mem_io_addr = i_ex_io_if_mem_addr; // @[RiscV.scala 63:24]
  assign i_mem_io_addr2 = i_if_io_inst_addr[15:0]; // @[RiscV.scala 66:18]
  assign i_err_io_illigal_op = i_id_io_illigal_op; // @[RiscV.scala 75:23]
endmodule
module Top(
  input        clock,
  input        reset,
  input  [3:0] io_SW_IN,
  input        io_RD,
  output       io_TD,
  output [7:0] io_GPIO
);
  wire  i_uart_clock; // @[Top.scala 28:22]
  wire  i_uart_reset; // @[Top.scala 28:22]
  wire  i_uart_io_TD; // @[Top.scala 28:22]
  wire  i_uart_io_RD; // @[Top.scala 28:22]
  wire [7:0] i_uart_io_MONITOR_0; // @[Top.scala 28:22]
  wire [7:0] i_uart_io_MONITOR_1; // @[Top.scala 28:22]
  wire [7:0] i_uart_io_MONITOR_2; // @[Top.scala 28:22]
  wire [7:0] i_uart_io_MONITOR_3; // @[Top.scala 28:22]
  wire [7:0] i_uart_io_GPIO_0; // @[Top.scala 28:22]
  wire [7:0] i_uart_io_GPIO_1; // @[Top.scala 28:22]
  wire  i_uart_io_idle; // @[Top.scala 28:22]
  wire  i_uart_io_we; // @[Top.scala 28:22]
  wire [31:0] i_uart_io_addr; // @[Top.scala 28:22]
  wire [31:0] i_uart_io_wdata; // @[Top.scala 28:22]
  wire [31:0] i_uart_io_rdata; // @[Top.scala 28:22]
  wire  i_riscv_clock; // @[Top.scala 71:24]
  wire  i_riscv_reset; // @[Top.scala 71:24]
  wire  i_riscv_io_inst_valid; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_inst_addr; // @[Top.scala 71:24]
  wire  i_riscv_io_inst_ready; // @[Top.scala 71:24]
  wire  i_riscv_io_error; // @[Top.scala 71:24]
  wire  i_riscv_io_if_mem_bd_bd_en; // @[Top.scala 71:24]
  wire  i_riscv_io_if_mem_bd_we; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_if_mem_bd_wdata; // @[Top.scala 71:24]
  wire [15:0] i_riscv_io_if_mem_bd_addr; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_if_mem_bd_rdata; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_0; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_1; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_2; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_3; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_4; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_5; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_6; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_7; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_8; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_9; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_10; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_11; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_12; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_13; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_14; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_15; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_16; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_17; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_18; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_19; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_20; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_21; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_22; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_23; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_24; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_25; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_26; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_27; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_28; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_29; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_30; // @[Top.scala 71:24]
  wire [31:0] i_riscv_io_info_rf_31; // @[Top.scala 71:24]
  wire [6:0] _T; // @[Top.scala 37:35]
  reg  r_inst_valid; // @[Top.scala 62:31]
  reg [31:0] _RAND_0;
  wire  pre_inst_valid; // @[Top.scala 65:38]
  wire  _T_6; // @[Top.scala 69:48]
  wire  inst_valid; // @[Top.scala 69:32]
  wire [4:0] reg_sel; // @[Top.scala 83:33]
  wire [1:0] reg_rstrb; // @[Top.scala 84:33]
  wire  _T_11; // @[Top.scala 87:18]
  wire [31:0] _GEN_0; // @[Top.scala 88:44]
  wire [31:0] _GEN_1; // @[Top.scala 88:44]
  wire [31:0] _GEN_2; // @[Top.scala 88:44]
  wire [31:0] _GEN_3; // @[Top.scala 88:44]
  wire [31:0] _GEN_4; // @[Top.scala 88:44]
  wire [31:0] _GEN_5; // @[Top.scala 88:44]
  wire [31:0] _GEN_6; // @[Top.scala 88:44]
  wire [31:0] _GEN_7; // @[Top.scala 88:44]
  wire [31:0] _GEN_8; // @[Top.scala 88:44]
  wire [31:0] _GEN_9; // @[Top.scala 88:44]
  wire [31:0] _GEN_10; // @[Top.scala 88:44]
  wire [31:0] _GEN_11; // @[Top.scala 88:44]
  wire [31:0] _GEN_12; // @[Top.scala 88:44]
  wire [31:0] _GEN_13; // @[Top.scala 88:44]
  wire [31:0] _GEN_14; // @[Top.scala 88:44]
  wire [31:0] _GEN_15; // @[Top.scala 88:44]
  wire [31:0] _GEN_16; // @[Top.scala 88:44]
  wire [31:0] _GEN_17; // @[Top.scala 88:44]
  wire [31:0] _GEN_18; // @[Top.scala 88:44]
  wire [31:0] _GEN_19; // @[Top.scala 88:44]
  wire [31:0] _GEN_20; // @[Top.scala 88:44]
  wire [31:0] _GEN_21; // @[Top.scala 88:44]
  wire [31:0] _GEN_22; // @[Top.scala 88:44]
  wire [31:0] _GEN_23; // @[Top.scala 88:44]
  wire [31:0] _GEN_24; // @[Top.scala 88:44]
  wire [31:0] _GEN_25; // @[Top.scala 88:44]
  wire [31:0] _GEN_26; // @[Top.scala 88:44]
  wire [31:0] _GEN_27; // @[Top.scala 88:44]
  wire [31:0] _GEN_28; // @[Top.scala 88:44]
  wire [31:0] _GEN_29; // @[Top.scala 88:44]
  wire [31:0] _GEN_30; // @[Top.scala 88:44]
  wire [31:0] _GEN_31; // @[Top.scala 88:44]
  wire [7:0] _T_12; // @[Top.scala 88:44]
  wire  _T_13; // @[Top.scala 89:24]
  wire [7:0] _T_14; // @[Top.scala 90:44]
  wire  _T_15; // @[Top.scala 91:24]
  wire [7:0] _T_16; // @[Top.scala 92:44]
  wire  _T_17; // @[Top.scala 93:24]
  wire [7:0] _T_18; // @[Top.scala 94:44]
  wire [7:0] _GEN_32; // @[Top.scala 93:32]
  wire [7:0] _GEN_33; // @[Top.scala 91:32]
  wire [7:0] _GEN_34; // @[Top.scala 89:32]
  reg  r_error; // @[Top.scala 97:29]
  reg [31:0] _RAND_1;
  reg  r_inst_ready; // @[Top.scala 98:29]
  reg [31:0] _RAND_2;
  wire  _T_19; // @[Top.scala 99:25]
  wire  _GEN_36; // @[Top.scala 101:33]
  wire  _GEN_37; // @[Top.scala 99:33]
  wire  _T_21; // @[Top.scala 104:30]
  wire  _GEN_38; // @[Top.scala 106:33]
  wire  _GEN_39; // @[Top.scala 104:38]
  wire [1:0] _T_23; // @[Cat.scala 29:58]
  Uart i_uart ( // @[Top.scala 28:22]
    .clock(i_uart_clock),
    .reset(i_uart_reset),
    .io_TD(i_uart_io_TD),
    .io_RD(i_uart_io_RD),
    .io_MONITOR_0(i_uart_io_MONITOR_0),
    .io_MONITOR_1(i_uart_io_MONITOR_1),
    .io_MONITOR_2(i_uart_io_MONITOR_2),
    .io_MONITOR_3(i_uart_io_MONITOR_3),
    .io_GPIO_0(i_uart_io_GPIO_0),
    .io_GPIO_1(i_uart_io_GPIO_1),
    .io_idle(i_uart_io_idle),
    .io_we(i_uart_io_we),
    .io_addr(i_uart_io_addr),
    .io_wdata(i_uart_io_wdata),
    .io_rdata(i_uart_io_rdata)
  );
  RiscV i_riscv ( // @[Top.scala 71:24]
    .clock(i_riscv_clock),
    .reset(i_riscv_reset),
    .io_inst_valid(i_riscv_io_inst_valid),
    .io_inst_addr(i_riscv_io_inst_addr),
    .io_inst_ready(i_riscv_io_inst_ready),
    .io_error(i_riscv_io_error),
    .io_if_mem_bd_bd_en(i_riscv_io_if_mem_bd_bd_en),
    .io_if_mem_bd_we(i_riscv_io_if_mem_bd_we),
    .io_if_mem_bd_wdata(i_riscv_io_if_mem_bd_wdata),
    .io_if_mem_bd_addr(i_riscv_io_if_mem_bd_addr),
    .io_if_mem_bd_rdata(i_riscv_io_if_mem_bd_rdata),
    .io_info_rf_0(i_riscv_io_info_rf_0),
    .io_info_rf_1(i_riscv_io_info_rf_1),
    .io_info_rf_2(i_riscv_io_info_rf_2),
    .io_info_rf_3(i_riscv_io_info_rf_3),
    .io_info_rf_4(i_riscv_io_info_rf_4),
    .io_info_rf_5(i_riscv_io_info_rf_5),
    .io_info_rf_6(i_riscv_io_info_rf_6),
    .io_info_rf_7(i_riscv_io_info_rf_7),
    .io_info_rf_8(i_riscv_io_info_rf_8),
    .io_info_rf_9(i_riscv_io_info_rf_9),
    .io_info_rf_10(i_riscv_io_info_rf_10),
    .io_info_rf_11(i_riscv_io_info_rf_11),
    .io_info_rf_12(i_riscv_io_info_rf_12),
    .io_info_rf_13(i_riscv_io_info_rf_13),
    .io_info_rf_14(i_riscv_io_info_rf_14),
    .io_info_rf_15(i_riscv_io_info_rf_15),
    .io_info_rf_16(i_riscv_io_info_rf_16),
    .io_info_rf_17(i_riscv_io_info_rf_17),
    .io_info_rf_18(i_riscv_io_info_rf_18),
    .io_info_rf_19(i_riscv_io_info_rf_19),
    .io_info_rf_20(i_riscv_io_info_rf_20),
    .io_info_rf_21(i_riscv_io_info_rf_21),
    .io_info_rf_22(i_riscv_io_info_rf_22),
    .io_info_rf_23(i_riscv_io_info_rf_23),
    .io_info_rf_24(i_riscv_io_info_rf_24),
    .io_info_rf_25(i_riscv_io_info_rf_25),
    .io_info_rf_26(i_riscv_io_info_rf_26),
    .io_info_rf_27(i_riscv_io_info_rf_27),
    .io_info_rf_28(i_riscv_io_info_rf_28),
    .io_info_rf_29(i_riscv_io_info_rf_29),
    .io_info_rf_30(i_riscv_io_info_rf_30),
    .io_info_rf_31(i_riscv_io_info_rf_31)
  );
  assign _T = i_uart_io_GPIO_0[7:1]; // @[Top.scala 37:35]
  assign pre_inst_valid = i_uart_io_GPIO_0[2]; // @[Top.scala 65:38]
  assign _T_6 = r_inst_valid == 1'h0; // @[Top.scala 69:48]
  assign inst_valid = pre_inst_valid & _T_6; // @[Top.scala 69:32]
  assign reg_sel = i_uart_io_GPIO_1[4:0]; // @[Top.scala 83:33]
  assign reg_rstrb = i_uart_io_GPIO_1[6:5]; // @[Top.scala 84:33]
  assign _T_11 = reg_rstrb == 2'h0; // @[Top.scala 87:18]
  assign _GEN_0 = i_riscv_io_info_rf_0; // @[Top.scala 88:44]
  assign _GEN_1 = 5'h1 == reg_sel ? i_riscv_io_info_rf_1 : _GEN_0; // @[Top.scala 88:44]
  assign _GEN_2 = 5'h2 == reg_sel ? i_riscv_io_info_rf_2 : _GEN_1; // @[Top.scala 88:44]
  assign _GEN_3 = 5'h3 == reg_sel ? i_riscv_io_info_rf_3 : _GEN_2; // @[Top.scala 88:44]
  assign _GEN_4 = 5'h4 == reg_sel ? i_riscv_io_info_rf_4 : _GEN_3; // @[Top.scala 88:44]
  assign _GEN_5 = 5'h5 == reg_sel ? i_riscv_io_info_rf_5 : _GEN_4; // @[Top.scala 88:44]
  assign _GEN_6 = 5'h6 == reg_sel ? i_riscv_io_info_rf_6 : _GEN_5; // @[Top.scala 88:44]
  assign _GEN_7 = 5'h7 == reg_sel ? i_riscv_io_info_rf_7 : _GEN_6; // @[Top.scala 88:44]
  assign _GEN_8 = 5'h8 == reg_sel ? i_riscv_io_info_rf_8 : _GEN_7; // @[Top.scala 88:44]
  assign _GEN_9 = 5'h9 == reg_sel ? i_riscv_io_info_rf_9 : _GEN_8; // @[Top.scala 88:44]
  assign _GEN_10 = 5'ha == reg_sel ? i_riscv_io_info_rf_10 : _GEN_9; // @[Top.scala 88:44]
  assign _GEN_11 = 5'hb == reg_sel ? i_riscv_io_info_rf_11 : _GEN_10; // @[Top.scala 88:44]
  assign _GEN_12 = 5'hc == reg_sel ? i_riscv_io_info_rf_12 : _GEN_11; // @[Top.scala 88:44]
  assign _GEN_13 = 5'hd == reg_sel ? i_riscv_io_info_rf_13 : _GEN_12; // @[Top.scala 88:44]
  assign _GEN_14 = 5'he == reg_sel ? i_riscv_io_info_rf_14 : _GEN_13; // @[Top.scala 88:44]
  assign _GEN_15 = 5'hf == reg_sel ? i_riscv_io_info_rf_15 : _GEN_14; // @[Top.scala 88:44]
  assign _GEN_16 = 5'h10 == reg_sel ? i_riscv_io_info_rf_16 : _GEN_15; // @[Top.scala 88:44]
  assign _GEN_17 = 5'h11 == reg_sel ? i_riscv_io_info_rf_17 : _GEN_16; // @[Top.scala 88:44]
  assign _GEN_18 = 5'h12 == reg_sel ? i_riscv_io_info_rf_18 : _GEN_17; // @[Top.scala 88:44]
  assign _GEN_19 = 5'h13 == reg_sel ? i_riscv_io_info_rf_19 : _GEN_18; // @[Top.scala 88:44]
  assign _GEN_20 = 5'h14 == reg_sel ? i_riscv_io_info_rf_20 : _GEN_19; // @[Top.scala 88:44]
  assign _GEN_21 = 5'h15 == reg_sel ? i_riscv_io_info_rf_21 : _GEN_20; // @[Top.scala 88:44]
  assign _GEN_22 = 5'h16 == reg_sel ? i_riscv_io_info_rf_22 : _GEN_21; // @[Top.scala 88:44]
  assign _GEN_23 = 5'h17 == reg_sel ? i_riscv_io_info_rf_23 : _GEN_22; // @[Top.scala 88:44]
  assign _GEN_24 = 5'h18 == reg_sel ? i_riscv_io_info_rf_24 : _GEN_23; // @[Top.scala 88:44]
  assign _GEN_25 = 5'h19 == reg_sel ? i_riscv_io_info_rf_25 : _GEN_24; // @[Top.scala 88:44]
  assign _GEN_26 = 5'h1a == reg_sel ? i_riscv_io_info_rf_26 : _GEN_25; // @[Top.scala 88:44]
  assign _GEN_27 = 5'h1b == reg_sel ? i_riscv_io_info_rf_27 : _GEN_26; // @[Top.scala 88:44]
  assign _GEN_28 = 5'h1c == reg_sel ? i_riscv_io_info_rf_28 : _GEN_27; // @[Top.scala 88:44]
  assign _GEN_29 = 5'h1d == reg_sel ? i_riscv_io_info_rf_29 : _GEN_28; // @[Top.scala 88:44]
  assign _GEN_30 = 5'h1e == reg_sel ? i_riscv_io_info_rf_30 : _GEN_29; // @[Top.scala 88:44]
  assign _GEN_31 = 5'h1f == reg_sel ? i_riscv_io_info_rf_31 : _GEN_30; // @[Top.scala 88:44]
  assign _T_12 = _GEN_31[7:0]; // @[Top.scala 88:44]
  assign _T_13 = reg_rstrb == 2'h1; // @[Top.scala 89:24]
  assign _T_14 = _GEN_31[15:8]; // @[Top.scala 90:44]
  assign _T_15 = reg_rstrb == 2'h2; // @[Top.scala 91:24]
  assign _T_16 = _GEN_31[23:16]; // @[Top.scala 92:44]
  assign _T_17 = reg_rstrb == 2'h3; // @[Top.scala 93:24]
  assign _T_18 = _GEN_31[31:24]; // @[Top.scala 94:44]
  assign _GEN_32 = _T_17 ? _T_18 : 8'h0; // @[Top.scala 93:32]
  assign _GEN_33 = _T_15 ? _T_16 : _GEN_32; // @[Top.scala 91:32]
  assign _GEN_34 = _T_13 ? _T_14 : _GEN_33; // @[Top.scala 89:32]
  assign _T_19 = i_riscv_io_error; // @[Top.scala 99:25]
  assign _GEN_36 = inst_valid ? 1'h0 : r_error; // @[Top.scala 101:33]
  assign _GEN_37 = _T_19 | _GEN_36; // @[Top.scala 99:33]
  assign _T_21 = i_riscv_io_inst_ready; // @[Top.scala 104:30]
  assign _GEN_38 = inst_valid ? 1'h0 : r_inst_ready; // @[Top.scala 106:33]
  assign _GEN_39 = _T_21 | _GEN_38; // @[Top.scala 104:38]
  assign _T_23 = {r_error,r_inst_ready}; // @[Cat.scala 29:58]
  assign io_TD = i_uart_io_TD; // @[Top.scala 31:16]
  assign io_GPIO = {_T,i_uart_io_idle}; // @[Top.scala 37:11]
  assign i_uart_clock = clock;
  assign i_uart_reset = reset;
  assign i_uart_io_RD = io_RD; // @[Top.scala 30:16]
  assign i_uart_io_MONITOR_0 = {{4'd0}, io_SW_IN}; // @[Top.scala 33:24]
  assign i_uart_io_MONITOR_1 = {{6'd0}, _T_23}; // @[Top.scala 34:24 Top.scala 110:24]
  assign i_uart_io_MONITOR_2 = i_riscv_io_inst_addr[7:0]; // @[Top.scala 35:24 Top.scala 111:24]
  assign i_uart_io_MONITOR_3 = _T_11 ? _T_12 : _GEN_34; // @[Top.scala 36:24 Top.scala 112:24]
  assign i_uart_io_rdata = i_riscv_io_if_mem_bd_rdata; // @[Top.scala 75:30]
  assign i_riscv_clock = clock;
  assign i_riscv_reset = reset;
  assign i_riscv_io_inst_valid = pre_inst_valid & _T_6; // @[Top.scala 74:30]
  assign i_riscv_io_if_mem_bd_bd_en = i_uart_io_GPIO_0[0]; // @[Top.scala 72:30]
  assign i_riscv_io_if_mem_bd_we = i_uart_io_we; // @[Top.scala 76:30]
  assign i_riscv_io_if_mem_bd_wdata = i_uart_io_wdata; // @[Top.scala 78:30]
  assign i_riscv_io_if_mem_bd_addr = i_uart_io_addr[15:0]; // @[Top.scala 77:30]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  r_inst_valid = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  r_error = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  r_inst_ready = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      r_inst_valid <= 1'h0;
    end else begin
      r_inst_valid <= pre_inst_valid;
    end
    if (reset) begin
      r_error <= 1'h0;
    end else begin
      r_error <= _GEN_37;
    end
    if (reset) begin
      r_inst_ready <= 1'h0;
    end else begin
      r_inst_ready <= _GEN_39;
    end
  end
endmodule
