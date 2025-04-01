/*
    This file was generated automatically by Alchitry Labs 2.0.30-BETA.
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
        input wire [2:0][7:0] io_dip,
        output reg data
    );
    logic rst;
    localparam COLUMN_DIMENSION = 5'h10;
    localparam ROW_DIMENSION = 5'h10;
    localparam PIXEL_COUNT = 10'h100;
    localparam _MP_STAGES_2097570701 = 3'h4;
    logic M_reset_cond_in;
    logic M_reset_cond_out;
    
    reset_conditioner #(
        .STAGES(_MP_STAGES_2097570701)
    ) reset_cond (
        .clk(clk),
        .in(M_reset_cond_in),
        .out(M_reset_cond_out)
    );
    
    
    localparam _MP_COLUMN_DIMENSION_941506501 = 5'h10;
    localparam _MP_ROW_DIMENSION_941506501 = 5'h10;
    localparam _MP_PIXEL_COUNT_941506501 = 10'h100;
    localparam _MP_BUFFER_SIZE_941506501 = 11'h400;
    logic [7:0] M_player_mode_led;
    logic [2:0][7:0] M_player_mode_io_led;
    logic [7:0] M_player_mode_io_segment;
    logic [3:0] M_player_mode_io_select;
    logic M_player_mode_data;
    
    player_mode #(
        .COLUMN_DIMENSION(_MP_COLUMN_DIMENSION_941506501),
        .ROW_DIMENSION(_MP_ROW_DIMENSION_941506501),
        .PIXEL_COUNT(_MP_PIXEL_COUNT_941506501),
        .BUFFER_SIZE(_MP_BUFFER_SIZE_941506501)
    ) player_mode (
        .io_button(io_button),
        .io_dip(io_dip),
        .clk(clk),
        .rst(rst),
        .led(M_player_mode_led),
        .io_led(M_player_mode_io_led),
        .io_segment(M_player_mode_io_segment),
        .io_select(M_player_mode_io_select),
        .data(M_player_mode_data)
    );
    
    
    localparam CLK_FREQ = 27'h5f5e100;
    localparam _MP_CLK_FREQ_2058462907 = 27'h5f5e100;
    logic [7:0] M_alu_manual_led;
    logic [2:0][7:0] M_alu_manual_io_led;
    logic [7:0] M_alu_manual_io_segment;
    logic [3:0] M_alu_manual_io_select;
    
    alu_manual_tester #(
        .CLK_FREQ(_MP_CLK_FREQ_2058462907)
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
        usb_tx = usb_rx;
        io_segment = 8'hf;
        io_select = 4'hf;
        led = 8'h0;
        data = 1'h0;
        io_led = {{8'h0, 8'h0, 8'h0}};
        
        case (io_dip[2'h2][2'h2:1'h0])
            3'h0: begin
                io_segment = M_alu_manual_io_segment;
                io_select = M_alu_manual_io_select;
                io_led = M_alu_manual_io_led;
                led = M_alu_manual_led;
            end
            3'h2: begin
                io_segment = M_player_mode_io_segment;
                io_select = M_player_mode_io_select;
                data = M_player_mode_data;
                led = M_player_mode_led;
                io_led = M_player_mode_io_led;
            end
        endcase
    end
    
    
endmodule