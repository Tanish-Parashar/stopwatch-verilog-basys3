module bcd_to_7seg(
    input  [3:0] bcd,       // 4-bit BCD input (0-9)
    output reg [6:0] seg    // {a,b,c,d,e,f,g} - active LOW
);

// For Basys 3: Common Anode → '0' turns ON segment
always @(*) begin
    case (bcd)
        4'd0: seg = 7'b1000000; // 0
        4'd1: seg = 7'b1111001; // 1
        4'd2: seg = 7'b0100100; // 2
        4'd3: seg = 7'b0110000; // 3
        4'd4: seg = 7'b0011001; // 4
        4'd5: seg = 7'b0010010; // 5
        4'd6: seg = 7'b0000010; // 6
        4'd7: seg = 7'b1111000; // 7
        4'd8: seg = 7'b0000000; // 8
        4'd9: seg = 7'b0010000; // 9
        default: seg = 7'b1111111; // All OFF for invalid BCD
    endcase
end

endmodule
