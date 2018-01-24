module IF2ID (clk, rst, IF2IDRst, IRWr);
	input clk;
	input rst;
	input IRWr;
	input IF2IDRst;
	wire [31:2] in_PC;
	wire [31:0] in_instr;
	reg [31:2] PC;
	reg [31:0] instr;
	
	always @(posedge clk or posedge rst)
	begin
		if ( rst || IF2IDRst)
			{PC, instr} = 10000'b0;
		else if (IRWr)
			{PC, instr} = {in_PC,in_instr};
	end
endmodule
