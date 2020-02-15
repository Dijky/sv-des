`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.02.2020 11:25:04
// Design Name: 
// Module Name: DES
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


module DES(
    input clk,
    input rst,
    input [0:63] data_in,
    input [0:63] key_in,
    output [0:63] data_out,
    output valid_out
);

reg valid = 0;
reg [0:3] round = 0;
reg [0:63] data = 0;
reg [0:55] key_state = 0;

wire [0:63] data_ip;
wire [0:55] key_state_pc1;
wire [0:63] data_pre_fp;

wire [0:63] next_data;
wire [0:55] next_key_state;
wire [0:47] rkey;

DESIP ip(.in(data_in), .out(data_ip));
DESPC1 pc1(.key_in(key_in), .key_out(key_state_pc1));

// DESKeySchedule key_sched(.clk(clk), .key_in(key_in), .rkey_out(rkey));
DESKeyRound key_round(.in(key_state), .round(round), .out(next_key_state), .rkey(rkey));
DESDataRound data_round(.data_in(data), .rkey_in(rkey), .data_out(next_data));

assign data_pre_fp = { data[32:63], data[0:31] };
DESFP fp(.in(data_pre_fp), .out(data_out));

assign valid_out = valid;

always@(posedge clk) begin
    if (rst == 1) begin
        round = 0;
        valid = 0;
        data = data_ip;
        key_state = key_state_pc1;
    end
    else if (round == 15) begin
        if (valid == 0) begin
            data = next_data;
            key_state = next_key_state;
        end
        valid = 1;
    end
    else begin
        round = round + 1;
        data = next_data;
        key_state = next_key_state;
    end
end

endmodule
