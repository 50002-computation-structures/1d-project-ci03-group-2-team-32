/*
    This file was generated automatically by Alchitry Labs 2.0.30-BETA.
    Do not edit this file directly. Instead edit the original Lucid source.
    This is a temporary file and any changes made to it will be destroyed.
*/

module index_reverser #(
        parameter SIZE = 4'h8,
        parameter COLUMN_DIMENSION = 4'h8
    ) (
        input wire [(SIZE)-1:0] input_address,
        output reg [(SIZE)-1:0] output_address
    );
    localparam ODD_BIT_INDEX = $clog2(COLUMN_DIMENSION);
    localparam MASK = ODD_BIT_INDEX - 1'h1;
    localparam MSB_INDEX = SIZE - 1'h1;
    always @* begin
        if (input_address[ODD_BIT_INDEX]) begin
            output_address = {input_address[MSB_INDEX:ODD_BIT_INDEX], input_address[MASK:1'h0] ^ {ODD_BIT_INDEX{1'h1}}};
        end else begin
            output_address = input_address;
        end
    end
    
    
endmodule