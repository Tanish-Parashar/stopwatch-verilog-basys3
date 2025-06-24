module top(
    input clk,             // 100 MHz clock
    input [2:0] sw,        // sw[0] = start, sw[1] = stop, sw[2] = reset
    output [3:0] an,       // 7-segment digit select
    output [6:0] seg       // 7-segment segment output
);

// Internal wires
wire clk1hz;
wire [5:0] sec, min;
wire enable_count, reset_count;
wire [6:0] seg_out;
reg [3:0] bcd_input;
reg [3:0] digit;
reg [15:0] refresh_counter = 0;
reg [1:0] digit_sel;

// === Instantiate Clock Divider ===
clk_divider uut0 (
    .clk(clk),
    .clk1hz(clk1hz)
);

// === Instantiate Control Unit ===
control_unit uut1 (
    .clk(clk),
    .start(sw[0]),
    .stop(sw[1]),
    .reset(sw[2]),
    .enable_count(enable_count),
    .reset_count(reset_count)
);

// === Instantiate Time Counter ===
time_counter uut2 (
    .clk1hz(clk1hz),
    .reset(reset_count),
    .enable(enable_count),
    .sec(sec),
    .min(min)
);

// === Multiplexing logic for 7-segment display ===
always @(posedge clk) begin
    refresh_counter <= refresh_counter + 1;
    digit_sel <= refresh_counter[15:14];  // 2-bit selector for 4 digits
end

always @(*) begin
    case (digit_sel)
        2'b00: begin
            bcd_input = sec % 10;
            digit = 4'b1110;  // AN0 (rightmost)
        end
        2'b01: begin
            bcd_input = sec / 10;
            digit = 4'b1101;  // AN1
        end
        2'b10: begin
            bcd_input = min % 10;
            digit = 4'b1011;  // AN2
        end
        2'b11: begin
            bcd_input = min / 10;
            digit = 4'b0111;  // AN3 (leftmost)
        end
    endcase
end

// === Instantiate BCD to 7-segment converter (Basys 3: active low) ===
bcd_to_7seg uut3 (
    .bcd(bcd_input),
    .seg(seg_out)
);

// === Connect outputs ===
assign seg = seg_out;
assign an = digit;

endmodule
