`timescale 1ns / 1ps

module dig_clock(
    input                   sys_clk,
    input                   sys_rst_n,
    input                   i_start,
    output logic [3 : 0]    an,
    output logic [7 : 0]    a_to_g
    );
    
    logic clkAfterEn;
    logic work;
    logic [7 : 0]   min, sec, bcd_min, bcd_sec;
    logic [3 : 0]   decimalTime;

    clk_en U0(
        .clk (sys_clk),
        .reset (sys_rst_n),
        .clkAfterEn (clkAfterEn)
    );

    Edge_detection U1(
        .clk (sys_clk),
        .reset (sys_rst_n),
        .i_btn (i_start),
        .pos_edge (work)
    );

    timer U2(
        .clk (sys_clk),
        .reset (sys_rst_n),
        .en (work),
        .min (min),
        .sec (sec)
    );

    bin2bcd_0 U3(
        .bin (min),
        .bcd (bcd_min)
    );

    bin2bcd_0 U4(
        .bin (sec),
        .bcd (bcd_sec)
    );

    scan U5(
        .clk (sys_clk),
        .reset (sys_rst_n),
        .en (clkAfterEn),
        .min (bcd_min),
        .sec (bcd_sec),
        .decimalTime (decimalTime),
        .an (an)
    );

    analyze2a_to_g U6(
        .D (decimalTime),
        .a_to_g (a_to_g)
    );
   
endmodule