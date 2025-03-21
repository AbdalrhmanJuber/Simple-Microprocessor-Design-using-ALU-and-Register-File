module mp_top (clk, instruction , result );
	input clk; 
	input [31:0] instruction;
	output reg [31:0] result;
	reg signed [31:0] out1, out2; 
	reg [5:0]opcode;
	reg valid;
	
	assign opcode = instruction[5:0];
	always@(opcode)	 
		begin
			case(opcode)
			6'h0 : valid  = 1; //This opcode for making a delay for 1 cycle
			6'h5 : valid  = 1;
			6'h8 : valid  = 1;
			6'hD : valid  = 1;
			6'h7 : valid  = 1;
			6'h3 : valid  = 1;	  
			6'h6 : valid  = 1;
			6'hA : valid  = 1;
			6'h2 : valid  = 1;
			6'hF : valid  = 1;
			6'h4 : valid  = 1;
			6'hC : valid  = 1;
			default : valid = 0; //Non valid
		   endcase	
		 end
	
	
 	alu  ALU(opcode, out1, out2,result); 
 	reg_file Register(clk, valid, instruction[10:6], instruction[15:11], instruction[19:15], result , out1, out2);

endmodule