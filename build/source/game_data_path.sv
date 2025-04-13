/*
    This file was generated automatically by Alchitry Labs 2.0.30-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module game_data_path #(
        parameter COLUMN_DIMENSION = 16'h10,
        parameter ROW_DIMENSION = 16'h10,
        parameter PIXEL_COUNT = 16'h100,
        parameter BUFFER_SIZE = 11'h400,
        parameter BULLET_SLOW_CLK_DIV = 5'h18,
        parameter FAST_CLOCK_DIV = 5'h15,
        parameter ENEMY_A_SLOW_CLK_DIV = 5'h18,
        parameter TIMER_SLOW_CLK_DIV = 5'h19
    ) (
        input wire redshoot_btn,
        input wire greenshoot_btn,
        input wire left_btn,
        input wire right_btn,
        input wire start_btn,
        input wire clk,
        input wire rst,
        output reg [7:0] led,
        output reg [2:0][7:0] io_led,
        output reg [7:0] io_segment,
        output reg [3:0] io_select,
        output reg bullet_slow_clk_out,
        output reg timer_slow_clk_out,
        output reg data_out
    );
    logic [31:0] input_alu_a;
    logic [31:0] input_alu_b;
    logic [31:0] M_game_alu_a;
    logic [31:0] M_game_alu_b;
    logic [5:0] M_game_alu_alufn;
    logic [31:0] M_game_alu_out;
    logic M_game_alu_z;
    logic M_game_alu_v;
    logic M_game_alu_n;
    
    alu game_alu (
        .a(M_game_alu_a),
        .b(M_game_alu_b),
        .alufn(M_game_alu_alufn),
        .out(M_game_alu_out),
        .z(M_game_alu_z),
        .v(M_game_alu_v),
        .n(M_game_alu_n)
    );
    
    
    localparam _MP_SIZE_1074286108 = 1'h1;
    localparam _MP_DIV_1074286108 = BULLET_SLOW_CLK_DIV;
    localparam _MP_TOP_1074286108 = 1'h0;
    localparam _MP_UP_1074286108 = 1'h1;
    logic [0:0] M_bullet_slow_clk_value;
    
    counter #(
        .SIZE(_MP_SIZE_1074286108),
        .DIV(_MP_DIV_1074286108),
        .TOP(_MP_TOP_1074286108),
        .UP(_MP_UP_1074286108)
    ) bullet_slow_clk (
        .rst(rst),
        .clk(clk),
        .value(M_bullet_slow_clk_value)
    );
    
    
    localparam _MP_SIZE_304224155 = 1'h1;
    localparam _MP_DIV_304224155 = FAST_CLOCK_DIV;
    localparam _MP_TOP_304224155 = 1'h0;
    localparam _MP_UP_304224155 = 1'h1;
    logic [0:0] M_fast_clk_value;
    
    counter #(
        .SIZE(_MP_SIZE_304224155),
        .DIV(_MP_DIV_304224155),
        .TOP(_MP_TOP_304224155),
        .UP(_MP_UP_304224155)
    ) fast_clk (
        .rst(rst),
        .clk(clk),
        .value(M_fast_clk_value)
    );
    
    
    localparam _MP_SIZE_182511876 = 1'h1;
    localparam _MP_DIV_182511876 = ENEMY_A_SLOW_CLK_DIV;
    localparam _MP_TOP_182511876 = 1'h0;
    localparam _MP_UP_182511876 = 1'h1;
    logic [0:0] M_enemy_A_slow_clk_value;
    
    counter #(
        .SIZE(_MP_SIZE_182511876),
        .DIV(_MP_DIV_182511876),
        .TOP(_MP_TOP_182511876),
        .UP(_MP_UP_182511876)
    ) enemy_A_slow_clk (
        .rst(rst),
        .clk(clk),
        .value(M_enemy_A_slow_clk_value)
    );
    
    
    localparam _MP_SIZE_1592471667 = 1'h1;
    localparam _MP_DIV_1592471667 = TIMER_SLOW_CLK_DIV;
    localparam _MP_TOP_1592471667 = 1'h0;
    localparam _MP_UP_1592471667 = 1'h1;
    logic [0:0] M_timer_slow_clk_value;
    
    counter #(
        .SIZE(_MP_SIZE_1592471667),
        .DIV(_MP_DIV_1592471667),
        .TOP(_MP_TOP_1592471667),
        .UP(_MP_UP_1592471667)
    ) timer_slow_clk (
        .rst(rst),
        .clk(clk),
        .value(M_timer_slow_clk_value)
    );
    
    
    localparam _MP_RISE_1299715221 = 1'h1;
    localparam _MP_FALL_1299715221 = 1'h0;
    logic M_edge_detector_game_timer_out;
    
    edge_detector #(
        .RISE(_MP_RISE_1299715221),
        .FALL(_MP_FALL_1299715221)
    ) edge_detector_game_timer (
        .in(M_timer_slow_clk_value),
        .clk(clk),
        .out(M_edge_detector_game_timer_out)
    );
    
    
    localparam _MP_COLUMN_DIMENSION_1243074017 = 16'h10;
    localparam _MP_ROW_DIMENSION_1243074017 = 16'h10;
    localparam _MP_PIXEL_COUNT_1243074017 = 16'h100;
    localparam _MP_BUFFER_SIZE_1243074017 = 11'h400;
    logic [31:0] M_game_cu_regfile_rd2;
    logic [5:0] M_game_cu_alufn_signal;
    logic [2:0] M_game_cu_asel;
    logic [2:0] M_game_cu_bsel;
    logic [1:0] M_game_cu_wdsel;
    logic [4:0] M_game_cu_regfile_wa;
    logic [4:0] M_game_cu_regfile_ra1;
    logic [4:0] M_game_cu_regfile_ra2;
    logic M_game_cu_regfile_we;
    logic [3:0] M_game_cu_debug;
    
    game_cu #(
        .COLUMN_DIMENSION(_MP_COLUMN_DIMENSION_1243074017),
        .ROW_DIMENSION(_MP_ROW_DIMENSION_1243074017),
        .PIXEL_COUNT(_MP_PIXEL_COUNT_1243074017),
        .BUFFER_SIZE(_MP_BUFFER_SIZE_1243074017)
    ) game_cu (
        .left_btn(left_btn),
        .right_btn(right_btn),
        .redshoot_btn(redshoot_btn),
        .greenshoot_btn(greenshoot_btn),
        .bullet_slow_clk_out(M_bullet_slow_clk_value),
        .enemy_A_slow_clk_out(M_enemy_A_slow_clk_value),
        .timer_slow_clk_out(M_timer_slow_clk_value),
        .start_btn(start_btn),
        .rst(rst),
        .clk(clk),
        .regfile_rd2(M_game_cu_regfile_rd2),
        .alufn_signal(M_game_cu_alufn_signal),
        .asel(M_game_cu_asel),
        .bsel(M_game_cu_bsel),
        .wdsel(M_game_cu_wdsel),
        .regfile_wa(M_game_cu_regfile_wa),
        .regfile_ra1(M_game_cu_regfile_ra1),
        .regfile_ra2(M_game_cu_regfile_ra2),
        .regfile_we(M_game_cu_regfile_we),
        .debug(M_game_cu_debug)
    );
    
    
    localparam _MP_COLUMN_DIMENSION_2119939377 = 16'h10;
    localparam _MP_ROW_DIMENSION_2119939377 = 16'h10;
    logic [31:0] M_game_regfile_regfile_data;
    logic [31:0] M_game_regfile_rd1;
    logic [31:0] M_game_regfile_rd2;
    logic [31:0] M_game_regfile_player_pos_x_out;
    logic [31:0] M_game_regfile_player_pos_y_out;
    logic [31:0] M_game_regfile_enemy_A_active_out;
    logic [31:0] M_game_regfile_timer_out;
    logic [31:0] M_game_regfile_score_out;
    logic [31:0] M_game_regfile_enemy_B_active_out;
    logic [31:0] M_game_regfile_bullet_color_out;
    logic [31:0] M_game_regfile_player_bullet_x_out;
    logic [31:0] M_game_regfile_player_bullet_y_out;
    logic [31:0] M_game_regfile_enemy_C_active_out;
    logic [31:0] M_game_regfile_check_boundary_out;
    logic [31:0] M_game_regfile_bullet_active_out;
    logic [31:0] M_game_regfile_enemy_stage_pointer_out;
    logic [31:0] M_game_regfile_bullet_encode_out;
    logic [31:0] M_game_regfile_enemy_A_x_out;
    logic [31:0] M_game_regfile_enemy_A_y_out;
    logic [31:0] M_game_regfile_enemy_A_color_out;
    logic [31:0] M_game_regfile_enemy_B_x_out;
    logic [31:0] M_game_regfile_enemy_B_y_out;
    logic [31:0] M_game_regfile_enemy_B_color_out;
    logic [31:0] M_game_regfile_enemy_C_x_out;
    logic [31:0] M_game_regfile_enemy_C_y_out;
    logic [31:0] M_game_regfile_enemy_C_color_out;
    logic [7:0] M_game_regfile_led;
    logic [2:0][7:0] M_game_regfile_io_led;
    logic [7:0] M_game_regfile_io_segment;
    logic [3:0] M_game_regfile_io_select;
    
    game_regfile #(
        .COLUMN_DIMENSION(_MP_COLUMN_DIMENSION_2119939377),
        .ROW_DIMENSION(_MP_ROW_DIMENSION_2119939377)
    ) game_regfile (
        .we(M_game_cu_regfile_we),
        .wa(M_game_cu_regfile_wa),
        .ra1(M_game_cu_regfile_ra1),
        .ra2(M_game_cu_regfile_ra2),
        .rst(rst),
        .clk(clk),
        .regfile_data(M_game_regfile_regfile_data),
        .rd1(M_game_regfile_rd1),
        .rd2(M_game_regfile_rd2),
        .player_pos_x_out(M_game_regfile_player_pos_x_out),
        .player_pos_y_out(M_game_regfile_player_pos_y_out),
        .enemy_A_active_out(M_game_regfile_enemy_A_active_out),
        .timer_out(M_game_regfile_timer_out),
        .score_out(M_game_regfile_score_out),
        .enemy_B_active_out(M_game_regfile_enemy_B_active_out),
        .bullet_color_out(M_game_regfile_bullet_color_out),
        .player_bullet_x_out(M_game_regfile_player_bullet_x_out),
        .player_bullet_y_out(M_game_regfile_player_bullet_y_out),
        .enemy_C_active_out(M_game_regfile_enemy_C_active_out),
        .check_boundary_out(M_game_regfile_check_boundary_out),
        .bullet_active_out(M_game_regfile_bullet_active_out),
        .enemy_stage_pointer_out(M_game_regfile_enemy_stage_pointer_out),
        .bullet_encode_out(M_game_regfile_bullet_encode_out),
        .enemy_A_x_out(M_game_regfile_enemy_A_x_out),
        .enemy_A_y_out(M_game_regfile_enemy_A_y_out),
        .enemy_A_color_out(M_game_regfile_enemy_A_color_out),
        .enemy_B_x_out(M_game_regfile_enemy_B_x_out),
        .enemy_B_y_out(M_game_regfile_enemy_B_y_out),
        .enemy_B_color_out(M_game_regfile_enemy_B_color_out),
        .enemy_C_x_out(M_game_regfile_enemy_C_x_out),
        .enemy_C_y_out(M_game_regfile_enemy_C_y_out),
        .enemy_C_color_out(M_game_regfile_enemy_C_color_out),
        .led(M_game_regfile_led),
        .io_led(M_game_regfile_io_led),
        .io_segment(M_game_regfile_io_segment),
        .io_select(M_game_regfile_io_select)
    );
    
    
    localparam _MP_COLUMN_DIMENSION_1832381443 = 16'h10;
    localparam _MP_ROW_DIMENSION_1832381443 = 16'h10;
    logic [31:0] M_rom_enemy_A_romdata_out;
    logic [31:0] M_rom_enemy_B_romdata_out;
    logic [31:0] M_rom_enemy_C_romdata_out;
    
    enemy_rom #(
        .COLUMN_DIMENSION(_MP_COLUMN_DIMENSION_1832381443),
        .ROW_DIMENSION(_MP_ROW_DIMENSION_1832381443)
    ) rom (
        .enemy_stage_pointer_out(M_game_regfile_enemy_stage_pointer_out),
        .enemy_A_romdata_out(M_rom_enemy_A_romdata_out),
        .enemy_B_romdata_out(M_rom_enemy_B_romdata_out),
        .enemy_C_romdata_out(M_rom_enemy_C_romdata_out)
    );
    
    
    localparam _MP_COLUMN_DIMENSION_2147033162 = 16'h10;
    localparam _MP_ROW_DIMENSION_2147033162 = 16'h10;
    localparam _MP_PIXEL_COUNT_2147033162 = 16'h100;
    localparam _MP_BUFFER_SIZE_2147033162 = 11'h400;
    logic [7:0] M_ram_mode_led;
    logic [2:0][7:0] M_ram_mode_io_led;
    logic [7:0] M_ram_mode_io_segment;
    logic [3:0] M_ram_mode_io_select;
    logic M_ram_mode_data;
    
    ram_mode #(
        .COLUMN_DIMENSION(_MP_COLUMN_DIMENSION_2147033162),
        .ROW_DIMENSION(_MP_ROW_DIMENSION_2147033162),
        .PIXEL_COUNT(_MP_PIXEL_COUNT_2147033162),
        .BUFFER_SIZE(_MP_BUFFER_SIZE_2147033162)
    ) ram_mode (
        .left_btn(left_btn),
        .right_btn(right_btn),
        .start_btn(start_btn),
        .player_pos_x_out(M_game_regfile_player_pos_x_out),
        .player_pos_y_out(M_game_regfile_player_pos_y_out),
        .bullet_colour_out(M_game_regfile_bullet_color_out),
        .player_bullet_x_out(M_game_regfile_player_bullet_x_out),
        .player_bullet_y_out(M_game_regfile_player_bullet_y_out),
        .bullet_active_out(M_game_regfile_bullet_active_out),
        .bullet_slow_clk_out(M_bullet_slow_clk_value),
        .fast_clk_out(M_fast_clk_value),
        .enemy_A_x_out(M_game_regfile_enemy_A_x_out),
        .enemy_A_y_out(M_game_regfile_enemy_A_y_out),
        .enemy_A_color_out(M_game_regfile_enemy_A_color_out),
        .enemy_B_x_out(M_game_regfile_enemy_B_x_out),
        .enemy_B_y_out(M_game_regfile_enemy_B_y_out),
        .enemy_B_color_out(M_game_regfile_enemy_B_color_out),
        .enemy_C_x_out(M_game_regfile_enemy_C_x_out),
        .enemy_C_y_out(M_game_regfile_enemy_C_y_out),
        .enemy_C_color_out(M_game_regfile_enemy_C_color_out),
        .rst(rst),
        .clk(clk),
        .led(M_ram_mode_led),
        .io_led(M_ram_mode_io_led),
        .io_segment(M_ram_mode_io_segment),
        .io_select(M_ram_mode_io_select),
        .data(M_ram_mode_data)
    );
    
    
    always @* begin
        M_game_cu_regfile_rd2 = M_game_regfile_rd2;
        data_out = M_ram_mode_data;
        io_segment = 8'hff;
        io_select = 4'hf;
        led = 8'h0;
        io_led[1'h0] = M_game_regfile_io_led[1'h0];
        io_led[1'h1] = M_game_regfile_io_led[1'h1];
        io_led[2'h2] = M_game_regfile_io_led[2'h2];
        led = M_game_regfile_led;
        
        case (M_game_cu_asel)
            3'h0: begin
                input_alu_a = M_game_regfile_rd1;
            end
            3'h1: begin
                input_alu_a = 1'h0;
            end
            3'h2: begin
                input_alu_a = 4'hd;
            end
            3'h3: begin
                input_alu_a = 32'h30f;
            end
            default: begin
                input_alu_a = 1'h0;
            end
        endcase
        
        case (M_game_cu_bsel)
            3'h0: begin
                input_alu_b = M_game_regfile_rd2;
            end
            3'h1: begin
                input_alu_b = 1'h1;
            end
            3'h2: begin
                input_alu_b = 4'he;
            end
            3'h3: begin
                input_alu_b = 2'h2;
            end
            3'h4: begin
                input_alu_b = 1'h0;
            end
            3'h5: begin
                input_alu_b = 2'h3;
            end
            3'h6: begin
                input_alu_b = 4'h8;
            end
            default: begin
                input_alu_b = 1'h0;
            end
        endcase
        M_game_alu_a = input_alu_a;
        M_game_alu_b = input_alu_b;
        M_game_alu_alufn = M_game_cu_alufn_signal;
        
        case (M_game_cu_wdsel)
            2'h0: begin
                M_game_regfile_regfile_data = M_game_alu_out;
            end
            2'h1: begin
                M_game_regfile_regfile_data = M_rom_enemy_A_romdata_out;
            end
            2'h2: begin
                M_game_regfile_regfile_data = M_rom_enemy_B_romdata_out;
            end
            2'h3: begin
                M_game_regfile_regfile_data = M_rom_enemy_C_romdata_out;
            end
            default: begin
                M_game_regfile_regfile_data = M_game_alu_out;
            end
        endcase
        bullet_slow_clk_out = M_bullet_slow_clk_value;
        timer_slow_clk_out = M_timer_slow_clk_value;
    end
    
    
endmodule