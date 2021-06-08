`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/12 15:48:03
// Design Name: 
// Module Name: votor5
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

module votor5(
input [4:0] vote,
output logic pass
    );
    logic [3:0] temp;
    logic [7:0]y1;
    logic [7:0]y2;
    logic [7:0]y3;
    logic [7:0]y4;
    Two2Four center({vote[3],vote[4]},0,temp);
    Three2Eight p1 (vote[2:0],{1'b1,1'b0,temp[0]},y1);
    Three2Eight p2 (vote[2:0],{1'b1,1'b0,temp[1]},y2);
    Three2Eight p3 (vote[2:0],{1'b1,1'b0,temp[2]},y3);
    Three2Eight p4 (vote[2:0],{1'b1,1'b0,temp[3]},y4);
    assign pass = ~(y1[7] & y2[3] & y2[5] & y2[6] & y2[7] & y3[3] & y3[5] & y3[6] & y3[7] & y4[1]
    & y4[2] & y4[3] & y4[4] & y4[5] & y4[6] & y4[7]);
endmodule