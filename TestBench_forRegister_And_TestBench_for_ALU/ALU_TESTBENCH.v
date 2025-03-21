//-----------------------------------------------------------------------------
//
// Title       : ALU_TESTBENCH
// Design      : Microprocessor
// Author      : a-ahmad2018@outlook.com
// Company     : Birzeit
//
//-----------------------------------------------------------------------------
//
// File        : C:\My_Designs\Project\Project_v5\Microprocessor\src\ALU_TESTBENCH.v
// Generated   : Sat Jan 13 16:07:42 2024
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
//{module {ALU_TESTBENCH}}
module ALU_TESTBENCH ();
	reg [5:0] opcode;
	reg signed [31:0] a, b;
	wire [31:0] result;	
	alu ALU(opcode, a, b, result);
	 //	instruction[0] = {11'h0, 5'h0, 5'h0, 5'h0, 6'h0}; //Do nothing instruction	
	//	instruction[1] = {11'h0, 5'h1, 5'h2, 5'h1, 6'h5}; // 32'h1208 + 32'h2D78 = 32'h3F80 save it in R1
	//	instruction[2] = {11'h0, 5'h2, 5'h3, 5'h2, 6'h8}; // 32'h2D78 - 32'h2BF6 = 32'h0182 save it in R2
	//	instruction[3] = {11'h0, 5'h3, 5'h4, 5'h3, 6'hD}; // |32'h2BF6	|  = 32'h2BF6 save it in R3
	//	instruction[4] = {11'h0, 5'h4, 5'h5, 5'h4, 6'h7}; // - 32'h1A82 = -32'hFFFFE57E save it in R4
	//	instruction[5] = {11'h0, 5'h5, 5'h6, 5'h5, 6'h3}; // max(32'h1A80,32'h3090) = 32'h3090 save it in R5
	//	instruction[6] = {11'h0, 5'h6, 5'h7, 5'h6, 6'h6}; // min(32'h3090,32'h34EC) = 32'h3090 save it in R6
	//	instruction[7] = {11'h0, 5'h7, 5'h8, 5'h7, 6'hA}; // avg(32'h34EC,32'h3496) = 32'h34C1 save it in R7
	//	instruction[8] = {11'h0, 5'h8, 5'h8, 5'h8, 6'h2}; // ~32'h3496 = 32'hFFFFCB69 save it in R8
	//	instruction[9] = {11'h0, 5'h9, 5'hA, 5'h9, 6'hF};// a|b = 32'h348E | 32'h2E04	= 32'h3E8E save it in R9
	//	instruction[10] = {11'h0, 5'hA, 5'hB, 5'hA, 6'h4};// a&b = 32'h2E04 & 32'h3372 = 32'h2200 save it in R10
	//	instruction[11] = {11'h0, 5'hB, 5'hC, 5'hB, 6'hC};// a^b = 32'h3372 ^ 32'hBA6 = 32'h38D4 save it in R11
	
	initial
		begin 

	$monitor("Time = %0d a = %5h b = %5h result = %5h Opcode = %5h",$time, a, b, result, opcode);
	opcode = 6'h0;	 //xxxxxx
	a = 0;
	b = 0;
	#10ns
	opcode = 6'h5;	//32'h3f80
	a = 32'h1208;
	b =  32'h2D78;
	#10ns
	opcode = 6'h8;	 //32'h182
	a = 32'h2D78;
	b =   32'h2BF6;

	#10ns
	opcode = 6'hD;	//32'h2BF6
	a = 32'h2BF6;
	b =  32'h2D78;

	#10ns
	opcode = 6'h7;	//h32'hffffe57e
	a = 32'h1A82;
	b =  32'h2D78;

	#10ns
	opcode = 6'h3;	  // max(32'h1A80,32'h3090) = 32'h3090 
	a = 32'h1A80;
	b =  32'h3090;	   

	#10ns
	opcode =6'h6;	 // min(32'h3090,32'h34EC) = 32'h3090
	a = 32'h3090;
	b =  32'h34EC;

	#10ns
	opcode = 6'hA;	 // avg(32'h34EC,32'h3496) = 32'h34A9
	a = 32'h34EC;
	b =  32'h3496;
	
	#10ns
	opcode = 6'h2;	// ~32'h3496 = 32'hffffCB69
	a = 32'h3496;
	b =   32'h2BF6;

	#10ns
	opcode = 6'hF;	 // a|b = 32'h348E | 32'h2E04	= 32'h3E8E
	a = 32'h348E;
	b =    32'h2E04;

	#10ns
	opcode = 6'h4;	  // a&b = 32'h2E04 & 32'h3372 = 32'h2200
	a = 32'h2E04;
	b =   32'h3372;

	#10ns
	opcode = 6'hC;	  // a^b = 32'h3372 ^ 32'hBA6 = 32'h38D4
	a = 32'h3372;
	b =   32'hBA6;


			end

endmodule
