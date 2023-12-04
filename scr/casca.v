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
output reg led4,
input SW9,
input SW8,
input SW7,
input SW6,
input SW5,
input SW4,
input SW3,
input SW2
);

wire c0_sig1, c0_sig2, c0_sig3;
reg pwm_output1, pwm_output2, pwm_output3;

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
        if (SW9) begin
            pwm_casca1 <= pwm_output1;
        end else begin 
            pwm_casca1 <= 1'b0;
        end 
        if (SW8) begin
            pwm_casca2 <= pwm_output2;
        end else begin 
            pwm_casca2 <= 1'b0;
        end 
        if (SW7) begin
            pwm_casca3 <= pwm_output3;
        end else begin 
            pwm_casca3 <= 1'b0;
        end 
        if (SW6) begin
            led1 <= 1'b1;
        end else begin
            led1 <= 1'b0;
        end
        if (SW5) begin
            led2 <= 1'b1;
        end else begin
            led2 <= 1'b0;
        end
        if (SW4) begin
            led3 <= 1'b1;
        end else begin
            led3 <= 1'b0;
        end
        if (SW3) begin
            led4 <= 1'b1;
        end else begin
            led4 <= 1'b0;
        end
        if (!SW9 && !SW8 && !SW7 && !SW6 && !SW5 && !SW4 && !SW3 && !SW2) begin
            pwm_casca1 <= 1'b0;
            pwm_casca2 <= 1'b0;
            pwm_casca3 <= 1'b0;
            led1 <= 1'b0;
            led2 <= 1'b0;
            led3 <= 1'b0;
            led4 <= 1'b0;
            counter <= 0;
        end
end

endmodule