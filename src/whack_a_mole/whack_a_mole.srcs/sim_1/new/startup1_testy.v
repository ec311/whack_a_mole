`timescale 1ms / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2019 12:00:31 PM
// Design Name: 
// Module Name: startup1_testy
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


module startup1_testy(

    );
    
    reg clk;
    reg clk_1Hz;
    reg enable;
    reg reset;
    wire [31:0] display;
    wire done;
    
    startup1 starty1(.clk(clk), .clk_1Hz(clk_1Hz), .enable(enable), .reset(reset), .display(display), .done(done));
    
    initial begin
        clk = 0;
        clk_1Hz = 0;
        reset = 1;
        enable = 1;
        #10 reset = 0;
        forever #0.00001 clk = ~clk;
        forever #1000 clk_1Hz = ~clk_1Hz;
    end
    
    always begin
        #100;
        reset = 1;
        #100;
        reset = 0;
        #40000 $finish;
    end
endmodule
