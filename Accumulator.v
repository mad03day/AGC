module Accumulator(i_clk, i_rst, i_clk_8, i_num, o_num);
input i_clk, i_rst, i_clk_8;
input [11:0] i_num;
output reg [14:0] o_num;

reg [14:0] temp;
reg [2:0] iterator;

always @(negedge i_rst)
begin
    temp <= 15'd0;
    iterator <= 15'd0;
    o_num <= 15'd0;
end

always @(posedge i_clk)
begin
    begin
        temp = temp + i_num;
        $display("In_ACC: %f", i_num * 2.0 ** -11.0);
        iterator = iterator + 1'd1;
    end
end

always @(posedge i_clk_8)
begin
    o_num = temp;
    $display("Out_ACC: %f", o_num * 2.0 ** -14.0);
    temp = 15'd0;
    iterator = 3'd0;
end

endmodule