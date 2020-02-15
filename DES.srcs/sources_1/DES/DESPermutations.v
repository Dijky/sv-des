`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2020 02:01:15
// Design Name: 
// Module Name: DESPermutations
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

module DESIP(
    input [0:63] in,
    output [0:63] out
);

// Generated permutation
assign out[0] = in[57];
assign out[1] = in[49];
assign out[2] = in[41];
assign out[3] = in[33];
assign out[4] = in[25];
assign out[5] = in[17];
assign out[6] = in[9];
assign out[7] = in[1];
assign out[8] = in[59];
assign out[9] = in[51];
assign out[10] = in[43];
assign out[11] = in[35];
assign out[12] = in[27];
assign out[13] = in[19];
assign out[14] = in[11];
assign out[15] = in[3];
assign out[16] = in[61];
assign out[17] = in[53];
assign out[18] = in[45];
assign out[19] = in[37];
assign out[20] = in[29];
assign out[21] = in[21];
assign out[22] = in[13];
assign out[23] = in[5];
assign out[24] = in[63];
assign out[25] = in[55];
assign out[26] = in[47];
assign out[27] = in[39];
assign out[28] = in[31];
assign out[29] = in[23];
assign out[30] = in[15];
assign out[31] = in[7];
assign out[32] = in[56];
assign out[33] = in[48];
assign out[34] = in[40];
assign out[35] = in[32];
assign out[36] = in[24];
assign out[37] = in[16];
assign out[38] = in[8];
assign out[39] = in[0];
assign out[40] = in[58];
assign out[41] = in[50];
assign out[42] = in[42];
assign out[43] = in[34];
assign out[44] = in[26];
assign out[45] = in[18];
assign out[46] = in[10];
assign out[47] = in[2];
assign out[48] = in[60];
assign out[49] = in[52];
assign out[50] = in[44];
assign out[51] = in[36];
assign out[52] = in[28];
assign out[53] = in[20];
assign out[54] = in[12];
assign out[55] = in[4];
assign out[56] = in[62];
assign out[57] = in[54];
assign out[58] = in[46];
assign out[59] = in[38];
assign out[60] = in[30];
assign out[61] = in[22];
assign out[62] = in[14];
assign out[63] = in[6];

endmodule

module DESFP(
    input [0:63] in,
    output [0:63] out
);

assign out[0] = in[39];
assign out[1] = in[7];
assign out[2] = in[47];
assign out[3] = in[15];
assign out[4] = in[55];
assign out[5] = in[23];
assign out[6] = in[63];
assign out[7] = in[31];
assign out[8] = in[38];
assign out[9] = in[6];
assign out[10] = in[46];
assign out[11] = in[14];
assign out[12] = in[54];
assign out[13] = in[22];
assign out[14] = in[62];
assign out[15] = in[30];
assign out[16] = in[37];
assign out[17] = in[5];
assign out[18] = in[45];
assign out[19] = in[13];
assign out[20] = in[53];
assign out[21] = in[21];
assign out[22] = in[61];
assign out[23] = in[29];
assign out[24] = in[36];
assign out[25] = in[4];
assign out[26] = in[44];
assign out[27] = in[12];
assign out[28] = in[52];
assign out[29] = in[20];
assign out[30] = in[60];
assign out[31] = in[28];
assign out[32] = in[35];
assign out[33] = in[3];
assign out[34] = in[43];
assign out[35] = in[11];
assign out[36] = in[51];
assign out[37] = in[19];
assign out[38] = in[59];
assign out[39] = in[27];
assign out[40] = in[34];
assign out[41] = in[2];
assign out[42] = in[42];
assign out[43] = in[10];
assign out[44] = in[50];
assign out[45] = in[18];
assign out[46] = in[58];
assign out[47] = in[26];
assign out[48] = in[33];
assign out[49] = in[1];
assign out[50] = in[41];
assign out[51] = in[9];
assign out[52] = in[49];
assign out[53] = in[17];
assign out[54] = in[57];
assign out[55] = in[25];
assign out[56] = in[32];
assign out[57] = in[0];
assign out[58] = in[40];
assign out[59] = in[8];
assign out[60] = in[48];
assign out[61] = in[16];
assign out[62] = in[56];
assign out[63] = in[24];

endmodule

module DESExpansion(
    input  [0:31] in,
    output [0:47] out
);

// Generated permutation
assign out[0] = in[31];
assign out[1] = in[0];
assign out[2] = in[1];
assign out[3] = in[2];
assign out[4] = in[3];
assign out[5] = in[4];
assign out[6] = in[3];
assign out[7] = in[4];
assign out[8] = in[5];
assign out[9] = in[6];
assign out[10] = in[7];
assign out[11] = in[8];
assign out[12] = in[7];
assign out[13] = in[8];
assign out[14] = in[9];
assign out[15] = in[10];
assign out[16] = in[11];
assign out[17] = in[12];
assign out[18] = in[11];
assign out[19] = in[12];
assign out[20] = in[13];
assign out[21] = in[14];
assign out[22] = in[15];
assign out[23] = in[16];
assign out[24] = in[15];
assign out[25] = in[16];
assign out[26] = in[17];
assign out[27] = in[18];
assign out[28] = in[19];
assign out[29] = in[20];
assign out[30] = in[19];
assign out[31] = in[20];
assign out[32] = in[21];
assign out[33] = in[22];
assign out[34] = in[23];
assign out[35] = in[24];
assign out[36] = in[23];
assign out[37] = in[24];
assign out[38] = in[25];
assign out[39] = in[26];
assign out[40] = in[27];
assign out[41] = in[28];
assign out[42] = in[27];
assign out[43] = in[28];
assign out[44] = in[29];
assign out[45] = in[30];
assign out[46] = in[31];
assign out[47] = in[0];

endmodule

module DESPermutation(
    input [0:31] in,
    output [0:31] out
);

// Generated permutation
assign out[0] = in[15];
assign out[1] = in[6];
assign out[2] = in[19];
assign out[3] = in[20];
assign out[4] = in[28];
assign out[5] = in[11];
assign out[6] = in[27];
assign out[7] = in[16];
assign out[8] = in[0];
assign out[9] = in[14];
assign out[10] = in[22];
assign out[11] = in[25];
assign out[12] = in[4];
assign out[13] = in[17];
assign out[14] = in[30];
assign out[15] = in[9];
assign out[16] = in[1];
assign out[17] = in[7];
assign out[18] = in[23];
assign out[19] = in[13];
assign out[20] = in[31];
assign out[21] = in[26];
assign out[22] = in[2];
assign out[23] = in[8];
assign out[24] = in[18];
assign out[25] = in[12];
assign out[26] = in[29];
assign out[27] = in[5];
assign out[28] = in[21];
assign out[29] = in[10];
assign out[30] = in[3];
assign out[31] = in[24];

endmodule

module DESPC1(
    input [0:63] key_in,
    output [0:55] key_out
);

// Generated permutation
assign key_out[0] = key_in[56];
assign key_out[1] = key_in[48];
assign key_out[2] = key_in[40];
assign key_out[3] = key_in[32];
assign key_out[4] = key_in[24];
assign key_out[5] = key_in[16];
assign key_out[6] = key_in[8];
assign key_out[7] = key_in[0];
assign key_out[8] = key_in[57];
assign key_out[9] = key_in[49];
assign key_out[10] = key_in[41];
assign key_out[11] = key_in[33];
assign key_out[12] = key_in[25];
assign key_out[13] = key_in[17];
assign key_out[14] = key_in[9];
assign key_out[15] = key_in[1];
assign key_out[16] = key_in[58];
assign key_out[17] = key_in[50];
assign key_out[18] = key_in[42];
assign key_out[19] = key_in[34];
assign key_out[20] = key_in[26];
assign key_out[21] = key_in[18];
assign key_out[22] = key_in[10];
assign key_out[23] = key_in[2];
assign key_out[24] = key_in[59];
assign key_out[25] = key_in[51];
assign key_out[26] = key_in[43];
assign key_out[27] = key_in[35];
assign key_out[28] = key_in[62];
assign key_out[29] = key_in[54];
assign key_out[30] = key_in[46];
assign key_out[31] = key_in[38];
assign key_out[32] = key_in[30];
assign key_out[33] = key_in[22];
assign key_out[34] = key_in[14];
assign key_out[35] = key_in[6];
assign key_out[36] = key_in[61];
assign key_out[37] = key_in[53];
assign key_out[38] = key_in[45];
assign key_out[39] = key_in[37];
assign key_out[40] = key_in[29];
assign key_out[41] = key_in[21];
assign key_out[42] = key_in[13];
assign key_out[43] = key_in[5];
assign key_out[44] = key_in[60];
assign key_out[45] = key_in[52];
assign key_out[46] = key_in[44];
assign key_out[47] = key_in[36];
assign key_out[48] = key_in[28];
assign key_out[49] = key_in[20];
assign key_out[50] = key_in[12];
assign key_out[51] = key_in[4];
assign key_out[52] = key_in[27];
assign key_out[53] = key_in[19];
assign key_out[54] = key_in[11];
assign key_out[55] = key_in[3];

endmodule

module DESPC2(
    input [0:55] state,
    output [0:47] key_out
);

// Generated permutation
assign key_out[0] = state[13];
assign key_out[1] = state[16];
assign key_out[2] = state[10];
assign key_out[3] = state[23];
assign key_out[4] = state[0];
assign key_out[5] = state[4];
assign key_out[6] = state[2];
assign key_out[7] = state[27];
assign key_out[8] = state[14];
assign key_out[9] = state[5];
assign key_out[10] = state[20];
assign key_out[11] = state[9];
assign key_out[12] = state[22];
assign key_out[13] = state[18];
assign key_out[14] = state[11];
assign key_out[15] = state[3];
assign key_out[16] = state[25];
assign key_out[17] = state[7];
assign key_out[18] = state[15];
assign key_out[19] = state[6];
assign key_out[20] = state[26];
assign key_out[21] = state[19];
assign key_out[22] = state[12];
assign key_out[23] = state[1];
assign key_out[24] = state[40];
assign key_out[25] = state[51];
assign key_out[26] = state[30];
assign key_out[27] = state[36];
assign key_out[28] = state[46];
assign key_out[29] = state[54];
assign key_out[30] = state[29];
assign key_out[31] = state[39];
assign key_out[32] = state[50];
assign key_out[33] = state[44];
assign key_out[34] = state[32];
assign key_out[35] = state[47];
assign key_out[36] = state[43];
assign key_out[37] = state[48];
assign key_out[38] = state[38];
assign key_out[39] = state[55];
assign key_out[40] = state[33];
assign key_out[41] = state[52];
assign key_out[42] = state[45];
assign key_out[43] = state[41];
assign key_out[44] = state[49];
assign key_out[45] = state[35];
assign key_out[46] = state[28];
assign key_out[47] = state[31];

endmodule
