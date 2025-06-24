`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.06.2025 03:25:19
// Design Name: 
// Module Name: time_counter
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


module time_counter(
    input reset,
    input enable,
    input clk1hz,
    output reg [5:0] sec,
    output reg [5:0] min
    );
    
     always @(posedge clk1hz) begin
        if (reset) begin
            sec <= 0;
            min <= 0;
        end
        else if (enable) begin
            if (sec == 59) begin
                sec <= 0;
                min <= min + 1;
            end else begin
                sec <= sec + 1;
            end
        end
        // else: if not enabled, hold the current value
    end


















endmodule
