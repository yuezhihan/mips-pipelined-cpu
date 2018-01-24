`include "ctrl_encode_def.v"
module mips( clk, rst );
	input clk;
	input rst;
	reg IF2IDWr, PCWr, IF2IDRst, ID2EXRst, EX2MEMRst;
	initial begin
		IF2IDWr = 1'b1;
		PCWr = 1'b1;
		IF2IDRst = 1'b0;
		ID2EXRst = 1'b0;
		EX2MEMRst = 1'b0;
	end
	
	IF2ID U_IF2ID(clk,rst,IF2IDRst,IF2IDWr);
	ID2EX U_ID2EX(clk,rst,ID2EXRst,1'b1);
	EX2MEM U_EX2MEM(clk,rst,EX2MEMRst,1'b1);
	MEM2WB U_MEM2WB(clk,rst,1'b1);
	
	wire StopOne;
	
	// IF
	wire [31:2] PC, NewPC;
	wire PCGo = (U_EX2MEM.cBranch && U_EX2MEM.ZERO) || U_EX2MEM.cJump;
	assign U_IF2ID.in_PC = PC + 1;
	
	
	always @(*) // 控制冒险
	begin
		if(PCGo) begin
			/* Debug log: 应该清除的是后两个寄存器，当前周期不必清除 
				NewPC <= U_EX2MEM.PC;
				IF2IDRst <= 1'b1;
			*/
			ID2EXRst <= 1'b1;
			EX2MEMRst <= 1'b1;
		end
		else begin
			/*** Debug log: 注意两个冒险控制单元的冲突 ***/
			if(!StopOne) ID2EXRst <= 1'b0;
			EX2MEMRst <= 1'b0;
		end
	end
	mux2 #(30) U_MUX_PC(U_IF2ID.in_PC, U_EX2MEM.PC, PCGo, NewPC);
	PC U_PC(.clk(clk), .rst(rst), .PCWr(PCWr), .NPC(NewPC), .PC(PC));
	/*** Debug log: NewPC更新较慢，加5ns延时后解决 ***/
	im_4k U_IM(.addr(PC[11:2]), .dout(U_IF2ID.in_instr));
	
	
	
	// ID
	
	assign StopOne = U_ID2EX.cMemRead && (U_ID2EX.Rt == U_IF2ID.instr[25:21] 
					|| U_ID2EX.Rt == U_IF2ID.instr[20:16]);
	always @(*) //阻塞
	begin
		if(StopOne) begin
			IF2IDWr <= 1'b0;
			PCWr <= 1'b0;
			ID2EXRst <= 1'b1;
		end
		else begin
			IF2IDWr <= 1'b1;
			PCWr <= 1'b1;
			/*** Debug log: 注意两个冒险控制单元的冲突 ***/
			if(!PCGo) ID2EXRst <= 1'b0; 
		end
	end
	
	assign U_ID2EX.in_Rs = U_IF2ID.instr[25:21];
	assign U_ID2EX.in_Rt = U_IF2ID.instr[20:16];
	assign U_ID2EX.in_Rd = U_IF2ID.instr[15:11];
	assign U_ID2EX.in_PC = U_IF2ID.PC;
	
	wire [1:0] cExtOp;
	Ctrl U_CTRL(.jump(U_ID2EX.in_cJump), .RegDst(U_ID2EX.in_cRegDst), .Branch(U_ID2EX.in_cBranch)
		, .MemR(U_ID2EX.in_cMemRead), .Mem2R(U_ID2EX.in_cMemtoReg), .MemW(U_ID2EX.in_cMemWrite)
		, .RegW(U_ID2EX.in_cRegWrite), .Alusrc(U_ID2EX.in_cALUSrc), .ExtOp(cExtOp)
		, .Aluctrl(U_ID2EX.in_cALUOp), .OpCode(U_IF2ID.instr[31:26]), .funct(U_IF2ID.instr[5:0]));
	
	wire [31:0] WriteData;
	/*** Debug log: RF要写入的数据不能立刻读取，
					后发现当前周期没有读取到上升沿刚刚更新的数据，
					加入27ns延时后解决 ***/
	RF U_RF(.A1(U_ID2EX.in_Rs), .A2(U_ID2EX.in_Rt), .A3(U_MEM2WB.RegDst), .WD(WriteData), .clk(clk)
		, .RFWr(U_MEM2WB.cRegWrite), .RD1(U_ID2EX.in_RD1), .RD2(U_ID2EX.in_RD2) );
	EXT U_EXT(.Imm16(U_IF2ID.instr[15:0]), .EXTOp(cExtOp), .Imm32(U_ID2EX.in_Imm32));
	
	
	
	// EX
	
	reg [1:0] ForwardA, ForwardB;
	always @(*) //旁路
	begin
		ForwardA = 2'b00;
		ForwardB = 2'b00;
		
		if(U_EX2MEM.cRegWrite && U_EX2MEM.RegDst != 0 && (U_EX2MEM.RegDst == U_ID2EX.Rs))
			ForwardA = 2'b10;
		else if(U_MEM2WB.cRegWrite && U_MEM2WB.RegDst != 0 && (U_MEM2WB.RegDst == U_ID2EX.Rs))
			ForwardA = 2'b01;
		/*** Debug log: 此处有else，因为如果上一条指令和上上条指令都修改了同一个寄存器
						，则以上一条为准 ***/
		if(U_EX2MEM.cRegWrite && U_EX2MEM.RegDst != 0 && (U_EX2MEM.RegDst == U_ID2EX.Rt))
			ForwardB = 2'b10;
		else if(U_MEM2WB.cRegWrite && U_MEM2WB.RegDst != 0 && (U_MEM2WB.RegDst == U_ID2EX.Rt))
			ForwardB = 2'b01;
		
	end
	
	assign U_EX2MEM.in_PC = U_ID2EX.cJump ? U_ID2EX.Imm32 : (U_ID2EX.PC + U_ID2EX.Imm32);
	mux2 #(5) U_MUX_RegDst(U_ID2EX.Rt, U_ID2EX.Rd, U_ID2EX.cRegDst, U_EX2MEM.in_RegDst);
	
	wire [31:0] RD1, RD2;
	mux4 #(32) U_MUX_ALU_1(U_ID2EX.RD1, WriteData, U_EX2MEM.ALUResult, 32'hffffffff, ForwardA, RD1);
	mux4 #(32) U_MUX_ALU_2(U_ID2EX.RD2, WriteData, U_EX2MEM.ALUResult, 32'hffffffff, ForwardB, RD2);
	
	wire [31:0] ALU_B;
	mux2 #(32) U_MUX_ALU(RD2, U_ID2EX.Imm32, U_ID2EX.cALUSrc, ALU_B);
	
	alu U_ALU(.A(RD1), .B(ALU_B), .ALUOp(U_ID2EX.cALUOp)
		, .C(U_EX2MEM.in_ALUResult), .Zero(U_EX2MEM.in_ZERO));
	
	assign U_EX2MEM.in_MemWrite = RD2;
	assign {U_EX2MEM.in_cJump, U_EX2MEM.in_cBranch, U_EX2MEM.in_cMemRead
			, U_EX2MEM.in_cMemtoReg, U_EX2MEM.in_cMemWrite, U_EX2MEM.in_cRegWrite}
			= {U_ID2EX.cJump, U_ID2EX.cBranch, U_ID2EX.cMemRead
			, U_ID2EX.cMemtoReg, U_ID2EX.cMemWrite, U_ID2EX.cRegWrite};
	
	
	// MEM
	dm_4k U_DM_4K(.addr(U_EX2MEM.ALUResult[11:2]), .din(U_EX2MEM.MemWrite)
			, .DMWr(U_EX2MEM.cMemWrite), .clk(clk), .dout(U_MEM2WB.in_RDMem) );
	assign {U_MEM2WB.in_RegDst, U_MEM2WB.in_ALUResult, U_MEM2WB.in_cRegWrite, U_MEM2WB.in_cMemtoReg}
			= {U_EX2MEM.RegDst, U_EX2MEM.ALUResult, U_EX2MEM.cRegWrite, U_EX2MEM.cMemtoReg};
	
	
	// WB
	mux2 #(32) U_MUX_WB(U_MEM2WB.ALUResult, U_MEM2WB.RDMem, U_MEM2WB.cMemtoReg, WriteData);
	
	
endmodule

