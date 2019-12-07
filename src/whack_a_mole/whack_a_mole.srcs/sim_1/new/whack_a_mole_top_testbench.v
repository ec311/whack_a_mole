`timescale 1ms / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2019 10:19:22 AM
// Design Name: 
// Module Name: whack_a_mole_top_testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module whack_a_mole_top_testbench(
    
    );
    reg clk; reg reset;
    wire [7:0] ANLine; wire[6:0] displaySegments;
    
    whack_a_mole_top t0(.clk(clk), .reset(reset), .ANLine(ANLine), .displaySegments(displaySegments));
    
    initial begin
        clk = 0; reset = 1;
        #10 reset = 0;
    end
    
    always begin
        #0.00001 clk = ~clk;
        #40000 $finish;
    end
endmodule
