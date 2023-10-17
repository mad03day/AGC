module AGC(clk, rst, clk_8, sample_i, sample_q, threshold, mantissa, exp, out);

input clk, rst, clk_8;
input [11:0] sample_i;
input [11:0] sample_q;
input [7:0] threshold;
input [7:0] mantissa;
input [3:0] exp;
output [7:0] out;

wire [11:0] out_env;
wire [14:0] out_acc;
wire [14:0] error;
wire [31:0] float;
wire [31:0] o_integrator;

Env_Approx envelope_approximation (clk, rst, sample_i, sample_q, out_env);

Accumulator ACC (clk, rst, clk_8, out_env, out_acc);

Err_gen Err (clk_8, rst, out_acc, threshold, error);

Float_emm float_emulation (clk_8, rst, error, mantissa, exp, float);

Integrator ACC_Int (clk_8, rst, float, o_integrator);

assign out = o_integrator[31:23];

endmodule