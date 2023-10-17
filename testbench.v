`timescale 1ns / 1ns
module testbench;

parameter PERIOD = 10;
parameter TIME_CYCLES = 500000000; // time in clocks
parameter SIMULATED_CYCLES = 100000;    // time in clocks for generation new value

parameter THRESHOLD = 8'b10000000;  // 0.5
parameter MANTISSA = 8'd0;          // 0
parameter EXP = 4'd10;              // 10

reg clk, rst, clk_8;
reg [11:0]sample_i = 12'h000;
reg [11:0]sample_q = 12'h800;

AGC agc(.clk(clk), .rst(rst), .clk_8(clk_8),.sample_i(sample_i), .sample_q(sample_q), .threshold(THRESHOLD), .mantissa(MANTISSA), .exp(EXP));

initial begin
    rst = 1;
    #40 rst = 0;
end

initial begin
    forever #(PERIOD * SIMULATED_CYCLES)
    begin
        sample_i = $random;
        sample_q = $random;
    end
end

initial begin
    clk <= 1;
    forever #(PERIOD/2) clk = ~clk;
end

initial begin 
    clk_8 <= 0;
    forever #(PERIOD * 4) 
    begin
        clk_8 = ~clk_8;
    end
end

initial begin
#(TIME_CYCLES * PERIOD) $finish;
end

endmodule