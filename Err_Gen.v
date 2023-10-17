module Err_gen(clk_8, rst, i_data, threshold, o_data);
input clk_8, rst;
input [14:0] i_data;
input [7:0] threshold;
output [14:0] o_data;

reg [14:0] err;

always @(negedge rst)
begin
    err <= 15'd0;
end

always @(posedge clk_8)
begin
    err = {threshold, 6'd0} - i_data;
end

assign o_data = err;

endmodule