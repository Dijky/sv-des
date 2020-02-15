`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.02.2020 03:31:57
// Design Name: 
// Module Name: DESTEST
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


module DESTEST();

localparam [0:63] key_in = 64'b01110101_00101000_01111000_00111001_01110100_10010011_11001011_01110000;
localparam [0:55] key_pc1 = 56'b0110000_0110101_0110011_1111011_0110000_0000100_0101001_1101101;
localparam [0:47] key_r1 = 48'b001110001010110011101111010001100101011001001010;
localparam [0:47] key_r2 = 48'b100010011011111011010100010010001001110100010010;

localparam [0:63] data_in = 64'b00010001_00100010_00110011_01000100_01010101_01100110_01110111_10001000;
localparam [0:63] data_ip = 64'b01111000_01010101_01111000_01010101_10000000_01100110_10000000_01100110;
localparam [0:63] data_fp = 64'b01001000_10010101_10100101_11100011_10101101_00101011_11011100_00110100;
localparam [0:63] data_ou = 64'b10110101_00100001_10011110_11101000_00011010_10100111_01001001_10011101;

reg clk = 0;
integer clk_cnt = 0;
reg rst = 0;

wire CORRECT;

wire [0:63] data_out;
wire valid_out;

DES des(clk, rst, data_in, key_in, data_out, valid_out);

assign CORRECT = !valid_out | data_out == data_ou;

initial begin
    $monitor($time, , CORRECT);
    clk = 0;
    rst = 1;
end

always @(posedge clk) begin
    $display("%t    %d    %b", $time, valid_out, data_out);
    clk_cnt = clk_cnt + 1;
    if (clk_cnt > 1)
        rst = 0;
end

always #5 clk = !clk;

always #1 if (!CORRECT) $stop;

// always #20 if (valid_out) $finish;

// initial #8 $stop;
// initial #100 $stop;
initial #400 $stop;

initial begin
    #100
    clk_cnt = 0;
    rst = 1;
end

endmodule
