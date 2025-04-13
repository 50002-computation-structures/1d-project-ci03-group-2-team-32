/*
    This file was generated automatically by Alchitry Labs 2.0.30-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module enemy_rom #(
        parameter COLUMN_DIMENSION = 16'h10,
        parameter ROW_DIMENSION = 16'h10
    ) (
        input wire [2:0] enemy_stage_pointer_out,
        output reg [31:0] enemy_A_romdata_out,
        output reg [31:0] enemy_B_romdata_out,
        output reg [31:0] enemy_C_romdata_out
    );
    localparam logic [7:0][2:0][3:0] ENEMY_WAVES_X = {{{{4'h2, 4'h7, 4'hc}}, {{4'h1, 4'h8, 4'he}}, {{4'h3, 4'h9, 4'hd}}, {{4'h4, 4'h7, 4'ha}}, {{4'h2, 4'h6, 4'hc}}, {{4'h4, 4'h6, 4'h8}}, {{4'h2, 4'h5, 4'h9}}, {{4'h3, 4'h8, 4'hd}}}};
    localparam logic [7:0][2:0][3:0] ENEMY_WAVES_Y = {{{{4'h3, 4'h3, 4'h3}}, {{4'h7, 4'h6, 4'h8}}, {{4'h8, 4'h5, 4'h6}}, {{4'h6, 4'h9, 4'h5}}, {{4'h2, 4'h5, 4'h6}}, {{4'h6, 4'h2, 4'h4}}, {{4'h3, 4'h6, 4'h3}}, {{4'h9, 4'h7, 4'h3}}}};
    localparam logic [7:0][2:0][1:0] ENEMY_COLOR = {{{{2'h1, 2'h2, 2'h1}}, {{2'h2, 2'h1, 2'h2}}, {{2'h2, 2'h2, 2'h1}}, {{2'h1, 2'h2, 2'h1}}, {{2'h2, 2'h1, 2'h2}}, {{2'h1, 2'h2, 2'h1}}, {{2'h2, 2'h1, 2'h2}}, {{2'h2, 2'h2, 2'h1}}}};
    always @* begin
        enemy_A_romdata_out = {8'h0, (4'h8)'(ENEMY_WAVES_X[enemy_stage_pointer_out][1'h0]), (4'h8)'(ENEMY_WAVES_Y[enemy_stage_pointer_out][1'h0]), (4'h8)'(ENEMY_COLOR[enemy_stage_pointer_out][1'h0])};
        enemy_B_romdata_out = {8'h0, (4'h8)'(ENEMY_WAVES_X[enemy_stage_pointer_out][1'h1]), (4'h8)'(ENEMY_WAVES_Y[enemy_stage_pointer_out][1'h1]), (4'h8)'(ENEMY_COLOR[enemy_stage_pointer_out][1'h1])};
        enemy_C_romdata_out = {8'h0, (4'h8)'(ENEMY_WAVES_X[enemy_stage_pointer_out][2'h2]), (4'h8)'(ENEMY_WAVES_Y[enemy_stage_pointer_out][2'h2]), (4'h8)'(ENEMY_COLOR[enemy_stage_pointer_out][2'h2])};
    end
    
    
endmodule