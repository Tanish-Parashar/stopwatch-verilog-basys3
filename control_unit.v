`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2025 03:40:33
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    input start,
    input stop,
    input reset,
    input clk,
    output reg enable_count,
    output reg reset_count
    );
    
    always@(posedge clk)
    begin
     if (reset)
     begin
      enable_count <= 0;
      reset_count <= 1;
     end
     else
     begin
      if (start == 1 && stop == 0)
      begin
       reset_count <= 0;
       enable_count<=1;
      end
      else
      begin
       reset_count <= 0;
       enable_count<=0;
      end
     end
    end
    
endmodule
