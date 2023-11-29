module casca(
input clk_50MHz,

input rst_casca1,
output pwm_casca1,

input rst_casca2,
output pwm_casca2,

input rst_casca3,
output pwm_casca3
);

wire c0_sig1, c0_sig2, c0_sig3;

pllcanhao	p1 (
	.inclk0 ( clk_50MHz ),
	.c0 ( c0_sig1 )
	);
	
pllcanhao	p2 (
	.inclk0 ( clk_50MHz ),
	.c0 ( c0_sig2 )
	); 
	
pllcanhao	p3 (
	.inclk0 ( clk_50MHz
	),
	.c0 ( c0_sig3 )
	); 

top u01
	(
	.clk(c0_sig1),
	.rst_n(rst_casca1),
	.pwm(pwm_casca1)
	);
	
top u02
	(
	.clk(c0_sig2),
	.rst_n(rst_casca2),
	.pwm(pwm_casca2)
	);
	
top u03
	(
	.clk(c0_sig3),
	.rst_n(rst_casca3),
	.pwm(pwm_casca3)
	);
	

endmodule
