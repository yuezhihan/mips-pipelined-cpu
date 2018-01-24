onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/clk
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/rst
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/IF2IDWr
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/PCWr
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/IF2IDRst
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/ID2EXRst
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/EX2MEMRst
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/PC
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/NewPC
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/PCGo
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/cExtOp
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/WriteData
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/ForwardA
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/ForwardB
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/RD1
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/RD2
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/ALU_B
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_IF2ID/clk
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_IF2ID/rst
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_IF2ID/IRWr
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_IF2ID/IF2IDRst
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_IF2ID/in_PC
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_IF2ID/in_instr
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_IF2ID/PC
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_IF2ID/instr
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/clk
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/rst
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/IRWr
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/ID2EXRst
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/in_Rs
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/in_Rt
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/in_Rd
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/in_PC
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/in_Imm32
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/in_RD1
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/in_RD2
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/in_cJump
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/in_cRegDst
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/in_cBranch
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/in_cMemRead
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/in_cMemtoReg
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/in_cMemWrite
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/in_cRegWrite
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/in_cALUSrc
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/in_cALUOp
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/Rs
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/Rt
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/Rd
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/PC
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/Imm32
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/RD1
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/RD2
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/cJump
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/cRegDst
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/cBranch
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/cMemRead
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/cMemtoReg
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/cMemWrite
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/cRegWrite
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/cALUSrc
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_ID2EX/cALUOp
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_EX2MEM/clk
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_EX2MEM/rst
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_EX2MEM/EX2MEMRst
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_EX2MEM/IRWr
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_EX2MEM/in_PC
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_EX2MEM/in_RegDst
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_EX2MEM/in_ALUResult
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_EX2MEM/in_MemWrite
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_EX2MEM/in_ZERO
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_EX2MEM/in_cJump
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_EX2MEM/in_cBranch
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_EX2MEM/in_cMemRead
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_EX2MEM/in_cMemtoReg
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_EX2MEM/in_cMemWrite
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_EX2MEM/in_cRegWrite
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_EX2MEM/PC
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_EX2MEM/RegDst
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_EX2MEM/ALUResult
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_EX2MEM/MemWrite
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_EX2MEM/ZERO
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_EX2MEM/cJump
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_EX2MEM/cBranch
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_EX2MEM/cMemRead
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_EX2MEM/cMemtoReg
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_EX2MEM/cMemWrite
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_EX2MEM/cRegWrite
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_MEM2WB/clk
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_MEM2WB/rst
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_MEM2WB/IRWr
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_MEM2WB/in_RegDst
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_MEM2WB/in_ALUResult
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_MEM2WB/in_RDMem
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_MEM2WB/in_cRegWrite
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_MEM2WB/in_cMemtoReg
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_MEM2WB/RegDst
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_MEM2WB/ALUResult
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_MEM2WB/RDMem
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_MEM2WB/cRegWrite
add wave -noupdate -radix hexadecimal /mips_tb/U_MIPS/U_MEM2WB/cMemtoReg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1 us}
