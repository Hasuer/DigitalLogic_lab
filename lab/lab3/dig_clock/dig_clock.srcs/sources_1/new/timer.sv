`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/23 19:10:19
// Design Name: 
// Module Name: timer
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
//`define MAX_CNT 60;

module timer #(parameter MAX_SEC = 59, MAX_MIN = 59, MAX_COUNT = 25000000) (
    input clk, 
    input reset,
    input en,
    output logic [7:0] min,
    output logic [7:0] sec
    );
    
    logic [31 : 0] r_cnt;
    logic state;
   
    always_ff@(posedge clk) begin 
        if(!reset) state = 1'b0;
        else if(en) state = ~state;
    end

    always_ff@(posedge clk) begin
        // reset 
        if(!reset) begin
            min = 8'd0;
            sec = 8'd0;
        end

        // timing
        else if(state) begin 
            if (r_cnt < MAX_COUNT - 1) r_cnt <= r_cnt + 1;
            else if(r_cnt == MAX_COUNT - 1) begin  
                r_cnt <= 0;
                if(sec == MAX_SEC) begin 
                    sec <= 0;
                    min <= min + 1;
                end
                else if(sec < MAX_SEC) sec <= sec + 1;
                else if(min == MAX_MIN) min <= 0;
            end
        end

        else if(!state) begin
            min <= min;
            sec <= sec;
        end
    end

endmodule
