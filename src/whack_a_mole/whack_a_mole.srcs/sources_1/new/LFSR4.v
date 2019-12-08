`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 05:42:47 PM
// Design Name: 
// Module Name: LFSR4
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

module LFSR4 (
    input clk,
    input reset,
    output reg [2:0] number
    );
    
    reg [7:0] out;
    parameter s0 = 2'b00, s1=2'b01,s2=2'b10, s3=2'b11;
    reg [1:0] current, next;
    reg feedback,next_feedback;
    reg [2:0] next_number;
    
    //  TERRY - COMMENT WHAT THIS ACTUALLY DOES
    always @(posedge clk) begin
        if (reset == 1) begin
          current <= s0;         
          number <= 0;
        end
        else begin
          current <= next;
          feedback <= next_feedback;
          number <= next_number;
        end
      end
      
    always @ (*) begin
        case(current)
          s0: begin
            next <= s1;
            next_feedback <= ~(out[1] ^ out[5]);
            out <= {out[6:0], feedback};
            next_number <= out[2:0];
          end
          s1: begin
            next <= s2;
            next_feedback <= ~(out[7] ^ out[4]);
            out <= {out[6:0], feedback};
            next_number <= out[2:0];
          end
          s2: begin
            next <= s3;
            next_feedback <= ~(out[1] ^ out[6]);
            out <= {out[6:0], feedback};
            next_number <= out[2:0];
          end
          s3: begin
            next <= s0;
            next_feedback <= ~(out[2] ^ out[6]);
            out <= {out[6:0], feedback};
            next_number <= out[2:0];
          end          
          default: next <= s0;         
        endcase
    end
      
endmodule