module Env_Approx(i_clk, i_rst, sample_i, sample_q, out);   // sample_i & sample_q is fixed-point num | i_clk -- clock on 100MHz frequency
input i_clk, i_rst;
input [11:0] sample_i;
input [11:0] sample_q;
output reg [11:0] out;

reg [11:0] temp_sample_i;
reg [11:0] temp_sample_q;

always @(negedge i_rst)
begin
    temp_sample_i <= 12'd0;
    temp_sample_q <= 12'd0;
    out <= 12'd0;
end

always @(posedge i_clk)
begin
    if (sample_i[11] == 1'b1)
    begin 
        temp_sample_i = sample_i ^ 12'hFFF;
        temp_sample_i = temp_sample_i + 1;
    end
    else
    begin
        temp_sample_i <= sample_i;
    end
    if (sample_q[11] == 1'b1)
    begin
        temp_sample_q = sample_q ^ 12'hFFF;
        temp_sample_q = temp_sample_q + 1;
    end
    else
    begin
        temp_sample_q <= sample_q;
    end
    if(temp_sample_i > temp_sample_q)
    begin
        out <= temp_sample_i + (0.375 * temp_sample_q);
    end
    else
    begin
        out <= temp_sample_q + (0.375 * temp_sample_i);
    end
end



endmodule