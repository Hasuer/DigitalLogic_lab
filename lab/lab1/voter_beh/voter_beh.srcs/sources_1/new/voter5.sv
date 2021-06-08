`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/12 20:22:19
// Design Name: 
// Module Name: voter5
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


module voter5(
    input [4:0] I, 
    output F
    );
    
    assign F=((I[0]& I[1] &I[2])||(I[0]&I[1]&I[3])||(I[0]&I[1]&I[4])||(I[0]&I[2]&I[3])||
    (I[0]&I[2]&I[4])||
    (I[0]&I[3]&I[4])||
    (I[1]&I[2]&I[3])||
    (I[1]&I[2]&I[4])||
    (I[1]&I[3]&I[4])||
    (I[2]&I[3]&I[4]));
endmodule
