`timescale 1ns/1ps 

module tb_counter; 
	
	//========================= PARAMETERS =======================//
	parameter COUNTER_WIDTH = 4; 
	parameter CLK_PERIOD    = 20; 

	//======================= WIRES & REGS =======================//

	reg clk  ; 
	reg rst_n; 

	wire [COUNTER_WIDTH - 1:0] count; 
	
	//============================ BODY =========================//
	
	// DUT 
	counter# (
		.COUNTER_WIDTH (COUNTER_WIDTH) 
	) counter_dut ( 
		.clk_in      ( clk   ), 
		.rst_n_in    ( rst_n ), 
		.counter_out ( count )
	); 
	
	// clk
	initial begin 
		clk = 0; 
		forever #(CLK_PERIOD/2) clk = ~clk;  
	end 
	
	// reset
	initial begin 
		rst_n = 0; 
		#(CLK_PERIOD*5) rst_n = 1; 
	end 
	
	 // Recording signals for GTKWave
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_counter);
    end

endmodule 
