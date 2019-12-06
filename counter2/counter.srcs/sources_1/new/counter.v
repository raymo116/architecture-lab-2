`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2019 08:15:55 PM
// Design Name: 
// Module Name: counter
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


module counter(
    input clk_fpga,
    input reset,
    output [6:0] seg,
    output [3:0] an,
    output led
    );
   
    parameter MAX_COUNT = 100_000_000-1;
    wire   counter_en;
    reg [26:0] counter_100M;
    reg [3:0]  counter_10;
   
    assign an=4'b1110;
   
    display disp_1 (.digit(counter_10), .seven_seg(seg));
   
    always @(posedge clk_fpga, posedge reset)
   
       if (reset)
            counter_100M <= 0;
       else if (counter_100M == MAX_COUNT)
            counter_100M <= 0;
       else
            counter_100M = counter_100M +1'b 1 ;
   
    assign counter_en=(counter_100M==0);
   
    always@(posedge clk_fpga, posedge reset)
       if (reset)
         counter_10 <= 0;
       else if (counter_en)
         if (counter_10  == 9)
         counter_10 <= 0;
         else
         counter_10 <= counter_10 +1;
       
    assign led = (counter_10 ==9)   ;
endmodule
