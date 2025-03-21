//-----------------------------------------------------------------------------
//
// Title       : alu
// Design      : Microprocessor
// Author      : a-ahmad2018@outlook.com
// Company     : Birzeit
//
//-----------------------------------------------------------------------------
//
// File        : C:\My_Designs\Project\Project_v5\Microprocessor\src\alu.v
// Generated   : Mon Jan  8 21:32:57 2024
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
//{module {alu}}
module alu (opcode, a, b, result );	 
	
	input [5:0] opcode;
	input signed [31:0] a, b;
	output  reg [31:0] result; 


	always@(*)
		begin
		   case(opcode)
			6'h0 :; //Do nothing
			6'h5 : result  = a + b;
			6'h8 : result  = a - b;
			6'hD : result = ABS(a);
			6'h7 : result  = -a;
			6'h3 : result  = max(a,b);	  
			6'h6 : result  = min(a,b);
			6'hA : result  = avg(a,b);
			6'h2 : result  = ~a;
			6'hF : result  = a|b;
			6'h4 : result  = a&b;
			6'hC : result  = a^b;
		   endcase
		   end
				 
	
endmodule	

function [31:0]ABS;
input signed [31:0] a; 
	  ABS =  (a > 0) ? a : -a;
endfunction


function [31:0]max;
	input signed [31:0] a, b;
	  max = (a < b) ? b : a;
endfunction	 

function [31:0]min;
	input signed [31:0] a, b;
	  min = (a < b) ? a : b;
endfunction


function [31:0]avg;
input signed [31:0] a, b; 
	  avg = (a + b)/2 ;
endfunction	






