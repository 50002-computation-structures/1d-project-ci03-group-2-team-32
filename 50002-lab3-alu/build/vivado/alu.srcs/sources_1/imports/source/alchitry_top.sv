/*
    This file was generated automatically by Alchitry Labs 2.0.29-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module alchitry_top (
        input wire clk,
        input wire rst_n,
        output reg [7:0] led,
        input wire usb_rx,
        output reg usb_tx,
        output reg [2:0][7:0] io_led,
        output reg [7:0] io_segment,
        output reg [3:0] io_select,
        input wire [4:0] io_button,
        input wire [2:0][7:0] io_dip
    );
    logic rst;
    localparam _MP_STAGES_389288111 = 3'h4;
    logic M_reset_cond_in;
    logic M_reset_cond_out;
    
    reset_conditioner #(
        .STAGES(_MP_STAGES_389288111)
    ) reset_cond (
        .clk(clk),
        .in(M_reset_cond_in),
        .out(M_reset_cond_out)
    );
    
    
    localparam CLK_FREQ = 24'h989680;
    localparam _MP_CLK_FREQ_1022484645 = 24'h989680;
    logic [7:0] M_alu_manual_led;
    logic [2:0][7:0] M_alu_manual_io_led;
    logic [7:0] M_alu_manual_io_segment;
    logic [3:0] M_alu_manual_io_select;
    
    alu_manual_tester #(
        .CLK_FREQ(_MP_CLK_FREQ_1022484645)
    ) alu_manual (
        .clk(clk),
        .rst(rst),
        .io_button(io_button),
        .io_dip(io_dip),
        .led(M_alu_manual_led),
        .io_led(M_alu_manual_io_led),
        .io_segment(M_alu_manual_io_segment),
        .io_select(M_alu_manual_io_select)
    );
    
    
    always @* begin
        M_reset_cond_in = ~rst_n;
        rst = M_reset_cond_out;
        led = 8'h0;
        usb_tx = usb_rx;
        io_segment = M_alu_manual_io_segment;
        io_select = M_alu_manual_io_select;
        io_led = M_alu_manual_io_led;
        led = M_alu_manual_led;
    end
    
    
endmodule