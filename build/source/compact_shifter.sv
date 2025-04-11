/*
    This file was generated automatically by Alchitry Labs 2.0.30-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module compact_shifter (
        input wire [31:0] a,
        input wire [4:0] b,
        input wire [6:0] alufn_signal,
        output reg [31:0] shift
    );
    logic [31:0] R_2af8caf1_i;
    logic [31:0] RR_2af8caf1_i;
    logic [31:0] R_43089679_i;
    logic [31:0] RR_43089679_i;
    logic [31:0] M_left_shifter_a;
    logic [4:0] M_left_shifter_b;
    logic M_left_shifter_pad;
    logic [31:0] M_left_shifter_shift;
    
    shifter left_shifter (
        .a(M_left_shifter_a),
        .b(M_left_shifter_b),
        .pad(M_left_shifter_pad),
        .shift(M_left_shifter_shift)
    );
    
    
    localparam _MP_SIZE_1542622262 = 6'h20;
    logic [31:0] M_reverser1_in;
    logic [31:0] M_reverser1_reversed;
    
    bit_reverser #(
        .SIZE(_MP_SIZE_1542622262)
    ) reverser1 (
        .in(M_reverser1_in),
        .reversed(M_reverser1_reversed)
    );
    
    
    localparam _MP_SIZE_2144440221 = 6'h20;
    logic [31:0] M_reverser2_in;
    logic [31:0] M_reverser2_reversed;
    
    bit_reverser #(
        .SIZE(_MP_SIZE_2144440221)
    ) reverser2 (
        .in(M_reverser2_in),
        .reversed(M_reverser2_reversed)
    );
    
    
    logic [31:0] M_mux1_s0;
    logic [31:0][1:0] M_mux1_in;
    logic [31:0] M_mux1_out;
    
    genvar idx_0_1973972979;
    
    generate
        for (idx_0_1973972979 = 0; idx_0_1973972979 < 32; idx_0_1973972979 = idx_0_1973972979 + 1) begin: forLoop_idx_0_1973972979
            mux_2 mux1 (
                .s0(M_mux1_s0[idx_0_1973972979]),
                .in(M_mux1_in[idx_0_1973972979]),
                .out(M_mux1_out[idx_0_1973972979])
            );
        end
    endgenerate
    
    
    logic [31:0] M_mux2_s0;
    logic [31:0][1:0] M_mux2_in;
    logic [31:0] M_mux2_out;
    
    genvar idx_0_1776488255;
    
    generate
        for (idx_0_1776488255 = 0; idx_0_1776488255 < 32; idx_0_1776488255 = idx_0_1776488255 + 1) begin: forLoop_idx_0_1776488255
            mux_2 mux2 (
                .s0(M_mux2_s0[idx_0_1776488255]),
                .in(M_mux2_in[idx_0_1776488255]),
                .out(M_mux2_out[idx_0_1776488255])
            );
        end
    endgenerate
    
    
    logic M_padding_s0;
    logic [1:0] M_padding_in;
    logic M_padding_out;
    
    mux_2 padding (
        .s0(M_padding_s0),
        .in(M_padding_in),
        .out(M_padding_out)
    );
    
    
    always @* begin
        M_reverser1_in = a;
        for (RR_2af8caf1_i = 0; RR_2af8caf1_i < 6'h20; RR_2af8caf1_i = RR_2af8caf1_i + 1) begin
      R_2af8caf1_i = (1'h0) + RR_2af8caf1_i * (1'h1);
            M_mux1_in[R_2af8caf1_i][1'h0] = a[R_2af8caf1_i];
            M_mux1_in[R_2af8caf1_i][1'h1] = M_reverser1_reversed[R_2af8caf1_i];
            M_mux1_s0[R_2af8caf1_i] = alufn_signal[1'h0];
            M_left_shifter_a[R_2af8caf1_i] = M_mux1_out[R_2af8caf1_i];
        end
        M_left_shifter_b = b;
        M_padding_in[1'h0] = 1'h0;
        M_padding_in[1'h1] = a[5'h1f];
        M_padding_s0 = alufn_signal[1'h1];
        M_left_shifter_pad = M_padding_out;
        M_reverser2_in = M_left_shifter_shift;
        for (RR_43089679_i = 0; RR_43089679_i < 6'h20; RR_43089679_i = RR_43089679_i + 1) begin
      R_43089679_i = (1'h0) + RR_43089679_i * (1'h1);
            M_mux2_in[R_43089679_i][1'h0] = M_left_shifter_shift[R_43089679_i];
            M_mux2_in[R_43089679_i][1'h1] = M_reverser2_reversed[R_43089679_i];
            M_mux2_s0[R_43089679_i] = alufn_signal[1'h0];
            shift[R_43089679_i] = M_mux2_out[R_43089679_i];
        end
    end
    
    
endmodule