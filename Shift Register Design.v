module shift_register (
    input clk,
    input reset,
    input shift_left,
    input shift_right,
    input [3:0] data_in,
    input serial_in,
    output reg [3:0] data_out
);

always @(posedge clk or posedge reset) begin
    if (reset)
        data_out <= 4'b0000;

    else if (shift_left)
        data_out <= {data_out[2:0], serial_in};

    else if (shift_right)
        data_out <= {serial_in, data_out[3:1]};

    else
        data_out <= data_in;
end

endmodule