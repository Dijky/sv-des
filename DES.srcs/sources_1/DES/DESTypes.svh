`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Lukas Schmalen <git@dijky.me>
// 
// Create Date: 16.02.2020 11:13:02
// Design Name: 
// Module Name: DESTypes
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

`ifndef DES_TYPES_H
`define DES_TYPES_H

typedef logic [0:63] des_key;
typedef logic [0:55] des_key_state;
typedef logic [0:47] des_round_key;

typedef logic [0:63] des_fblk;
typedef logic [0:31] des_hblk;
typedef union packed {
    des_fblk block;
    des_hblk[0:1] hblk;
} des_block;

typedef logic [0:47] des_hblk_expanded;

`endif // DES_TYPES_H
