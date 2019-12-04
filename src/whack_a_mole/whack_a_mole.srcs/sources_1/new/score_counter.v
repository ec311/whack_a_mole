module score_counter(LED_hit, reset, score);
  input LED_hit, reset;
  output reg [3:0] score;

  always @ (*) begin
      if (reset) begin
        score <= 4’b0000; //Start at 0
      end

    else if (LED_hit == 1) begin
      score <= (score + 1’b1);  //Increment by 1 everytime there is a button press before 1 sec
    end
  
    else begin
      score <= score;
    end
  end   
endmodule
