// module description
// counter 0 to (2**COUNTER_WIDTH - 1)
module counter #(
	parameter   COUNTER_WIDTH = 4
) (
	input  wire                      clk_in        , 
	input  wire                      reset_n_in    , 
	output wire [COUNTER_WIDTH-1:0]  counter_out 
); 

//======================= WIRES & REGS =======================//

reg [COUNTER_WIDTH-1:0] counter_reg;

//=======================     BODY     =======================//

// counter 
always @(posedge clk_in) begin 
	if (!reset_n_in) begin 
		counter_reg <= 0; 
	end 
	else begin
		counter_reg <= counter_reg + 1;
	end 
end 

assign 	counter_out = counter_reg;

endmodule 

