`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Lukas Schmalen <git@dijky.me>
// 
// Create Date: 12.02.2020 11:25:04
// Design Name: 
// Module Name: DESKeySchedule
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

module DESLeftRots(
    output [0:15] cnt
);

assign cnt[0]  = 0;
assign cnt[1]  = 0;
assign cnt[2]  = 1;
assign cnt[3]  = 1;
assign cnt[4]  = 1;
assign cnt[5]  = 1;
assign cnt[6]  = 1;
assign cnt[7]  = 1;
assign cnt[8]  = 0;
assign cnt[9]  = 1;
assign cnt[10] = 1;
assign cnt[11] = 1;
assign cnt[12] = 1;
assign cnt[13] = 1;
assign cnt[14] = 1;
assign cnt[15] = 0;

endmodule

module DESKeyRotate(
    input two,
    input [0:27] in,
    output [0:27] out
);

assign out[0:27] = two ? {in[2:27], in[0:1]} : {in[1:27], in[0]};

endmodule

module DESKeyRound(
    input des_key_state in,
    input [0:3] round,
    output des_key_state out,
    output des_round_key rkey
);

logic [0:15] rot_tab;
logic rot_cnt;
des_key_state rot_state;

DESLeftRots rot_table(rot_tab);
assign rot_cnt = rot_tab[round];

DESKeyRotate rotL(rot_cnt, in[0:27], out[0:27]);
DESKeyRotate rotR(rot_cnt, in[28:55], out[28:55]);

DESPC2 pc2(out, rkey);

endmodule
