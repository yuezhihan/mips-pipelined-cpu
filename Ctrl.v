`include "instruction_def.v"
`include "ctrl_encode_def.v"

module Ctrl(jump,RegDst,Branch,MemR,Mem2R,MemW,RegW,Alusrc,ExtOp,Aluctrl,OpCode,funct);
	
	input [5:0]		OpCode;				//指令操作码字段
	input [5:0]		funct;				//指令功能字段

	output reg jump;						//指令跳转
	output reg RegDst;						
	output reg Branch;						//分支
	output reg MemR;						//读存储器
	output reg Mem2R;						//数据存储器到寄存器堆
	output reg MemW;						//写数据存储器
	output reg RegW;						//寄存器堆写入数据
	output reg Alusrc;						//运算器操作数选择
	output reg [1:0] ExtOp;						//位扩展/符号扩展选择
	output reg [1:0] Aluctrl;						//Alu运算选择
	
	always@(OpCode or funct)
	begin
		case(OpCode)
			`INSTR_RTYPE_OP:
			begin
				jump = 0;
				RegDst = 1;
				Branch = 0;
				MemR = 0;
				Mem2R = 0;
				MemW = 0;
				RegW = 1;
				Alusrc = 0;
				ExtOp = `EXT_ZERO;
				case(funct)
					`INSTR_ADDU_FUNCT:
						Aluctrl = `ALUOp_ADDU;
					`INSTR_SUBU_FUNCT:
						Aluctrl = `ALUOp_SUBU;
					default:;
				endcase
			end
			
			`INSTR_ORI_OP:
			begin
				jump = 0;
				RegDst = 0;
				Branch = 0;
				MemR = 0;
				Mem2R = 0;
				MemW = 0;
				RegW = 1;
				Alusrc = 1;
				ExtOp = `EXT_SIGNED;
				Aluctrl = `ALUOp_OR;
			end
			
			`INSTR_LW_OP:
			begin
				jump = 0;
				RegDst = 0;
				Branch = 0;
				MemR = 1;
				Mem2R = 1;
				MemW = 0;
				RegW = 1;
				Alusrc = 1;
				ExtOp = `EXT_SIGNED;
				Aluctrl = `ALUOp_ADDU;
			end
			
			`INSTR_SW_OP:
			begin
				jump = 0;
				RegDst = 0;
				Branch = 0;
				MemR = 0;
				Mem2R = 0;
				MemW = 1;
				RegW = 0;
				Alusrc = 1;
				ExtOp = `EXT_SIGNED;
				Aluctrl = `ALUOp_ADDU;
			end
			
			`INSTR_BEQ_OP:
			begin
				jump = 0;
				RegDst = 0;
				Branch = 1;
				MemR = 0;
				Mem2R = 0;
				MemW = 0;
				RegW = 0;
				Alusrc = 0;
				ExtOp = `EXT_SIGNED;
				Aluctrl = `ALUOp_SUBU;
			end
			
			`INSTR_J_OP:
			begin
				jump = 1;
				RegDst = 0;
				Branch = 0;
				MemR = 0;
				Mem2R = 0;
				MemW = 0;
				RegW = 0;
				Alusrc = 0;
				ExtOp = `EXT_ZERO;
				Aluctrl = 0;
			end
			
			`INSTR_LUI_OP:
			begin
				jump = 0;
				RegDst = 0;
				Branch = 0;
				MemR = 0;
				Mem2R = 0;
				MemW = 0;
				RegW = 1;
				Alusrc = 1;
				ExtOp = `EXT_HIGHPOS;
				Aluctrl = `ALUOp_ADDU;
			end
		endcase
	end
	
endmodule
