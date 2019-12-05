`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2019 12:24:55 PM
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
 output [1:0] led,
 input clk,
 input btnC
 );
reg [1:0] state;
wire halfsec_elapsed;
halfsec timer(halfsec_elapsed, clk, btnC);
always @(posedge clk)
 begin
 if (btnC == 1) state <= 0;
 else if (halfsec_elapsed == 1) state <= state+1;
 end
assign led = state;
endmodule
