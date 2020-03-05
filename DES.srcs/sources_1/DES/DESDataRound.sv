`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Lukas Schmalen <git@dijky.me>
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

`include "DESTypes.svh"

module DESDataRound(
    input des_block data_in,
    input des_round_key rkey_in,
    output des_block data_out
);

des_hblk feistel_out;

DESFeistel feistel(.hblk_in(data_in.hblk[1]), .rkey_in(rkey_in), .hblk_out(feistel_out));

assign data_out.hblk[0] = data_in.hblk[1];
assign data_out.hblk[1] = data_in.hblk[0] ^ feistel_out;

endmodule
