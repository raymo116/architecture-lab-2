`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2019 12:24:55 PM
// Design Name: 
// Module Name: halfsecv
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


// Timer that indicates a half-second duration
module halfsec(
 output Y,
 input clock,
 input reset
 );
reg elapsed; // indicates that half second elapsed
// State of the timer. Must be able to have more than 25 million values
// So we choose it to have 26 bits. 26 bits is a bit of an overkill but it'll work.
reg [25:0] state;
always @(posedge clock)
 if (reset == 1) state <= 0;
else if (state == 25000000) state <= 0;
else state <= state + 1;
always @(state)
 if (state == 25000000) elapsed = 1;
else elapsed = 0;
assign Y = elapsed;
endmodule
