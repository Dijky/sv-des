`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2020 12:50:03
// Design Name: 
// Module Name: DESKeyScheduleTEST
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


module DESKeyScheduleTEST();

localparam [0:63] key_in = 64'b01110101_00101000_01111000_00111001_01110100_10010011_11001011_01110000;
localparam [0:55] key_pc1 = 56'b0110000_0110101_0110011_1111011_0110000_0000100_0101001_1101101;
localparam [0:47] key_r1 = 48'b001110001010110011101111010001100101011001001010;
localparam [0:47] key_r2 = 48'b100010011011111011010100010010001001110100010010;

reg clk = 0;
integer clk_cnt = 0;
reg rst = 0;

wire [0:55] TEST_pc1_key_out;
wire [0:55] TEST_state_out;
wire CORRECT_pc1;
wire CORRECT_rkey1;
wire CORRECT_rkey2;
wire CORRECT;

wire [0:47] rkey;
wire [0:3] round;
wire valid;

DESKeySchedule key_sched(
    .clk(clk),
    .rst(rst),
    .key_in(key_in),
    .rkey_out(rkey),
    .round_out(round),
    .valid_out(valid),
    .TEST_pc1_key_out(TEST_pc1_key_out),
    .TEST_state_out(TEST_state_out)
);

assign CORRECT_pc1 = key_pc1 == TEST_pc1_key_out;
assign CORRECT_rkey1 = !valid | round != 0 | rkey == key_r1;
assign CORRECT_rkey2 = !valid | round != 1 | rkey == key_r2;
assign CORRECT = CORRECT_pc1 & CORRECT_rkey1 & CORRECT_rkey2;

initial begin
    $monitor($time, , CORRECT_pc1, CORRECT);
    clk = 0;
    rst = 1;
end

always @(posedge clk) begin
    $display("%t    %d  %d    %b", $time, valid, round, rkey);
    clk_cnt = clk_cnt + 1;
    if (clk_cnt > 1)
        rst = 0;
end

always
    #5 clk = !clk;
    
always
    #1 if (!CORRECT) $stop;

always;
    // #1 if (round >= 15) $finish;

initial
    #300 $stop;

endmodule
