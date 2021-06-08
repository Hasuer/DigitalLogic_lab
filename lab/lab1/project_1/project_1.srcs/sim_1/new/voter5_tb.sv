`timescale 1ns / 1ps
module voter5_tb(  );
   logic    [4 : 0]	I;
  logic     pass ;
  
  integer i;
  
  voter5 DUT(I, pass);
  
  initial begin
        for(i=0; i<32;i=i+1)begin
             I=i;
             #20;
        end
  
  end
  
  initial begin
  $timeformat(-9,0,"ns",5);
  $monitor("At %t : I = %b, pass = %b",$time,I, pass);
  end
  
endmodule