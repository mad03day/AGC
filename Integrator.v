module Integrator(clk_8, rst, i_data, o_data);
input clk_8, rst;
input [31:0] i_data;
output [31:0] o_data;

reg [33:0] acc;

always @(negedge rst)
begin
    acc <= 32'd0;
end

always @(posedge clk_8)
begin
    if (i_data > 32'd0)
    begin
        if (acc[33:31] > 2'd0)
        begin
            acc = 32'hFFFFFFFF;
        end
        else
        begin
            acc = acc + i_data;
        end
    end
end

assign o_data = acc;

endmodule