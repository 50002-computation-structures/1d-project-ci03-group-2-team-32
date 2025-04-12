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
    logic [31:0] R_5a66b26c_j;
    logic [31:0] RR_5a66b26c_j;
    logic [31:0] R_49cf0c02_i;
    logic [31:0] RR_49cf0c02_i;
    logic [($bits(value))-1:0] L_5c7caa0f_remainder;
    logic L_5c7caa0f_blank;
    logic [($bits(value))-1:0] L_419ac44f_scale;
    logic [($bits(value))-1:0] L_50ceaeeb_sub_value;
    always @* begin
        digits = {DIGITS{{{4'hb}}}};
        L_5c7caa0f_remainder = value;
        L_5c7caa0f_blank = !LEADING_ZEROS;
        if (value < (64'(4'ha) ** (DIGITS))) begin
            for (RR_5a66b26c_j = 0; RR_5a66b26c_j < DIGITS; RR_5a66b26c_j = RR_5a66b26c_j + 1) begin
        R_5a66b26c_j = (DIGITS - 1'h1) + RR_5a66b26c_j * (-2'sh1);
                L_419ac44f_scale = (64'(4'ha) ** (R_5a66b26c_j));
                if (L_5c7caa0f_remainder < L_419ac44f_scale) begin
                    if (R_5a66b26c_j != 1'h0 && L_5c7caa0f_blank) begin
                        digits[R_5a66b26c_j] = 4'ha;
                    end else begin
                        digits[R_5a66b26c_j] = 1'h0;
                    end
                end else begin
                    L_5c7caa0f_blank = 1'h0;
                    L_50ceaeeb_sub_value = 1'h0;
                    for (RR_49cf0c02_i = 0; RR_49cf0c02_i < 4'h9; RR_49cf0c02_i = RR_49cf0c02_i + 1) begin
            R_49cf0c02_i = (4'h9) + RR_49cf0c02_i * (-2'sh1);
                        if (L_5c7caa0f_remainder < (R_49cf0c02_i + 1'h1) * L_419ac44f_scale) begin
                            digits[R_5a66b26c_j] = R_49cf0c02_i;
                            L_50ceaeeb_sub_value = R_49cf0c02_i * L_419ac44f_scale;
                        end
                    end
                    L_5c7caa0f_remainder = L_5c7caa0f_remainder - L_50ceaeeb_sub_value;
                end
            end
        end
    end
    
    
endmodule