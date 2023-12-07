module casca(
input clk_50MHz,
input rst_casca1,
input rst_casca2,
input rst_casca3,
output reg pwm_casca1,
output reg pwm_casca2,
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
input SW2,
input SW1,
input SW0,
input wire [3:0] Data_In, // Entrada de 4 bits
output wire a, b, c, d, e, f, g, h, // Saídas para os segmentos do display
output wire led_respiracao // Conecte isso ao LED que você quer controlar

);

// motores
wire c0_sig1, c0_sig2, c0_sig3; 
reg pwm_output1, pwm_output2, pwm_output3;
reg [3:0] internal_data_in; // Sinal interno para substituir Data_In
wire speed_select;
assign speed_select = SW0; // SW0 controla a velocidade

// leds
wire c0_sig4, c0_sig5, c0_sig6, c0_sig7; 
reg pwm_output4, pwm_output5, pwm_output6, pwm_output7;

// led_controller my_led_controller (
//     .clk(clk_50MHz),
//     .rst(rst_casca1),  // Supondo que você tenha um sinal de reset
//     .speed_sel(speed_select),
//     .led(led_respiracao)
// );

disp7seg my_display (
    .Data_In(internal_data_in),
    .a(a), .b(b), .c(c), .d(d),
    .e(e), .f(f), .g(g), .h(h),
);

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
	 
pllcanhao p4 (
    .inclk0 (clk_50MHz),
    .c0 (c0_sig4)
    );

pllcanhao p5 (
    .inclk0 (clk_50MHz),
    .c0 (c0_sig5)
    ); 

pllcanhao p6 (
    .inclk0 (clk_50MHz),
    .c0 (c0_sig6)
    ); 

pllcanhao p7 (
    .inclk0 (clk_50MHz),
    .c0 (c0_sig7)
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

top u04 (
    .clk(c0_sig4),
    .rst_n(rst_casca1),
    .pwm(pwm_output4)
);

top u05 (
    .clk(c0_sig5),
    .rst_n(rst_casca1),
    .pwm(pwm_output5)
);

top u06 (
    .clk(c0_sig6),
    .rst_n(rst_casca1),
    .pwm(pwm_output6)
);

top u07 (
    .clk(c0_sig7),
    .rst_n(rst_casca1),
    .pwm(pwm_output7)
);

reg [25:0] counter; // Contador

always @ (posedge clk_50MHz) begin
        internal_data_in <= 4'b1110; // Representa um hífen
        if (SW9) begin
            pwm_casca1 <= pwm_output1;
            internal_data_in <= 4'b1001; // Representa o número 9
        end else begin 
            pwm_casca1 <= 1'b0;
            internal_data_in <= 4'b1110; // Representa um hífen
        end 
        if (SW8) begin
            internal_data_in <= 4'b1000; // Representa o número 8
            pwm_casca2 <= pwm_output2;
        end else begin 
            pwm_casca2 <= 1'b0;
            internal_data_in <= 4'b1110; // Representa um hífen
        end 
        if (SW7) begin
            pwm_casca3 <= pwm_output3;
            internal_data_in <= 4'b0111; // Representa o número 7
        end else begin 
            pwm_casca3 <= 1'b0;
            internal_data_in <= 4'b1110; // Representa um hífen
        end 
        if (SW6) begin
            led1 <= 1'b1;
            internal_data_in <= 4'b0110; // Representa o número 6
        end else begin
            led1 <= 1'b0;
            internal_data_in <= 4'b1110; // Representa um hífen
        end
        if (SW5) begin
            led2 <= 1'b1;
            internal_data_in <= 4'b0101; // Representa o número 5
        end else begin
            led2 <= 1'b0;
            internal_data_in <= 4'b1110; // Representa um hífen
        end
        if (SW4) begin
            led3 <= 1'b1;
            internal_data_in <= 4'b0100; // Representa o número 4
        end else begin
            led3 <= 1'b0;
            internal_data_in <= 4'b1110; // Representa um hífen
        end
        if (SW3) begin
            led4 <= 1'b1;
            internal_data_in <= 4'b0011; // Representa o número 3
        end else begin
            led4 <= 1'b0;
            internal_data_in <= 4'b1110; // Representa um hífen
        end
		  if (SW2) begin // liga todos
            internal_data_in <= 4'b0010; // Representa o número 2
            led1 <= 1'b1;
            led2 <= 1'b1;
            led3 <= 1'b1;
            led4 <= 1'b1;
        end else begin
            internal_data_in <= 4'b1110; // Representa um hífen
            led1 <= 1'b0;
            led2 <= 1'b0;
            led3 <= 1'b0;
            led4 <= 1'b0;
        end
		  if (SW1) begin // fade
            internal_data_in <= 4'b0001; // Representa o número 1
            led1 <= pwm_output4;
            led2 <= pwm_output5;
            led3 <= pwm_output6;
            led4 <= pwm_output7;
        end else begin
            internal_data_in <= 4'b1110; // Representa um hífen
            led1 <= 1'b0;
            led2 <= 1'b0;
            led3 <= 1'b0;
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
            internal_data_in <= 4'b1110; // Representa um hífen

        end
end

endmodule