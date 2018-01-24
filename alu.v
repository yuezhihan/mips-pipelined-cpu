`include "ctrl_encode_def.v"
module alu (A, B, ALUOp, C, Zero);
           
   input  [31:0] A, B;
   input  [1:0]  ALUOp;
   output reg [31:0] C;
   output Zero;
       
   always @( A or B or ALUOp ) begin
      case ( ALUOp )
         2'b01: C = A + B;
         2'b11: C = A - B;
		 2'b10: C = A | B;
         default:;
      endcase
   end
   
   assign Zero = (C == 0) ? 1 : 0;

endmodule
    
