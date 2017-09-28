`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/09/19 22:37:15
// Design Name: 
// Module Name: decode7seg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module decode7seg(
    input            CLK,
    input            RST,
    input      [3:0] HEX,
    output reg [6:0] SEG
    );

    always @( posedge CLK ) begin
        if ( RST )
            SEG = 7'b1111111;
        else begin
            case ( HEX[3:0] )
                4'h0: SEG = 7'b1000000; 4'h1: SEG = 7'b1111001; 4'h2: SEG = 7'b0100100;
                4'h3: SEG = 7'b0110000; 4'h4: SEG = 7'b0011001; 4'h5: SEG = 7'b0010010;
                4'h6: SEG = 7'b0000010; 4'h7: SEG = 7'b1111000; 4'h8: SEG = 7'b0000000;
                4'h9: SEG = 7'b0010000; 4'hA: SEG = 7'b0001000; 4'hB: SEG = 7'b0000011;
                4'hC: SEG = 7'b0100111; 4'hD: SEG = 7'b0100001; 4'hE: SEG = 7'b0000110;
                4'hF: SEG = 7'b0001110; default: SEG = 7'b1111111;
            endcase
        end
    end
endmodule
