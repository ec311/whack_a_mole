`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 01:16:14 PM
// Design Name: 
// Module Name: startup
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


module startup(
    input clk,
    input enable,
    input reset,
    output [15:0] display
    );
    
    reg [3:0] count;
    reg [27:0] delay;
    // test - delete
    always @(posedge clk) begin
        if (reset) begin
            count <= 4'b1000;
            delay <= 0;
        end else begin
            delay <= delay + 1;
            if (delay == 28'b1111111111111110000110101010) begin
                count <= count - 1;
            end
        end
    end
    
    assign display = {12'b000000000000, count};
    //pass counter output to display

endmodule
