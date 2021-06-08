`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/26 19:46:02
// Design Name: 
// Module Name: alu
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


module alu(
input [3 : 0] A,
input [3 : 0] B,
input [3 : 0] aluop,
output logic [7 : 0] alures,
output logic ZF,
output logic OF
);
logic [3:0] addalures;   
logic [3:0] a;
logic [3:0] b;
rca muxadd(.A(A),.B(B),.Cin(1'b0),.Cout(),.S(addalures));

always_comb begin
    OF = 1'b0; 
    ZF = 1'b0;
    alures[7:4] = 4'b0000;
    case(aluop)
    4'b0000: alures[3:0] = A & B;
    4'b0001: alures[3:0] = A | B;
    4'b0010: alures[3:0] = A ^ B;
    4'b0011: alures[3:0] = ~(A & B); 
    4'b0100: alures[3:0] = ~A;
    4'b0101: alures[3:0] = A << B[2:0];  
    4'b0110: alures[3:0] = A >> B[2:0];
    4'b0111: alures[3:0] = A >>> B[2:0];
    4'b1000: alures = A * B;

    4'b1001: begin
        logic [7:0] temp1;
        logic [7:0] temp2;
        logic [15:0] temp3;
        temp1 = {A >>> 3 ,A[3:0]};
        temp2 = {B >>> 3 ,B[3:0]};
        temp3 = temp1 * temp2;
        alures= temp3 [7:0];
    end
    
    4'b1010: begin
        a = A;b = B;
        if(A[3] ^ B[3] == 1)
            OF=1'b0;
        else if(A[3] == 1 && addalures[3]==0)
            OF=1'b1;
        else if(A[3] == 0 && addalures[3]==1)
            OF=1'b1;
        alures[3:0]=addalures;
    end
    
    4'b1011: begin
        a = A;b = B;
        alures[3:0]=addalures[3:0];
    end
    
    4'b1100: begin
        a = A;b = ~B + 1;
        if(A[3] ^ B[3] == 1)
            OF=1'b0;
        else if(A[3] == 1 && addalures[3]==0)
            OF=1'b1;
        else if(A[3] == 0 && addalures[3]==1)
            OF=1'b1;
        alures[3:0]=addalures;
    end
    
    4'b1101: begin
        a = A;b = ~B + 1;
        alures[3:0]=addalures[3:0];
    end
    
    4'b1110: begin
        if (A[3] & B[3]) alures[3:0] = ((~B + 1) < (~A + 1));
            else if (B[3]) alures[3:0] = 0;
            else if (A[3]) alures[3:0] = 1;
            else alures[3:0] = (A < B);
    end
    
    4'b1111: alures[3:0] = (A < B);
    endcase
end
endmodule
