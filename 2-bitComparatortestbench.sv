`timescale 1ns/1ps

module tb_two_bit_comparator;
    reg [1:0] A, B;
    wire A_equal_B, A_greater_B, B_greater_A;
    integer i;

    // Instantiate the two_bit_comparator module
    two_bit_comparator dut(
        .A(A),
        .B(B),
        .A_equal_B(A_equal_B),
        .A_greater_B(A_greater_B),
        .B_greater_A(B_greater_A)
    );

    initial begin
        // Specify the VCD dumpfile name
        $dumpfile("bwt.vcd");

        // Define the scope for the dumped signals
        $dumpvars(1, tb_two_bit_comparator);

        for (i = 0; i < 4; i = i + 1) begin
            A = i;
            B = i + 1;
            #20;
            display_results();
        end

        for (i = 0; i < 4; i = i + 1) begin
            A = i;
            B = i;
            #20;
            display_results();
        end

        for (i = 0; i < 4; i = i + 1) begin
            A = i + 1;
            B = i;
            #20;
            display_results();
        end

        $finish;
    end

    // Display simulation results
    task display_results;
        $display("A=%b, B=%b, A_equal_B=%b, A_greater_B=%b, B_greater_A=%b",
                 A, B, A_equal_B, A_greater_B, B_greater_A);
    endtask

endmodule
