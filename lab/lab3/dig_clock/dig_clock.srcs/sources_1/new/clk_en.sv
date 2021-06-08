`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/23 16:26:35
// Design Name: 
// Module Name: clk_en
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


module clk_en #(parameter N = 25000) (
    input clk,
    input reset,
    output logic clkAfterEn
    );

    logic [31 : 0] r_cnt;

    always_ff@(posedge clk) begin
        if(!reset) r_cnt <= 0;
        else if(r_cnt == N-1) r_cnt <= 0;
        else r_cnt <= r_cnt + 1;
    end

    always_ff@(posedge clk) begin 
        if(!reset) clkAfterEn <= 1'b0;
        else if(r_cnt == N-1) clkAfterEn <= 1'b1;
        else clkAfterEn <= 1'b0;
    end
    
endmodule

