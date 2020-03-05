`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Lukas Schmalen <git@dijky.me>
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

`include "DESTypes.svh"

`define DES_TEST_FILE "des.test.mem"
`define DES_TEST_ROWS (291 - 56)

module DESTEST();

reg clk = 1;
integer clk_cnt = 0;
reg rst = 0;
reg valid = 0;

des_key key_in;
des_key_state key_pc1;
des_round_key key_r1, key_r2;
des_block data_in, data_ip, data_fp, data_ou;

struct packed {
    des_key key;
    des_block plain;
    des_block cipher;
} test_rows [0:`DES_TEST_ROWS-1];

initial begin
    $readmemh(`DES_TEST_FILE, test_rows);
/*
    key_in <= 64'b01110101_00101000_01111000_00111001_01110100_10010011_11001011_01110000;
    key_pc1 <= 56'b0110000_0110101_0110011_1111011_0110000_0000100_0101001_1101101;
    key_r1 <= 48'b001110001010110011101111010001100101011001001010;
    key_r2 <= 48'b100010011011111011010100010010001001110100010010;
    
    data_in <= 64'b00010001_00100010_00110011_01000100_01010101_01100110_01110111_10001000;
    data_ip <= 64'b01111000_01010101_01111000_01010101_10000000_01100110_10000000_01100110;
    data_fp <= 64'b01001000_10010101_10100101_11100011_10101101_00101011_11011100_00110100;
    data_ou <= 64'b10110101_00100001_10011110_11101000_00011010_10100111_01001001_10011101;
    valid = 1;
*/
end

wire CORRECT;

wire des_block data_out;
wire valid_out;

DES#(16) des(clk, rst, data_in, key_in, valid, data_out, valid_out);

assign data_ou = (clk_cnt >= 16 & clk_cnt < `DES_TEST_ROWS + 16) ? test_rows[clk_cnt-16].cipher : 0;
assign CORRECT = valid_out == 0 | data_out == data_ou;

initial begin
    $monitor($time, , CORRECT);
end

always @(negedge clk) begin
    if (clk_cnt < `DES_TEST_ROWS) begin
        data_in = test_rows[clk_cnt].plain;
        key_in = test_rows[clk_cnt].key;
    end
end

always @(posedge clk) begin
    $display("%t    %d %d    %b", $time, CORRECT, valid_out, data_out);
    valid = clk_cnt < `DES_TEST_ROWS;
    if (clk_cnt >= 16 & clk_cnt < `DES_TEST_ROWS + 16) begin
        // Set test vector output for comparison
        // Delayed by 16 cycles    
        // data_ou = test_rows[clk_cnt-16].cipher;
    end
    if (clk_cnt >= `DES_TEST_ROWS + 16 + 10) $finish;
    clk_cnt = clk_cnt + 1;
end

always #5 clk = !clk;

// always #1 if (!CORRECT) $stop;

// always #20 if (valid_out) $finish;

// initial #8 $stop;
// initial #100 $stop;
initial #3500 $stop;
/*
initial begin
    #100
    clk_cnt = 0;
    rst = 1;
end
*/
endmodule
