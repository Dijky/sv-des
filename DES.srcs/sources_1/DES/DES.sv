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

`include "DESTypes.svh"

module DES#(
    parameter integer STAGES = 16
)(
    input clk,
    input rst,
    input des_block data_in,
    input des_key key_in,
    input valid_in,
    output des_block data_out,
    output valid_out
);
initial begin
    assert_STAGES: assert(STAGES == 16);
end
genvar stage;

typedef struct packed {
    des_block data;
    des_key_state key_state;
    logic valid;
} round_data;

// Helper wires for intermediate signals
wire des_block data_ip;
wire des_key_state key_state_pc1;
wire des_block data_pre_fp;

// Initial Permutation; input from module input
DESIP ip(.in(data_in), .out(data_ip));
// Permutation Choice 1; input from module input
DESPC1 pc1(.key_in(key_in), .key_out(key_state_pc1));

round_data state [0:STAGES-1]; // Inputs to stages
wire round_data next [0:STAGES-1]; // Outputs from stages

for(stage = 0; stage < STAGES; stage = stage + 1) begin
    initial state[stage] = 0;
    wire des_round_key rkey; // From key_round to data_round
    DESKeyRound key_round(.in(state[stage].key_state), .round(stage[3:0]), .out(next[stage].key_state), .rkey(rkey));
    DESDataRound data_round(.data_in(state[stage].data), .rkey_in(rkey), .data_out(next[stage].data));
    assign next[stage].valid = state[stage].valid; // Forward valid bit as is
end

// Final Permutation; assign output to output of module
DESFP fp(.in(data_pre_fp), .out(data_out));

// Assign output of last stage to output of module
assign valid_out = next[STAGES-1].valid; // @TODO
// Assign output of last stage to input to FP; undo last swap
assign data_pre_fp.hblk[0] = next[STAGES-1].data.hblk[1];
assign data_pre_fp.hblk[1] = next[STAGES-1].data.hblk[0];
// assign data_pre_fp = { next[STAGES-1].data[32:63], next[STAGES-1].data[0:31] };

always@(posedge clk) begin
    // Set module input as input to stage 0
    state[0].valid = valid_in;
    // Skip input from module if it's not valid
    state[0].data = valid_in ? data_ip : 0; // From Initial Permutation
    state[0].key_state = valid_in ?key_state_pc1 : 0; // Prom Permutation Choice 1
    
    if (rst == 1) begin
        // Reset all stages
        for (integer stage = 1; stage < STAGES; stage = stage + 1) begin
            state[stage].valid = 0;
            state[stage].data = 0;
            state[stage].key_state = 0;
        end
    end else begin
        // Forward stage outputs to next stage's inputs
        for (integer stage = 1; stage < STAGES; stage = stage + 1) begin
            state[stage].valid = next[stage-1].valid;
            state[stage].data = next[stage-1].data;
            state[stage].key_state = next[stage-1].key_state;
        end
    end
end

endmodule
