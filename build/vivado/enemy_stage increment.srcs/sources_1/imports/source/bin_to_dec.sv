/*
    This file was generated automatically by Alchitry Labs 2.0.30-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module bin_to_dec #(
        parameter DIGITS = 3'h4,
        parameter LEADING_ZEROS = 1'h0
    ) (
        input wire [($clog2((64'(4'ha) ** (DIGITS))))-1:0] value,
        output reg [(DIGITS)-1:0][3:0] digits
    );
    logic [31:0] R_4d8326eb_j;
    logic [31:0] RR_4d8326eb_j;
    logic [31:0] R_34b04c01_i;
    logic [31:0] RR_34b04c01_i;
    logic [($bits(value))-1:0] L_4cbf38ba_remainder;
    logic L_4cbf38ba_blank;
    logic [($bits(value))-1:0] L_0a9d1438_scale;
    logic [($bits(value))-1:0] L_4e5c121b_sub_value;
    always @* begin
        digits = {DIGITS{{{4'hb}}}};
        L_4cbf38ba_remainder = value;
        L_4cbf38ba_blank = !LEADING_ZEROS;
        if (value < (64'(4'ha) ** (DIGITS))) begin
            for (RR_4d8326eb_j = 0; RR_4d8326eb_j < DIGITS; RR_4d8326eb_j = RR_4d8326eb_j + 1) begin
        R_4d8326eb_j = (DIGITS - 1'h1) + RR_4d8326eb_j * (-2'sh1);
                L_0a9d1438_scale = (64'(4'ha) ** (R_4d8326eb_j));
                if (L_4cbf38ba_remainder < L_0a9d1438_scale) begin
                    if (R_4d8326eb_j != 1'h0 && L_4cbf38ba_blank) begin
                        digits[R_4d8326eb_j] = 4'ha;
                    end else begin
                        digits[R_4d8326eb_j] = 1'h0;
                    end
                end else begin
                    L_4cbf38ba_blank = 1'h0;
                    L_4e5c121b_sub_value = 1'h0;
                    for (RR_34b04c01_i = 0; RR_34b04c01_i < 4'h9; RR_34b04c01_i = RR_34b04c01_i + 1) begin
            R_34b04c01_i = (4'h9) + RR_34b04c01_i * (-2'sh1);
                        if (L_4cbf38ba_remainder < (R_34b04c01_i + 1'h1) * L_0a9d1438_scale) begin
                            digits[R_4d8326eb_j] = R_34b04c01_i;
                            L_4e5c121b_sub_value = R_34b04c01_i * L_0a9d1438_scale;
                        end
                    end
                    L_4cbf38ba_remainder = L_4cbf38ba_remainder - L_4e5c121b_sub_value;
                end
            end
        end
    end
    
    
endmodule