`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/26 23:33:24
// Design Name: 
// Module Name: turnonLED
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

module turnonLED(
    input  CLK,
    input  RST,
    input  SW,
    output reg LED
    );
    always @( posedge CLK ) begin
        if ( RST )
            LED = 1'b0;
        else begin
            if ( SW )
                LED = 1'b1;
            else
                LED = 1'b0;
        end
    end

endmodule
