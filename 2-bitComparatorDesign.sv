// Code your design here
`timescale 1ns/1ps

module two_bit_comparator(
    input [1:0] A,
    input [1:0] B,
    output reg A_equal_B,
    output reg A_greater_B,
    output reg B_greater_A
);

    always @(*) begin
        A_equal_B = (A == B);
        A_greater_B = (A > B);
        B_greater_A = (B > A);
    end

endmodule
