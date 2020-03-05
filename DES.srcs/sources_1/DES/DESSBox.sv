`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Lukas Schmalen <git@dijky.me>
// 
// Create Date: 13.02.2020 02:01:15
// Design Name: 
// Module Name: DESSBox
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`define DES_SBOX_COUNT 8
`define DES_SBOX_ROWS 4
`define DES_SBOX_COLS 16
`define DES_SBOX_TOTAL ((`DES_SBOX_ROWS) * (`DES_SBOX_COLS))
`define DES_SBOX_OFFSET(row, col) ((row) * (`DES_SBOX_COLS) + (col))

module DESSBox#(parameter FILE = "")(
    input [0:5] in,
    output [0:3] out
);

reg [3:0] mem [0:`DES_SBOX_TOTAL - 1];
initial $readmemh(FILE, mem);

wire [0:1] row = { in[0], in[5] };
wire [0:3] col = in[1:4];

assign out = mem[`DES_SBOX_OFFSET(row, col)];

endmodule

module DESSBoxArray(
    input [0:47] in,
    output [0:31] out
);

DESSBox #("DESSBoxTable0.mem") sbox0(in[0:5], out[0:3]);
DESSBox #("DESSBoxTable1.mem") sbox1(in[6:11], out[4:7]);
DESSBox #("DESSBoxTable2.mem") sbox2(in[12:17], out[8:11]);
DESSBox #("DESSBoxTable3.mem") sbox3(in[18:23], out[12:15]);
DESSBox #("DESSBoxTable4.mem") sbox4(in[24:29], out[16:19]);
DESSBox #("DESSBoxTable5.mem") sbox5(in[30:35], out[20:23]);
DESSBox #("DESSBoxTable6.mem") sbox6(in[36:41], out[24:27]);
DESSBox #("DESSBoxTable7.mem") sbox7(in[42:47], out[28:31]);

endmodule