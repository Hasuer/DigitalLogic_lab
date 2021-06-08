`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/12 14:38:25
// Design Name: 
// Module Name: Three2Eight
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


module Three2Eight(
    input 		      [2 : 0]	D,
	input  [2:0] G,
	output	logic     [7 : 0]	Y
    );
    
   always @(*) begin
   if(G == 3'b100)
    case(D)
        3'b000: Y = 8'b11111110;
        3'b001: Y = 8'b11111101;
        3'b010: Y = 8'b11111011;
        3'b011: Y = 8'b11110111;
        3'b100: Y = 8'b11101111;
        3'b101: Y = 8'b11011111;
        3'b110: Y = 8'b10111111;
        3'b111: Y = 8'b01111111;
    endcase   
   else
        Y = 8'b11111111;
   end
endmodule
