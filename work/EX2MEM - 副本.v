module IF2ID (clk, rst, IRWr, iPC, iInstr, oPC, oInstr);
	input clk;
	input rst;
	input IRWr; 
	input [31:0] iPC;
	output reg [31:0] oPC;
	input [31:0] iInstr;
	output reg [31:0] oInstr;
	
	always @(posedge clk or posedge rst)
	begin
		if ( rst )
		begin
			oPC <= 0;
			oInstr <= 0;
		end
		else if (IRWr)
		begin
			oPC <= iPC;
			oInstr <= iInstr;
		end
	end
	
endmodule
