module casca(
input clk_50MHz,
input rst_casca1,
output reg pwm_casca1,
input rst_casca2,
output reg pwm_casca2,
input rst_casca3,
output reg pwm_casca3,
output reg led1,
output reg led2,
output reg led3,
input switch1,
input switch2,
input switch3,
input switch4,
input switch5,
input switch6
);

wire c0_sig1, c0_sig2, c0_sig3;
wire pwm_output1, pwm_output2, pwm_output3;

pllcanhao p1 (
    .inclk0 (clk_50MHz),
    .c0 (c0_sig1)
    );

pllcanhao p2 (
    .inclk0 (clk_50MHz),
    .c0 (c0_sig2)
    ); 

pllcanhao p3 (
    .inclk0 (clk_50MHz),
    .c0 (c0_sig3)
    ); 

top u01 (
    .clk(c0_sig1),
    .rst_n(rst_casca1),
    .pwm(pwm_output1)
);

top u02 (
    .clk(c0_sig2),
    .rst_n(rst_casca2),
    .pwm(pwm_output2)
);

top u03 (
    .clk(c0_sig3),
    .rst_n(rst_casca3),
    .pwm(pwm_output3)
);

reg [25:0] counter; // Contador

always @ (posedge clk_50MHz) begin
        if (switch1) begin
            pwm_casca1 <= pwm_output1;
        end else begin 
            pwm_casca1 <= 1'b0;
        end 
        if (switch2) begin
            pwm_casca2 <= pwm_output2;
        end else begin
            pwm_casca2 <= 1'b0;
        end 
        if (switch3) begin
            pwm_casca3 <= pwm_output3;
        end else begin
            pwm_casca3 <= 1'b0;
        end
        if (switch4) begin
             if (counter < 100_000_000) begin
                 pwm_casca1 <= pwm_output1;
                 counter <= counter + 1;
             end else begin
                 pwm_casca1 <= 1'b0;
                 pwm_casca2 <= pwm_output2;
                 counter <= 0;
             end
        end else begin
				 pwm_casca1 <= 1'b0;
				 pwm_casca2 <= 1'b0;
		  end
        if (switch5) begin
            led1 <= 1'b1;
        end else begin
            led1 <= 1'b0;
        end
        if (switch6) begin
            led2 <= 1'b1;
        end else begin
            led2<= 1'b0;
        end
        if (!switch1 && !switch2 && !switch3 && !switch4 && !switch5 && !switch6) begin
            pwm_casca1 <= 1'b0;
            pwm_casca2 <= 1'b0;
            pwm_casca3 <= 1'b0;
            led1 <= 1'b0;
            led2 <= 1'b0;
            led3 <= 1'b0;
            counter <= 0;
        end
end

endmodule