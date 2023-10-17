module Float_emm(clk_8, rst, i_data, mantissa, exp, o_data);
input clk_8, rst;
input [14:0] i_data;
input [7:0] mantissa;
input [3:0] exp;
output [31:0] o_data;

reg [31:0] float;

always @(negedge rst)
begin
    float <= 32'd0;
end

always @(posedge clk_8)
begin
    float = (i_data * (1'd1 + mantissa)) >> (1 + exp);
end

assign o_data = float;

endmodule