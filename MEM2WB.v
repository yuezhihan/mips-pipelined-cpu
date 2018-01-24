module MEM2WB (clk, rst, IRWr);
	input clk;
	input rst;
	input IRWr;
	
	wire [4:0] in_RegDst;
	wire [31:0] in_ALUResult, in_RDMem;
	wire in_cRegWrite, in_cMemtoReg;
	
	reg [4:0] RegDst;
	reg [31:0] ALUResult, RDMem;
	reg cRegWrite, cMemtoReg;
	
	always @(posedge clk or posedge rst)
	begin
		if ( rst )
			{RegDst, ALUResult, RDMem, cRegWrite, cMemtoReg} = 10000'b0;
		else if(IRWr)
			{RegDst, ALUResult, RDMem, cRegWrite, cMemtoReg}
				= {in_RegDst, in_ALUResult, in_RDMem, in_cRegWrite, in_cMemtoReg};
	end
	
endmodule
