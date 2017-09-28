`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 2017/09/12 22:20:16
// Design Name: 
// Module Name: bin2hex
// Project Name: 
//////////////////////////////////////////////////////////////////////////////////

module bin2hex(
    input              CLK,
    input              RST,
    input      [15:0]  SW,
    output reg  [6:0]  SEG,
    output reg  [3:0]  AN
    );

    reg [15:0] counter;
    always @( posedge CLK ) begin
        if ( RST )
            counter <= 16'h0;
        else
            counter <= counter + 1'h1;
    end

    wire period = (counter==16'hFFFF);
    reg [1:0] switch;
    always @( posedge CLK ) begin
        if ( RST )
            switch <= 2'h0;
        else if ( period )
            switch <= switch + 1'h1;
    end

    wire [6:0] SEG1, SEG2, SEG3, SEG4; 
    decode7seg dec1 ( .CLK(CLK), .RST(RST), .HEX(SW[ 3: 0]), .SEG(SEG1[6:0]) );
    decode7seg dec2 ( .CLK(CLK), .RST(RST), .HEX(SW[ 7: 4]), .SEG(SEG2[6:0]) );
    decode7seg dec3 ( .CLK(CLK), .RST(RST), .HEX(SW[11: 8]), .SEG(SEG3[6:0]) );
    decode7seg dec4 ( .CLK(CLK), .RST(RST), .HEX(SW[15:12]), .SEG(SEG4[6:0]) );
    always @* begin
        case ( switch )
            2'b00: begin SEG = SEG1; AN = 4'b1110; end
            2'b01: begin SEG = SEG2; AN = 4'b1101; end
            2'b10: begin SEG = SEG3; AN = 4'b1011; end
            2'b11: begin SEG = SEG4; AN = 4'b0111; end
            default: begin SEG = 7'b11111111; AN = 4'b1111; end
        endcase
    end
endmodule
