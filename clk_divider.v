`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2025 03:32:03
// Design Name: 
// Module Name: clk_divider
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


module clk_divider(
    input clk,
    output reg clk1hz =0
    );
    reg [31:0] count;
   // clk1hz <= 1"b0;
    always@(posedge clk)
    begin
     if (count < 50000000)
     begin
      count <= count +1;
     end
     else
     begin 
      clk1hz <= ~clk1hz;
      count <= 0;
     end
    end
endmodule
