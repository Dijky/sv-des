`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2020 03:04:02
// Design Name: 
// Module Name: DESDataRound
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


module DESDataRound(
    input [0:63] data_in,
    input [0:47] rkey_in,
    output [0:63] data_out
);

wire [0:31] hblk_in_left = data_in[0:31];
wire [0:31] hblk_in_right = data_in[32:63];
wire [0:31] hblk_out_left = hblk_in_right;
wire [0:31] hblk_out_right;

wire [0:31] feistel_out;

DESFeistel feistel(.hblk_in(hblk_in_right), .rkey_in(rkey_in), .hblk_out(feistel_out));
assign hblk_out_right = hblk_in_left ^ feistel_out;

assign data_out = { hblk_out_left, hblk_out_right };

endmodule
