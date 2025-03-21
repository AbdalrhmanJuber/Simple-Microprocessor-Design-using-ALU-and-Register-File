module reg_file (clk, valid_opcode, addr1, addr2, addr3, in , out1, out2);
	input clk; 
	input valid_opcode;
	input [4:0] addr1, addr2, addr3; 
	input signed [31:0] in;
	output reg [31:0] out1, out2; 
	reg signed [31:0] register[31:0]; 
	
	
	initial
		begin
		register[0] = 32'h0;
		register[1] = 32'h1208;
		register[2] = 32'h2D78;
		register[3] = 32'h2BF6;
		register[4] = 32'h1A82;
		register[5] = 32'h1A80;
		register[6] = 32'h3090;
		register[7] = 32'h34EC;
		register[8] = 32'h3496;
		register[9] = 32'h348E;
		register[10] = 32'h2E04;
		register[11] = 32'h3372;
		register[12] = 32'hBA6;
		register[13] = 32'h1FA0;
		register[14] = 32'h202;
		register[15] = 32'hE10;
		register[16] = 32'h2A76;
		register[17] = 32'h30F0;
		register[18] = 32'h2684;
		register[19] = 32'h1816;
		register[20] = 32'h11A8;
		register[21] = 32'h3864;
		register[22] = 32'h2F68;
		register[23] = 32'h140E;
		register[24] = 32'h2EB6;
		register[25] = 32'h1E08;
		register[26] = 32'h148A;
		register[27] = 32'h3084; 
		register[28] = 32'hDE8;
		register[29] = 32'h4E0;
		register[30] = 32'h2214;
		register[31] = 32'h0;	 
		end	   
	
	
	always@(posedge clk && valid_opcode == 1)	 
		begin	
			 out1 <= register[addr1];
			 out2 <= register[addr2];
			 register[addr3] = in;
		 end
	
endmodule