`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2019 03:06:38 PM
// Design Name: 
// Module Name: led_select
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


module led_select(
    input enable,
    input reset,
    input [2:0] random_num,
    output reg [7:0] leds,
    output reg [2:0] mole_num
    );
        
     always @ (*) begin
        if (reset)
            leds = 8'b00000000;
        else begin
            if (enable == 1) begin
                case(random_num)
                    3'b000: begin
                        leds = 8'b000000000;
                        leds[0] = 1;
                        mole_num = 3'b000;
                    end
                    3'b001: begin
                        leds = 8'b000000000;
                        leds[1] = 1;
                        mole_num = 3'b001;
                    end
                    3'b010: begin
                        leds = 8'b000000000;
                        leds[2] = 1;
                        mole_num = 3'b010;
                    end
                    3'b011: begin
                        leds = 8'b000000000;
                        leds[3] = 1;
                        mole_num = 3'b011;
                    end
                    3'b100: begin
                        leds = 8'b000000000;
                        leds[4] = 1;
                        mole_num = 3'b100;
                    end
                    3'b101: begin
                        leds = 8'b000000000;
                        leds[5] = 1;
                        mole_num = 3'b101;
                    end
                    3'b110: begin
                        leds = 8'b000000000;
                        leds[6] = 1;
                        mole_num = 3'b110;
                    end
                    3'b111: begin
                        leds = 8'b000000000;
                        leds[7] = 1;
                        mole_num = 3'b111;
                    end
                 endcase
             end
        end
    end
endmodule
