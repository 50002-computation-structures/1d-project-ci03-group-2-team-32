/*
    This file was generated automatically by Alchitry Labs 2.0.29-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module alu_manual_tester #(
        parameter CLK_FREQ = 10'h3e8
    ) (
        input wire clk,
        input wire rst,
        input wire [4:0] io_button,
        input wire [2:0][7:0] io_dip,
        output reg [7:0] led,
        output reg [2:0][7:0] io_led,
        output reg [7:0] io_segment,
        output reg [3:0] io_select
    );
    logic [31:0] M_alu_a;
    logic [31:0] M_alu_b;
    logic [5:0] M_alu_alufn_signal;
    logic [31:0] M_alu_out;
    logic M_alu_z;
    logic M_alu_v;
    logic M_alu_n;
    
    alu alu (
        .a(M_alu_a),
        .b(M_alu_b),
        .alufn_signal(M_alu_alufn_signal),
        .out(M_alu_out),
        .z(M_alu_z),
        .v(M_alu_v),
        .n(M_alu_n)
    );
    
    
    localparam SEVEN_SEG_DIV = 5'h10;
    localparam E_States_IDLE = 3'h0;
    localparam E_States_A1 = 3'h1;
    localparam E_States_A2 = 3'h2;
    localparam E_States_B1 = 3'h3;
    localparam E_States_B2 = 3'h4;
    localparam logic [4:0][0:0] _MP_RISE_713133665 = {{1'h1, 1'h1, 1'h1, 1'h1, 1'h1}};
    localparam logic [4:0][0:0] _MP_FALL_713133665 = {{1'h0, 1'h0, 1'h0, 1'h0, 1'h0}};
    logic [4:0] M_io_button_edge_in;
    logic [4:0] M_io_button_edge_out;
    
    genvar idx_0_713133665;
    
    generate
        for (idx_0_713133665 = 0; idx_0_713133665 < 5; idx_0_713133665 = idx_0_713133665 + 1) begin: forLoop_idx_0_713133665
            edge_detector #(
                .RISE(_MP_RISE_713133665[idx_0_713133665]),
                .FALL(_MP_FALL_713133665[idx_0_713133665])
            ) io_button_edge (
                .clk(clk),
                .in(M_io_button_edge_in[idx_0_713133665]),
                .out(M_io_button_edge_out[idx_0_713133665])
            );
        end
    endgenerate
    
    
    localparam logic [4:0][9:0] _MP_CLK_FREQ_1586936409 = {{10'h3e8, 10'h3e8, 10'h3e8, 10'h3e8, 10'h3e8}};
    localparam _MP_MIN_DELAY_1586936409 = 5'h14;
    localparam _MP_NUM_SYNC_1586936409 = 2'h2;
    logic [4:0] M_io_button_cond_in;
    logic [4:0] M_io_button_cond_out;
    
    genvar idx_0_1586936409;
    
    generate
        for (idx_0_1586936409 = 0; idx_0_1586936409 < 5; idx_0_1586936409 = idx_0_1586936409 + 1) begin: forLoop_idx_0_1586936409
            button_conditioner #(
                .CLK_FREQ(_MP_CLK_FREQ_1586936409[idx_0_1586936409]),
                .MIN_DELAY(_MP_MIN_DELAY_1586936409),
                .NUM_SYNC(_MP_NUM_SYNC_1586936409)
            ) io_button_cond (
                .clk(clk),
                .in(M_io_button_cond_in[idx_0_1586936409]),
                .out(M_io_button_cond_out[idx_0_1586936409])
            );
        end
    endgenerate
    
    
    localparam _MP_DIGITS_1187637757 = 3'h4;
    localparam _MP_DIV_1187637757 = 5'h10;
    logic [3:0][3:0] M_seg_values;
    logic [6:0] M_seg_seg;
    logic [3:0] M_seg_sel;
    
    multi_seven_seg #(
        .DIGITS(_MP_DIGITS_1187637757),
        .DIV(_MP_DIV_1187637757)
    ) seg (
        .clk(clk),
        .rst(rst),
        .values(M_seg_values),
        .seg(M_seg_seg),
        .sel(M_seg_sel)
    );
    
    
    logic [2:0] D_states_d, D_states_q = 3'h0;
    logic [31:0] D_a_d, D_a_q = 1'h0;
    logic [31:0] D_b_d, D_b_q = 1'h0;
    always @* begin
        D_states_d = D_states_q;
        D_a_d = D_a_q;
        D_b_d = D_b_q;
        
        M_io_button_cond_in = io_button;
        M_io_button_edge_in = M_io_button_cond_out;
        D_states_d = D_states_q;
        D_a_d = D_a_q;
        D_b_d = D_b_q;
        M_alu_a = D_a_q;
        M_alu_b = D_b_q;
        M_alu_alufn_signal = io_dip[2'h2][3'h5:1'h0];
        led = 8'h0;
        io_led = {{8'h0, 8'h0, 8'h0}};
        M_seg_values = {{4'h0, 4'h0, 4'h0, 4'h0}};
        io_segment = ~M_seg_seg;
        io_select = ~M_seg_sel;
        
        case (D_states_q)
            3'h0: begin
                M_seg_values = {{3'h0, M_alu_z}, {3'h0, M_alu_v}, {3'h0, M_alu_n}, 4'h0};
                led = M_alu_out[3'h7:1'h0];
                io_led = M_alu_out[5'h1f:4'h8];
                if (M_io_button_edge_out[1'h0]) begin
                    D_states_d = 3'h1;
                end else begin
                    if (M_io_button_edge_out[2'h2]) begin
                        D_states_d = 3'h3;
                    end
                end
            end
            3'h1: begin
                D_a_d[3'h7:1'h0] = io_dip[1'h0];
                D_a_d[4'hf:4'h8] = io_dip[1'h1];
                led = D_a_q[3'h7:1'h0];
                io_led = D_a_q[5'h1f:4'h8];
                if (M_io_button_edge_out[1'h1]) begin
                    D_states_d = 3'h2;
                end
            end
            3'h2: begin
                D_a_d[5'h17:5'h10] = io_dip[1'h0];
                D_a_d[5'h1f:5'h18] = io_dip[1'h1];
                led = D_a_q[3'h7:1'h0];
                io_led = D_a_q[5'h1f:4'h8];
                if (M_io_button_edge_out[1'h1]) begin
                    D_states_d = 3'h0;
                end
            end
            3'h3: begin
                D_b_d[3'h7:1'h0] = io_dip[1'h0];
                D_b_d[4'hf:4'h8] = io_dip[1'h1];
                led = D_b_q[3'h7:1'h0];
                io_led = D_b_q[5'h1f:4'h8];
                if (M_io_button_edge_out[1'h1]) begin
                    D_states_d = 3'h4;
                end
            end
            3'h4: begin
                D_b_d[5'h17:5'h10] = io_dip[1'h0];
                D_b_d[5'h1f:5'h18] = io_dip[1'h1];
                led = D_b_q[3'h7:1'h0];
                io_led = D_b_q[5'h1f:4'h8];
                if (M_io_button_edge_out[1'h1]) begin
                    D_states_d = 3'h0;
                end
            end
        endcase
    end
    
    
    always @(posedge (clk)) begin
        if ((rst) == 1'b1) begin
            D_states_q <= 3'h0;
            D_a_q <= 1'h0;
            D_b_q <= 1'h0;
        end else begin
            D_states_q <= D_states_d;
            D_a_q <= D_a_d;
            D_b_q <= D_b_d;
        end
    end
endmodule