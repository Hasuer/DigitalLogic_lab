`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/23 15:17:12
// Design Name: 
// Module Name: Edge_detection
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


module Edge_detection (
    input clk,
    input reset,
    input i_btn,
    output logic pos_edge
    );

    logic q1;
    logic q2;
    always_ff@(posedge clk)
        if(reset) begin 
            q1 <= i_btn;
            q2 <= q1;
        end
        else if(!reset) begin 
            q1 <= 0;
            q2 <= 0;
        end

    assign start_flag = (~q2) & q1;
endmodule

