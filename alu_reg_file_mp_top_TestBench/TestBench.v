//-----------------------------------------------------------------------------
//
// Title       : TestBench
// Design      : Microprocessor
// Author      : a-ahmad2018@outlook.com
// Company     : Birzeit
//
//-----------------------------------------------------------------------------
//
// File        : C:\My_Designs\Project\Project_v5\Microprocessor\src\TestBench.v
// Generated   : Fri Jan 12 21:39:55 2024
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
//{module {TestBench}}
module TestBench;
	parameter n=27;	//Number of instructions
	reg clk;
	reg [31:0]instruction[31:0];
	wire signed [31:0]result;
	reg  [4:0] address;
	reg  [4:0] expected_address;
	reg signed [31:0]expected_value[31:0];
	
	
	initial
		begin
		instruction[0] = {11'h0, 5'h0, 5'h2, 5'h1, 6'h5}; // 32'h1208 + 32'h2D78 = 32'h3F80 save it in R0
		instruction[1] = {6'h0}; //Do nothing instruction	
		instruction[2] = {11'h0, 5'h0, 5'h3, 5'h2, 6'h8}; // 32'h2D78 - 32'h2BF6 = 32'h0182 save it in R0
		instruction[3] = {6'h0}; //Do nothing instruction
		instruction[4] = {11'h0, 5'h0, 5'h4, 5'h3, 6'hD}; // |32'h2BF6	|  = 32'h2BF6 save it in R0	
		instruction[5] = {6'h0}; //Do nothing instruction
		instruction[6] = {11'h0, 5'h0, 5'h5, 5'h4, 6'h7}; // - 32'h1A82 = 32'hFFFFE57E save it in R0 
		instruction[7] = {6'h0}; //Do nothing instruction
		instruction[8] = {11'h0, 5'h0, 5'h6, 5'h5, 6'h3}; // max(32'h1A80,32'h3090) = 32'h3090 save it in R0 
		instruction[9] = {6'h0}; //Do nothing instruction
		instruction[10] = {11'h0, 5'h0, 5'h7, 5'h6, 6'h6}; // min(32'h3090,32'h34EC) = 32'h3090 save it in R0 
		instruction[11] = {6'h0}; //Do nothing instruction
		instruction[12] = {11'h0, 5'h0, 5'h8, 5'h7, 6'hA}; // avg(32'h34EC,32'h3496) = 32'h34C1 save it in R0
		instruction[13] = {6'h0}; //Do nothing instruction
		instruction[14] = {11'h0, 5'h0, 5'h8, 5'h8, 6'h2}; // ~32'h3496 = 32'hFFFFCB69 save it in R0
		instruction[15] = {6'h0}; //Do nothing instruction
		instruction[16] = {11'h0, 5'h0, 5'hA, 5'h9, 6'hF};// a|b = 32'h348E | 32'h2E04	= 32'h3E8E save it in R0
		instruction[17] = {6'h0}; //Do nothing instruction
		instruction[18] = {11'h0, 5'h0, 5'hB, 5'hA, 6'h4};// a&b = 32'h2E04 & 32'h3372 = 32'h2200 save it in R0
		instruction[19] = {6'h0}; //Do nothing instruction
		instruction[20] = {11'h0, 5'h0, 5'hC, 5'hB, 6'hC};// a^b = 32'h3372 ^ 32'hBA6 = 32'h38D4 save it in R0
		instruction[21] = {6'h0}; //Do nothing instruction 
		instruction[20] = {11'h0, 5'h0, 5'hC, 5'hB, 6'hC};// a^b = 32'h3372 ^ 32'hBA6 = 32'h38D4 save it in R0
		instruction[21] = {6'h0}; //Do nothing instruction 
		instruction[22] = {11'h0, 5'h0, 5'h6, 5'h5, 6'h5}; // 32'h1A80 + 32'h3090 = 32'h4B10 save it in R0
		instruction[23] = {6'h0}; //Do nothing instruction	
		instruction[24] = {11'h0, 5'h0, 5'h7, 5'h0, 6'h8}; // 32'h34EC - 32'h34EC = 32'h1624 save it in R0
		instruction[25] = {6'h0}; //Do nothing instruction
		instruction[26] = {11'h0, 5'h0, 5'h19, 5'h0, 6'h5}; // 32'h1624 + 32'h1E08 = 32'h342C save it in R0
		instruction[27] = {6'h0}; //Do nothing instruction
		end	 
		
		mp_top MP_TOP(clk, instruction[address], result); 
		
		initial
			begin  
				$display("State		Address1	Address2	Address3	result		Opcode\n");
				clk = 1'b0;	
				address = 5'h0;	
				$display("    		   %2h	        %2h			  %2h	   %5h		%5h 	 	 	", 
				instruction[address][10:6], instruction[address][15:11],instruction[address][20:16], result, instruction[address][5:0]);
				repeat(n)
				begin
				 #20ns address = address + 1;
				 $display("    		   %2h	        %2h			  %2h	    %5h		%5h 	 	 	", 
				instruction[address][10:6], instruction[address][15:11],instruction[address][20:16], result, instruction[address][5:0]);	
				end	
			end
		initial
			begin
				expected_value[0] = 32'h3F80 ;
				expected_value[1] = 32'h0182  ;
				expected_value[2] = 32'h2BF6 ;
				expected_value[3] = 32'hFFFFE57E ;
				expected_value[4] = 32'h3090 ;
				expected_value[5] = 32'h3090 ;
				expected_value[6] = 32'h34C1 ;
				expected_value[7] = 32'hFFFFCB69 ; 
				expected_value[8] = 32'h3E8E ;
				expected_value[9] = 32'h2200 ;
				expected_value[10] = 32'h38D4;
				expected_value[11] = 32'h4B10 ;
				expected_value[12] = 32'h1624;	
				expected_value[13] = 32'h342C;
			    expected_address = -1; // Should wait 2 cycles for compare with result   2 cycles = 40 ns
				repeat(n)
				#40ns expected_address = expected_address + 1; 				
				end
			
		 always #10ns clk = ~clk; 
	 
			 
		always@(expected_address)
			begin
			if(expected_value[expected_address] == result)$display("PASS");
			if(expected_value[expected_address] != result)$display("Fail");
			end		 

			
endmodule
