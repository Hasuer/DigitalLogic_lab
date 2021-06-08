`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/26 19:45:41
// Design Name: 
// Module Name: rca
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


module rca(
input logic [3:0]A,B,input logic Cin,
output logic Cout,output logic [3:0]S
    );
    logic [2:0]C;   
    fulladder mux0(.Cin(Cin),.A(A[0]),.B(B[0]),.Cout(C[0]),.S(S[0]));
    fulladder mux1(.Cin(C[0]),.A(A[1]),.B(B[1]),.Cout(C[1]),.S(S[1]));
    fulladder mux2(.Cin(C[1]),.A(A[2]),.B(B[2]),.Cout(C[2]),.S(S[2]));
    fulladder mux3(.Cin(C[2]),.A(A[3]),.B(B[3]),.Cout(Cout),.S(S[3]));

endmodule
