`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Lukas Schmalen <git@dijky.me>
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

`include "DESTypes.svh"

module DESFeistel(
    input des_hblk hblk_in,
    input des_round_key rkey_in,
    output des_hblk hblk_out
);

des_hblk_expanded hblk_expanded;
des_hblk_expanded hblk_xor_rkey;
des_hblk sbox_out;

DESExpansion expand(.in(hblk_in), .out(hblk_expanded));
assign hblk_xor_rkey = hblk_expanded ^ rkey_in;
DESSBoxArray sboxes(.in(hblk_xor_rkey), .out(sbox_out));
DESPermutation permutate(.in(sbox_out), .out(hblk_out));

endmodule
