module EX2MEM (clk, rst, EX2MEMRst, IRWr);
	input clk;
	input rst;
	input EX2MEMRst;
	input IRWr;
	
	wire [31:2] in_PC;
	wire [4:0] in_RegDst;
	wire [31:0] in_ALUResult, in_MemWrite;
	wire in_ZERO, in_cJump, in_cBranch, in_cMemRead, in_cMemtoReg, in_cMemWrite, in_cRegWrite;
	
	reg [31:2] PC;
	reg [4:0] RegDst;
	reg [31:0] ALUResult, MemWrite;
	reg ZERO, cJump, cBranch, cMemRead, cMemtoReg, cMemWrite, cRegWrite;
	
	always @(posedge clk or posedge rst)
	begin
		if ( rst || EX2MEMRst)
			{PC, RegDst, ALUResult, MemWrite, ZERO, cJump, cBranch, cMemRead, cMemtoReg, cMemWrite, cRegWrite} = 10000'b0;
		else if(IRWr)
			{PC, RegDst, ALUResult, MemWrite, ZERO, cJump, cBranch, cMemRead, cMemtoReg, cMemWrite, cRegWrite}
				= {in_PC, in_RegDst, in_ALUResult, in_MemWrite, in_ZERO, in_cJump
					, in_cBranch, in_cMemRead, in_cMemtoReg, in_cMemWrite, in_cRegWrite};
	end
endmodule
