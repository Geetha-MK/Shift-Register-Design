module testbench;

reg clk, reset, shift_left, shift_right, serial_in;
reg [3:0] data_in;
wire [3:0] data_out;

shift_register uut (
    clk, reset, shift_left, shift_right,
    data_in, serial_in, data_out
);

// Clock generation
always #5 clk = ~clk;

// Dump for waveform
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, testbench);
end

initial begin
    clk = 0;
    reset = 1;
    shift_left = 0;
    shift_right = 0;

    #10 reset = 0;

    // Parallel load
    data_in = 4'b1011;
    #10;

    // Shift right
    shift_right = 1; serial_in = 0;
    #10 shift_right = 0;

    // Shift left
    shift_left = 1; serial_in = 1;
    #10 shift_left = 0;

    #50 $finish;
end

endmodule