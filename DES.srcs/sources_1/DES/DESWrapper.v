`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2020 18:27:20
// Design Name: 
// Module Name: DESWrapper
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

module DESWrapper(
    input clk,
    input rst,
    input [0:63] data_in,
    input [0:63] key_in,
    input valid_in,
    output [0:63] data_out,
    output valid_out
);

DES des(clk, rst, data_in, key_in, valid_in, data_out, valid_out);

endmodule
