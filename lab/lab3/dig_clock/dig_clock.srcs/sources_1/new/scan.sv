`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/24 19:00:01
// Design Name: 
// Module Name: scan
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


module scan(
   input clk,
   input reset,
   input en,
   input [7 : 0] min,
   input [7 : 0] sec,
   output logic [3 : 0] decimalTime,
   output logic [3 : 0] an
   );

   always_ff@(posedge clk)
       if(!reset) 
        an <= 4'd1;
       else if(reset && en) 
        an <= {an[2 : 0], an[3]};

   
    always@(*) begin 
        if(an == 1) 
            decimalTime = sec[3 : 0];
        else if(an == 2) 
            decimalTime = sec[7 : 4];
        else if(an == 4) 
            decimalTime = min[3 : 0];
        else if(an == 8) 
            decimalTime = min[7 : 4];
    end


endmodule
