module ID2EX (clk, rst, ID2EXRst, IRWr);
	input clk;
	input rst;
	input IRWr;
	input ID2EXRst;
	
	wire [4:0] in_Rs, in_Rt, in_Rd;
	wire [31:2] in_PC;
	wire [31:0] in_Imm32, in_RD1, in_RD2;
	wire in_cJump, in_cRegDst, in_cBranch, in_cMemRead, in_cMemtoReg, in_cMemWrite, in_cRegWrite, in_cALUSrc;
	wire [1:0] in_cALUOp;
	
	reg [4:0] Rs, Rt, Rd;
	reg [31:2] PC;
	reg [31:0] Imm32, RD1, RD2;
	reg cJump, cRegDst, cBranch, cMemRead, cMemtoReg, cMemWrite, cRegWrite, cALUSrc;
	reg [1:0] cALUOp;
	
	always @(posedge clk or posedge rst)
	begin
		if ( rst || ID2EXRst)
			{Rs, Rt, Rd, PC, Imm32, RD1, RD2
				, cJump, cRegDst, cBranch, cMemRead, cMemtoReg, cMemWrite, cRegWrite, cALUSrc, cALUOp} = 10000'b0;
		else if (IRWr)
			{Rs, Rt, Rd, PC, Imm32, RD1, RD2
				, cJump, cRegDst, cBranch, cMemRead, cMemtoReg, cMemWrite, cRegWrite, cALUSrc, cALUOp}
				= {in_Rs, in_Rt, in_Rd, in_PC, in_Imm32, in_RD1, in_RD2
				, in_cJump, in_cRegDst, in_cBranch, in_cMemRead, in_cMemtoReg, in_cMemWrite, in_cRegWrite, in_cALUSrc, in_cALUOp};
	end
	
endmodule
