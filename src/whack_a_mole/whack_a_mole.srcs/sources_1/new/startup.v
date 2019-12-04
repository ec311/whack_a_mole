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
    // test - delete
    always @(posedge clk, negedge reset) begin
        if (reset == 0) begin
            count <= 4'b0000;
        end else begin
            count <= count - 1;
        end
    end
    
    assign display = {12'b000000000000, count};
    //pass counter output to displaySegments

endmodule
