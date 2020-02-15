`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2020 11:25:04
// Design Name: 
// Module Name: DESFeistel
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


module DESFeistel(
    input [31:0] hblk_in,
    input [47:0] rkey_in,
    output [31:0] hblk_out
);

wire [0:47] hblk_expanded;
wire [0:47] hblk_xor_rkey;
wire [0:31] sbox_out;

DESExpansion expand(.in(hblk_in), .out(hblk_expanded));
assign hblk_xor_rkey = hblk_expanded ^ rkey_in;
DESSBoxArray sboxes(.in(hblk_xor_rkey), .out(sbox_out));
DESPermutation permutate(.in(sbox_out), .out(hblk_out));

endmodule
