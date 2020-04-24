`timescale 10ns/1ns

module binary_to_bcd_big_test;
	reg clk = 0;
	reg [15:0] sixteen_bit_value = 0;
	wire [3:0] ones;
	wire [3:0] tens;
	wire [3:0] hundreds;
	wire [3:0] thousands;
	
binary_to_bcd_big DUT(.clk(clk), .sixteen_bit_value(sixteen_bit_value), .ones(ones), .tens(tens), .hundreds(hundreds), .thousands(thousands));

always
	#5 clk = ~clk;
	
initial
	begin
		$dumpfile("binary_to_bcd_big_test.vcd");
		$dumpvars(0, binary_to_bcd_big_test);
		$monitor($time, "clk = %b, eight_bit_value = %d, thousands = %b, hundreds = %b, tens = %b, ones = %b", clk, sixteen_bit_value, thousands, hundreds, tens, ones);
		sixteen_bit_value = 0;
		#500 sixteen_bit_value = 10;
		#500 sixteen_bit_value = 589;
		#500 sixteen_bit_value = 2375;
		#1000 $finish;
	end
endmodule