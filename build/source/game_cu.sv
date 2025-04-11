/*
    This file was generated automatically by Alchitry Labs 2.0.30-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module game_cu #(
        parameter COLUMN_DIMENSION = 16'h10,
        parameter ROW_DIMENSION = 16'h10,
        parameter PIXEL_COUNT = 16'h100,
        parameter BUFFER_SIZE = 11'h400
    ) (
        input wire clk,
        input wire rst,
        input wire [31:0] regfile_rd2,
        input wire bullet_slow_clk_out,
        input wire left_btn,
        input wire right_btn,
        input wire redshoot_btn,
        input wire greenshoot_btn,
        input wire start_btn,
        output reg [5:0] alufn_signal,
        output reg [2:0] asel,
        output reg [2:0] bsel,
        output reg [3:0] wdsel,
        output reg [4:0] regfile_wa,
        output reg [4:0] regfile_ra1,
        output reg [4:0] regfile_ra2,
        output reg regfile_we,
        output reg [3:0] debug
    );
    localparam E_GameStates_START = 5'h0;
    localparam E_GameStates_SPAWN_ENEMY_A_X = 5'h1;
    localparam E_GameStates_SPAWN_ENEMY_A_Y = 5'h2;
    localparam E_GameStates_SPAWN_ENEMY_A_COLOR = 5'h3;
    localparam E_GameStates_SET_ENEMY_A_ACTIVE = 5'h4;
    localparam E_GameStates_SPAWN_ENEMY_B_X = 5'h5;
    localparam E_GameStates_SPAWN_ENEMY_B_Y = 5'h6;
    localparam E_GameStates_SPAWN_ENEMY_B_COLOR = 5'h7;
    localparam E_GameStates_SET_ENEMY_B_ACTIVE = 5'h8;
    localparam E_GameStates_SPAWN_ENEMY_C_X = 5'h9;
    localparam E_GameStates_SPAWN_ENEMY_C_Y = 5'ha;
    localparam E_GameStates_SPAWN_ENEMY_C_COLOR = 5'hb;
    localparam E_GameStates_SET_ENEMY_C_ACTIVE = 5'hc;
    localparam E_GameStates_INCRE_ENEMY_WAVE = 5'hd;
    localparam E_GameStates_IDLE = 5'he;
    localparam E_GameStates_CHECK_RIGHT_BOUND = 5'hf;
    localparam E_GameStates_CHECK_LEFT_BOUND = 5'h10;
    localparam E_GameStates_MOVE_RIGHT = 5'h11;
    localparam E_GameStates_MOVE_LEFT = 5'h12;
    localparam E_GameStates_SET_RED_BULLET_COLOR = 5'h13;
    localparam E_GameStates_SET_GREEN_BULLET_COLOR = 5'h14;
    localparam E_GameStates_SET_BLUE_BULLET_COLOR = 5'h15;
    localparam E_GameStates_BULLET_ACTIVE = 5'h16;
    localparam E_GameStates_BULLET_X_POS = 5'h17;
    localparam E_GameStates_CHECK_BULLET_BOUNDARY = 5'h18;
    localparam E_GameStates_BULLET_MOVE = 5'h19;
    localparam E_GameStates_BULLET_INACTIVE = 5'h1a;
    localparam _MP_RISE_1899119680 = 1'h1;
    localparam _MP_FALL_1899119680 = 1'h0;
    logic M_bullet_slow_clk_edge_in;
    logic M_bullet_slow_clk_edge_out;
    
    edge_detector #(
        .RISE(_MP_RISE_1899119680),
        .FALL(_MP_FALL_1899119680)
    ) bullet_slow_clk_edge (
        .clk(clk),
        .in(M_bullet_slow_clk_edge_in),
        .out(M_bullet_slow_clk_edge_out)
    );
    
    
    logic [4:0] D_game_fsm_d, D_game_fsm_q = 5'h0;
    always @* begin
        D_game_fsm_d = D_game_fsm_q;
        
        M_bullet_slow_clk_edge_in = bullet_slow_clk_out;
        alufn_signal = 1'h0;
        asel = 1'h0;
        bsel = 1'h0;
        regfile_we = 1'h0;
        regfile_wa = 3'h6;
        regfile_ra1 = 1'h0;
        regfile_ra2 = 1'h0;
        wdsel = 1'h0;
        debug = 4'h0;
        if (rst) begin
            D_game_fsm_d = 5'he;
        end else begin
            
            case (D_game_fsm_q)
                5'h0: begin
                    if (start_btn) begin
                        D_game_fsm_d = 5'h1;
                    end else begin
                        D_game_fsm_d = 5'h0;
                    end
                end
                5'h1: begin
                    wdsel = 4'h1;
                    regfile_we = 1'h1;
                    regfile_wa = 5'h10;
                    D_game_fsm_d = 5'h2;
                end
                5'h2: begin
                    wdsel = 4'h2;
                    regfile_we = 1'h1;
                    regfile_wa = 5'h11;
                    D_game_fsm_d = 5'h3;
                end
                5'h3: begin
                    wdsel = 4'h3;
                    regfile_we = 1'h1;
                    regfile_wa = 5'h12;
                    D_game_fsm_d = 5'h4;
                end
                5'h4: begin
                    alufn_signal = 6'h0;
                    bsel = 3'h1;
                    asel = 3'h1;
                    regfile_we = 1'h1;
                    regfile_wa = 3'h4;
                    D_game_fsm_d = 5'h5;
                end
                5'h5: begin
                    wdsel = 4'h4;
                    regfile_we = 1'h1;
                    regfile_wa = 5'h13;
                    D_game_fsm_d = 5'h6;
                end
                5'h6: begin
                    wdsel = 4'h5;
                    regfile_we = 1'h1;
                    regfile_wa = 5'h14;
                    D_game_fsm_d = 5'h7;
                end
                5'h7: begin
                    wdsel = 4'h6;
                    regfile_we = 1'h1;
                    regfile_wa = 5'h15;
                    D_game_fsm_d = 5'h8;
                end
                5'h8: begin
                    alufn_signal = 6'h0;
                    bsel = 3'h1;
                    asel = 3'h1;
                    regfile_we = 1'h1;
                    regfile_wa = 3'h5;
                    D_game_fsm_d = 5'h9;
                end
                5'h9: begin
                    wdsel = 4'h7;
                    regfile_we = 1'h1;
                    regfile_wa = 5'h16;
                    D_game_fsm_d = 5'ha;
                end
                5'ha: begin
                    wdsel = 4'h8;
                    regfile_we = 1'h1;
                    regfile_wa = 5'h17;
                    D_game_fsm_d = 5'hb;
                end
                5'hb: begin
                    wdsel = 4'h9;
                    regfile_we = 1'h1;
                    regfile_wa = 5'h18;
                    D_game_fsm_d = 5'hc;
                end
                5'hc: begin
                    alufn_signal = 6'h0;
                    bsel = 3'h1;
                    asel = 3'h1;
                    regfile_we = 1'h1;
                    regfile_wa = 4'h9;
                    D_game_fsm_d = 5'he;
                end
                5'he: begin
                    if (right_btn) begin
                        D_game_fsm_d = 5'hf;
                    end else begin
                        if (left_btn) begin
                            D_game_fsm_d = 5'h10;
                        end else begin
                            if (redshoot_btn) begin
                                regfile_ra2 = 4'hd;
                                if (~regfile_rd2[1'h0]) begin
                                    D_game_fsm_d = 5'h13;
                                end
                            end else begin
                                if (greenshoot_btn) begin
                                    regfile_ra2 = 4'hd;
                                    if (~regfile_rd2[1'h0]) begin
                                        D_game_fsm_d = 5'h14;
                                    end
                                end else begin
                                    regfile_ra2 = 4'hd;
                                    if (regfile_rd2[1'h0] & M_bullet_slow_clk_edge_out) begin
                                        D_game_fsm_d = 5'h18;
                                    end else begin
                                        D_game_fsm_d = 5'he;
                                    end
                                end
                            end
                        end
                    end
                end
                5'hf: begin
                    alufn_signal = 6'h35;
                    regfile_ra1 = 1'h0;
                    bsel = 3'h2;
                    asel = 3'h0;
                    regfile_we = 1'h1;
                    regfile_wa = 4'hb;
                    D_game_fsm_d = 5'h11;
                end
                5'h10: begin
                    alufn_signal = 6'h35;
                    regfile_ra1 = 1'h0;
                    bsel = 3'h3;
                    asel = 3'h0;
                    regfile_we = 1'h1;
                    regfile_wa = 4'hb;
                    D_game_fsm_d = 5'h12;
                end
                5'h11: begin
                    regfile_ra2 = 4'hb;
                    if (regfile_rd2[1'h0]) begin
                        alufn_signal = 6'h0;
                        regfile_ra1 = 1'h0;
                        bsel = 3'h1;
                        asel = 3'h0;
                        regfile_we = 1'h1;
                        regfile_wa = 1'h0;
                        D_game_fsm_d = 5'he;
                    end else begin
                        D_game_fsm_d = 5'he;
                    end
                end
                5'h12: begin
                    regfile_ra2 = 4'hb;
                    if (~regfile_rd2[1'h0]) begin
                        alufn_signal = 6'h1;
                        regfile_ra1 = 1'h0;
                        bsel = 3'h1;
                        asel = 3'h0;
                        regfile_we = 1'h1;
                        regfile_wa = 1'h0;
                        D_game_fsm_d = 5'he;
                    end else begin
                        D_game_fsm_d = 5'he;
                    end
                end
                5'h13: begin
                    alufn_signal = 6'h0;
                    bsel = 3'h1;
                    asel = 3'h1;
                    regfile_we = 1'h1;
                    regfile_wa = 3'h6;
                    D_game_fsm_d = 5'h16;
                end
                5'h14: begin
                    alufn_signal = 6'h0;
                    bsel = 3'h3;
                    asel = 3'h1;
                    regfile_we = 1'h1;
                    regfile_wa = 3'h6;
                    D_game_fsm_d = 5'h16;
                end
                5'h15: begin
                    alufn_signal = 6'h0;
                    bsel = 3'h5;
                    asel = 3'h1;
                    regfile_we = 1'h1;
                    regfile_wa = 3'h6;
                    D_game_fsm_d = 5'h16;
                end
                5'h16: begin
                    alufn_signal = 6'h0;
                    bsel = 3'h1;
                    asel = 3'h1;
                    regfile_we = 1'h1;
                    regfile_wa = 4'hd;
                    D_game_fsm_d = 5'h17;
                end
                5'h17: begin
                    alufn_signal = 6'h2;
                    regfile_ra1 = 1'h0;
                    bsel = 3'h1;
                    asel = 3'h0;
                    regfile_we = 1'h1;
                    regfile_wa = 3'h7;
                    D_game_fsm_d = 5'he;
                end
                5'h18: begin
                    alufn_signal = 6'h35;
                    regfile_ra1 = 4'h8;
                    bsel = 3'h1;
                    asel = 3'h0;
                    regfile_we = 1'h1;
                    regfile_wa = 4'hb;
                    D_game_fsm_d = 5'h19;
                end
                5'h19: begin
                    regfile_ra2 = 4'hb;
                    if (~regfile_rd2[1'h0]) begin
                        alufn_signal = 6'h1;
                        regfile_ra1 = 4'h8;
                        bsel = 3'h1;
                        asel = 3'h0;
                        regfile_we = 1'h1;
                        regfile_wa = 4'h8;
                        D_game_fsm_d = 5'he;
                    end else begin
                        alufn_signal = 6'h2;
                        bsel = 3'h1;
                        asel = 3'h2;
                        regfile_we = 1'h1;
                        regfile_wa = 4'h8;
                        D_game_fsm_d = 5'h1a;
                    end
                end
                5'h1a: begin
                    alufn_signal = 6'h2;
                    bsel = 3'h1;
                    asel = 3'h1;
                    regfile_we = 1'h1;
                    regfile_wa = 4'hd;
                    D_game_fsm_d = 5'he;
                end
            endcase
        end
    end
    
    
    always @(posedge (clk)) begin
        if ((rst) == 1'b1) begin
            D_game_fsm_q <= 5'h0;
        end else begin
            D_game_fsm_q <= D_game_fsm_d;
        end
    end
endmodule