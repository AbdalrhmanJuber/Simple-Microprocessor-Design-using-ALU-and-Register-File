//-----------------------------------------------------------------------------
//
// Title       : reg_file_TESTBENCH
// Design      : Microprocessor
// Author      : a-ahmad2018@outlook.com
// Company     : Birzeit
//
//-----------------------------------------------------------------------------
//
// File        : C:\My_Designs\Project\Project_v5\Microprocessor\src\reg_file_TESTBENCH.v
// Generated   : Sat Jan 13 16:50:23 2024
// From        : interface description file
// By          : Itf2Vhdl ver. 1.22
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------
`timescale 1 ns / 1 ps

//{{ Section below this comment is automatically maintained
//   and may be overwritten
//{module {reg_file_TESTBENCH}}
module reg_file_TESTBENCH ();
	reg clk; 
	reg valid_opcode;
	reg [4:0] addr1, addr2, addr3; 
	reg signed [31:0] in;
	wire  [31:0] out1, out2; 
	
	reg_file REGISTER(clk, valid_opcode, addr1, addr2, addr3, in , out1, out2);
	initial
		begin
			// if we want to samulate the clk and the data we must write the data before rising edge and using non instruction after clk for getting IN value
			// ____|----------|__________|----------|______|----------|______|----------|______|----------|______|----------|_____
			//    10          20        30          40    50           60     70         80     90        100    110        120	   
			// Delay = 20
				
				clk = 1'b0;	 
				valid_opcode <= 1;
				addr1 <= 5'h0; 
				addr2 <= 5'h1;
				addr3 <= 5'h0;	

				#20ns  
				in =  out1 + out2 ; // must create an instruction that do nothing
				$display("addr1 = %2h addr2 = %2h addr3 = %2h in = %2h out1 = %4h out2 = %4h", addr1, addr2, addr3, in,out1,out2);
				
				#20ns 
				addr1 <= 5'h2; 
				addr2 <= 5'h3;
				addr3 <= 5'h0;	

				#20ns  
				//in =  out1 + out2 ; // must create an instruction that do nothing
				$display("addr1 = %2h addr2 = %2h addr3 = %2h in = %2h out1 = %4h out2 = %4h", addr1, addr2, addr3, in,out1,out2);
				
				
				#20ns 
				addr1 <= 5'h4; 
				addr2 <= 5'h5;
				addr3 <= 5'h0;	

				#20ns  
				in =  out1 - out2 ; // must create an instruction that do nothing
				$display("addr1 = %2h addr2 = %2h addr3 = %2h in = %2h out1 = %4h out2 = %4h", addr1, addr2, addr3, in,out1,out2);
				
				#20ns 
				addr1 <= 5'h6; 
				addr2 <= 5'h7;
				addr3 <= 5'h0;	

				#20ns  
				in =  out1 + out2 ; // must create an instruction that do nothing
				$display("addr1 = %2h addr2 = %2h addr3 = %2h in = %2h out1 = %4h out2 = %4h", addr1, addr2, addr3, in,out1,out2);
				
			end
			
			
		 always #10ns clk = ~clk; 
	
	
	
endmodule
