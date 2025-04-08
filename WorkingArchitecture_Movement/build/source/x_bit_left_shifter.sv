/*
    This file was generated automatically by Alchitry Labs 2.0.30-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module x_bit_left_shifter #(
        parameter SHIFT = 4'h8
    ) (
        input wire [31:0] a,
        input wire shift,
        input wire pad,
        output reg [31:0] out
    );
    logic [31:0] R_23ec3a25_i;
    logic [31:0] RR_23ec3a25_i;
    logic [31:0] M_mux_2_s0;
    logic [31:0][1:0] M_mux_2_in;
    logic [31:0] M_mux_2_out;
    
    genvar idx_0_776684784;
    
    generate
        for (idx_0_776684784 = 0; idx_0_776684784 < 32; idx_0_776684784 = idx_0_776684784 + 1) begin: forLoop_idx_0_776684784
            mux_2 mux_2 (
                .s0(M_mux_2_s0[idx_0_776684784]),
                .in(M_mux_2_in[idx_0_776684784]),
                .out(M_mux_2_out[idx_0_776684784])
            );
        end
    endgenerate
    
    
    logic [31:0] shifted_bits;
    always @* begin
        shifted_bits = {a[5'h1f - SHIFT:1'h0], {SHIFT{pad}}};
        M_mux_2_s0 = {6'h20{shift}};
        for (RR_23ec3a25_i = 0; RR_23ec3a25_i < 6'h20; RR_23ec3a25_i = RR_23ec3a25_i + 1) begin
      R_23ec3a25_i = (1'h0) + RR_23ec3a25_i * (1'h1);
            M_mux_2_in[R_23ec3a25_i][1'h0] = a[R_23ec3a25_i];
            M_mux_2_in[R_23ec3a25_i][1'h1] = shifted_bits[R_23ec3a25_i];
        end
        out = M_mux_2_out;
    end
    
    
endmodule