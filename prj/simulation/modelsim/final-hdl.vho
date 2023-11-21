-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "11/21/2023 19:35:23"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	servo_controller IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	position : IN std_logic_vector(7 DOWNTO 0);
	servo : OUT std_logic
	);
END servo_controller;

-- Design Ports Information
-- servo	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- position[7]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- position[6]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- position[5]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- position[4]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- position[3]	=>  Location: PIN_E13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- position[2]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- position[1]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- position[0]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF servo_controller IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_position : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_servo : std_logic;
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \servo~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \ctr_q[0]~20_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \ctr_q[0]~21\ : std_logic;
SIGNAL \ctr_q[1]~22_combout\ : std_logic;
SIGNAL \ctr_q[1]~23\ : std_logic;
SIGNAL \ctr_q[2]~24_combout\ : std_logic;
SIGNAL \ctr_q[2]~25\ : std_logic;
SIGNAL \ctr_q[3]~26_combout\ : std_logic;
SIGNAL \ctr_q[3]~27\ : std_logic;
SIGNAL \ctr_q[4]~28_combout\ : std_logic;
SIGNAL \ctr_q[4]~29\ : std_logic;
SIGNAL \ctr_q[5]~30_combout\ : std_logic;
SIGNAL \ctr_q[5]~31\ : std_logic;
SIGNAL \ctr_q[6]~32_combout\ : std_logic;
SIGNAL \ctr_q[6]~33\ : std_logic;
SIGNAL \ctr_q[7]~34_combout\ : std_logic;
SIGNAL \ctr_q[7]~35\ : std_logic;
SIGNAL \ctr_q[8]~36_combout\ : std_logic;
SIGNAL \ctr_q[8]~37\ : std_logic;
SIGNAL \ctr_q[9]~38_combout\ : std_logic;
SIGNAL \ctr_q[9]~39\ : std_logic;
SIGNAL \ctr_q[10]~40_combout\ : std_logic;
SIGNAL \ctr_q[10]~41\ : std_logic;
SIGNAL \ctr_q[11]~42_combout\ : std_logic;
SIGNAL \ctr_q[11]~43\ : std_logic;
SIGNAL \ctr_q[12]~44_combout\ : std_logic;
SIGNAL \ctr_q[12]~45\ : std_logic;
SIGNAL \ctr_q[13]~46_combout\ : std_logic;
SIGNAL \ctr_q[13]~47\ : std_logic;
SIGNAL \ctr_q[14]~48_combout\ : std_logic;
SIGNAL \ctr_q[14]~49\ : std_logic;
SIGNAL \ctr_q[15]~50_combout\ : std_logic;
SIGNAL \ctr_q[15]~51\ : std_logic;
SIGNAL \ctr_q[16]~52_combout\ : std_logic;
SIGNAL \ctr_q[16]~53\ : std_logic;
SIGNAL \ctr_q[17]~54_combout\ : std_logic;
SIGNAL \ctr_q[17]~55\ : std_logic;
SIGNAL \ctr_q[18]~56_combout\ : std_logic;
SIGNAL \ctr_q[18]~57\ : std_logic;
SIGNAL \ctr_q[19]~58_combout\ : std_logic;
SIGNAL \position[7]~input_o\ : std_logic;
SIGNAL \position[6]~input_o\ : std_logic;
SIGNAL \position[5]~input_o\ : std_logic;
SIGNAL \position[4]~input_o\ : std_logic;
SIGNAL \position[3]~input_o\ : std_logic;
SIGNAL \position[2]~input_o\ : std_logic;
SIGNAL \position[0]~input_o\ : std_logic;
SIGNAL \position[1]~input_o\ : std_logic;
SIGNAL \Add1~1\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~5\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~9\ : std_logic;
SIGNAL \Add1~11\ : std_logic;
SIGNAL \Add1~13\ : std_logic;
SIGNAL \Add1~14_combout\ : std_logic;
SIGNAL \Add1~12_combout\ : std_logic;
SIGNAL \Add1~10_combout\ : std_logic;
SIGNAL \Add1~8_combout\ : std_logic;
SIGNAL \Add1~6_combout\ : std_logic;
SIGNAL \Add1~4_combout\ : std_logic;
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \LessThan0~1_cout\ : std_logic;
SIGNAL \LessThan0~3_cout\ : std_logic;
SIGNAL \LessThan0~5_cout\ : std_logic;
SIGNAL \LessThan0~7_cout\ : std_logic;
SIGNAL \LessThan0~9_cout\ : std_logic;
SIGNAL \LessThan0~11_cout\ : std_logic;
SIGNAL \LessThan0~13_cout\ : std_logic;
SIGNAL \LessThan0~15_cout\ : std_logic;
SIGNAL \LessThan0~16_combout\ : std_logic;
SIGNAL \LessThan0~18_combout\ : std_logic;
SIGNAL \pwm_q~q\ : std_logic;
SIGNAL ctr_q : std_logic_vector(19 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_position <= position;
servo <= ww_servo;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

-- Location: IOOBUF_X29_Y31_N9
\servo~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \pwm_q~q\,
	devoe => ww_devoe,
	o => \servo~output_o\);

-- Location: IOIBUF_X16_Y0_N15
\clk~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G17
\clk~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: LCCOMB_X30_Y29_N12
\ctr_q[0]~20\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ctr_q[0]~20_combout\ = ctr_q(0) $ (VCC)
-- \ctr_q[0]~21\ = CARRY(ctr_q(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ctr_q(0),
	datad => VCC,
	combout => \ctr_q[0]~20_combout\,
	cout => \ctr_q[0]~21\);

-- Location: IOIBUF_X29_Y31_N1
\rst~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: FF_X30_Y29_N13
\ctr_q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ctr_q[0]~20_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ctr_q(0));

-- Location: LCCOMB_X30_Y29_N14
\ctr_q[1]~22\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ctr_q[1]~22_combout\ = (ctr_q(1) & (!\ctr_q[0]~21\)) # (!ctr_q(1) & ((\ctr_q[0]~21\) # (GND)))
-- \ctr_q[1]~23\ = CARRY((!\ctr_q[0]~21\) # (!ctr_q(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ctr_q(1),
	datad => VCC,
	cin => \ctr_q[0]~21\,
	combout => \ctr_q[1]~22_combout\,
	cout => \ctr_q[1]~23\);

-- Location: FF_X30_Y29_N15
\ctr_q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ctr_q[1]~22_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ctr_q(1));

-- Location: LCCOMB_X30_Y29_N16
\ctr_q[2]~24\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ctr_q[2]~24_combout\ = (ctr_q(2) & (\ctr_q[1]~23\ $ (GND))) # (!ctr_q(2) & (!\ctr_q[1]~23\ & VCC))
-- \ctr_q[2]~25\ = CARRY((ctr_q(2) & !\ctr_q[1]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ctr_q(2),
	datad => VCC,
	cin => \ctr_q[1]~23\,
	combout => \ctr_q[2]~24_combout\,
	cout => \ctr_q[2]~25\);

-- Location: FF_X30_Y29_N17
\ctr_q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ctr_q[2]~24_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ctr_q(2));

-- Location: LCCOMB_X30_Y29_N18
\ctr_q[3]~26\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ctr_q[3]~26_combout\ = (ctr_q(3) & (!\ctr_q[2]~25\)) # (!ctr_q(3) & ((\ctr_q[2]~25\) # (GND)))
-- \ctr_q[3]~27\ = CARRY((!\ctr_q[2]~25\) # (!ctr_q(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ctr_q(3),
	datad => VCC,
	cin => \ctr_q[2]~25\,
	combout => \ctr_q[3]~26_combout\,
	cout => \ctr_q[3]~27\);

-- Location: FF_X30_Y29_N19
\ctr_q[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ctr_q[3]~26_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ctr_q(3));

-- Location: LCCOMB_X30_Y29_N20
\ctr_q[4]~28\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ctr_q[4]~28_combout\ = (ctr_q(4) & (\ctr_q[3]~27\ $ (GND))) # (!ctr_q(4) & (!\ctr_q[3]~27\ & VCC))
-- \ctr_q[4]~29\ = CARRY((ctr_q(4) & !\ctr_q[3]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ctr_q(4),
	datad => VCC,
	cin => \ctr_q[3]~27\,
	combout => \ctr_q[4]~28_combout\,
	cout => \ctr_q[4]~29\);

-- Location: FF_X30_Y29_N21
\ctr_q[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ctr_q[4]~28_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ctr_q(4));

-- Location: LCCOMB_X30_Y29_N22
\ctr_q[5]~30\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ctr_q[5]~30_combout\ = (ctr_q(5) & (!\ctr_q[4]~29\)) # (!ctr_q(5) & ((\ctr_q[4]~29\) # (GND)))
-- \ctr_q[5]~31\ = CARRY((!\ctr_q[4]~29\) # (!ctr_q(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ctr_q(5),
	datad => VCC,
	cin => \ctr_q[4]~29\,
	combout => \ctr_q[5]~30_combout\,
	cout => \ctr_q[5]~31\);

-- Location: FF_X30_Y29_N23
\ctr_q[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ctr_q[5]~30_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ctr_q(5));

-- Location: LCCOMB_X30_Y29_N24
\ctr_q[6]~32\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ctr_q[6]~32_combout\ = (ctr_q(6) & (\ctr_q[5]~31\ $ (GND))) # (!ctr_q(6) & (!\ctr_q[5]~31\ & VCC))
-- \ctr_q[6]~33\ = CARRY((ctr_q(6) & !\ctr_q[5]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ctr_q(6),
	datad => VCC,
	cin => \ctr_q[5]~31\,
	combout => \ctr_q[6]~32_combout\,
	cout => \ctr_q[6]~33\);

-- Location: FF_X30_Y29_N25
\ctr_q[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ctr_q[6]~32_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ctr_q(6));

-- Location: LCCOMB_X30_Y29_N26
\ctr_q[7]~34\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ctr_q[7]~34_combout\ = (ctr_q(7) & (!\ctr_q[6]~33\)) # (!ctr_q(7) & ((\ctr_q[6]~33\) # (GND)))
-- \ctr_q[7]~35\ = CARRY((!\ctr_q[6]~33\) # (!ctr_q(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ctr_q(7),
	datad => VCC,
	cin => \ctr_q[6]~33\,
	combout => \ctr_q[7]~34_combout\,
	cout => \ctr_q[7]~35\);

-- Location: FF_X30_Y29_N27
\ctr_q[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ctr_q[7]~34_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ctr_q(7));

-- Location: LCCOMB_X30_Y29_N28
\ctr_q[8]~36\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ctr_q[8]~36_combout\ = (ctr_q(8) & (\ctr_q[7]~35\ $ (GND))) # (!ctr_q(8) & (!\ctr_q[7]~35\ & VCC))
-- \ctr_q[8]~37\ = CARRY((ctr_q(8) & !\ctr_q[7]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ctr_q(8),
	datad => VCC,
	cin => \ctr_q[7]~35\,
	combout => \ctr_q[8]~36_combout\,
	cout => \ctr_q[8]~37\);

-- Location: FF_X30_Y29_N29
\ctr_q[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ctr_q[8]~36_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ctr_q(8));

-- Location: LCCOMB_X30_Y29_N30
\ctr_q[9]~38\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ctr_q[9]~38_combout\ = (ctr_q(9) & (!\ctr_q[8]~37\)) # (!ctr_q(9) & ((\ctr_q[8]~37\) # (GND)))
-- \ctr_q[9]~39\ = CARRY((!\ctr_q[8]~37\) # (!ctr_q(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ctr_q(9),
	datad => VCC,
	cin => \ctr_q[8]~37\,
	combout => \ctr_q[9]~38_combout\,
	cout => \ctr_q[9]~39\);

-- Location: FF_X30_Y29_N31
\ctr_q[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ctr_q[9]~38_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ctr_q(9));

-- Location: LCCOMB_X30_Y28_N0
\ctr_q[10]~40\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ctr_q[10]~40_combout\ = (ctr_q(10) & (\ctr_q[9]~39\ $ (GND))) # (!ctr_q(10) & (!\ctr_q[9]~39\ & VCC))
-- \ctr_q[10]~41\ = CARRY((ctr_q(10) & !\ctr_q[9]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ctr_q(10),
	datad => VCC,
	cin => \ctr_q[9]~39\,
	combout => \ctr_q[10]~40_combout\,
	cout => \ctr_q[10]~41\);

-- Location: FF_X30_Y28_N1
\ctr_q[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ctr_q[10]~40_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ctr_q(10));

-- Location: LCCOMB_X30_Y28_N2
\ctr_q[11]~42\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ctr_q[11]~42_combout\ = (ctr_q(11) & (!\ctr_q[10]~41\)) # (!ctr_q(11) & ((\ctr_q[10]~41\) # (GND)))
-- \ctr_q[11]~43\ = CARRY((!\ctr_q[10]~41\) # (!ctr_q(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ctr_q(11),
	datad => VCC,
	cin => \ctr_q[10]~41\,
	combout => \ctr_q[11]~42_combout\,
	cout => \ctr_q[11]~43\);

-- Location: FF_X30_Y28_N3
\ctr_q[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ctr_q[11]~42_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ctr_q(11));

-- Location: LCCOMB_X30_Y28_N4
\ctr_q[12]~44\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ctr_q[12]~44_combout\ = (ctr_q(12) & (\ctr_q[11]~43\ $ (GND))) # (!ctr_q(12) & (!\ctr_q[11]~43\ & VCC))
-- \ctr_q[12]~45\ = CARRY((ctr_q(12) & !\ctr_q[11]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ctr_q(12),
	datad => VCC,
	cin => \ctr_q[11]~43\,
	combout => \ctr_q[12]~44_combout\,
	cout => \ctr_q[12]~45\);

-- Location: FF_X30_Y28_N5
\ctr_q[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ctr_q[12]~44_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ctr_q(12));

-- Location: LCCOMB_X30_Y28_N6
\ctr_q[13]~46\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ctr_q[13]~46_combout\ = (ctr_q(13) & (!\ctr_q[12]~45\)) # (!ctr_q(13) & ((\ctr_q[12]~45\) # (GND)))
-- \ctr_q[13]~47\ = CARRY((!\ctr_q[12]~45\) # (!ctr_q(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ctr_q(13),
	datad => VCC,
	cin => \ctr_q[12]~45\,
	combout => \ctr_q[13]~46_combout\,
	cout => \ctr_q[13]~47\);

-- Location: FF_X30_Y28_N7
\ctr_q[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ctr_q[13]~46_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ctr_q(13));

-- Location: LCCOMB_X30_Y28_N8
\ctr_q[14]~48\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ctr_q[14]~48_combout\ = (ctr_q(14) & (\ctr_q[13]~47\ $ (GND))) # (!ctr_q(14) & (!\ctr_q[13]~47\ & VCC))
-- \ctr_q[14]~49\ = CARRY((ctr_q(14) & !\ctr_q[13]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ctr_q(14),
	datad => VCC,
	cin => \ctr_q[13]~47\,
	combout => \ctr_q[14]~48_combout\,
	cout => \ctr_q[14]~49\);

-- Location: FF_X30_Y28_N9
\ctr_q[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ctr_q[14]~48_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ctr_q(14));

-- Location: LCCOMB_X30_Y28_N10
\ctr_q[15]~50\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ctr_q[15]~50_combout\ = (ctr_q(15) & (!\ctr_q[14]~49\)) # (!ctr_q(15) & ((\ctr_q[14]~49\) # (GND)))
-- \ctr_q[15]~51\ = CARRY((!\ctr_q[14]~49\) # (!ctr_q(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ctr_q(15),
	datad => VCC,
	cin => \ctr_q[14]~49\,
	combout => \ctr_q[15]~50_combout\,
	cout => \ctr_q[15]~51\);

-- Location: FF_X30_Y28_N11
\ctr_q[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ctr_q[15]~50_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ctr_q(15));

-- Location: LCCOMB_X30_Y28_N12
\ctr_q[16]~52\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ctr_q[16]~52_combout\ = (ctr_q(16) & (\ctr_q[15]~51\ $ (GND))) # (!ctr_q(16) & (!\ctr_q[15]~51\ & VCC))
-- \ctr_q[16]~53\ = CARRY((ctr_q(16) & !\ctr_q[15]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ctr_q(16),
	datad => VCC,
	cin => \ctr_q[15]~51\,
	combout => \ctr_q[16]~52_combout\,
	cout => \ctr_q[16]~53\);

-- Location: FF_X30_Y28_N13
\ctr_q[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ctr_q[16]~52_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ctr_q(16));

-- Location: LCCOMB_X30_Y28_N14
\ctr_q[17]~54\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ctr_q[17]~54_combout\ = (ctr_q(17) & (!\ctr_q[16]~53\)) # (!ctr_q(17) & ((\ctr_q[16]~53\) # (GND)))
-- \ctr_q[17]~55\ = CARRY((!\ctr_q[16]~53\) # (!ctr_q(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ctr_q(17),
	datad => VCC,
	cin => \ctr_q[16]~53\,
	combout => \ctr_q[17]~54_combout\,
	cout => \ctr_q[17]~55\);

-- Location: FF_X30_Y28_N15
\ctr_q[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ctr_q[17]~54_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ctr_q(17));

-- Location: LCCOMB_X30_Y28_N16
\ctr_q[18]~56\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ctr_q[18]~56_combout\ = (ctr_q(18) & (\ctr_q[17]~55\ $ (GND))) # (!ctr_q(18) & (!\ctr_q[17]~55\ & VCC))
-- \ctr_q[18]~57\ = CARRY((ctr_q(18) & !\ctr_q[17]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => ctr_q(18),
	datad => VCC,
	cin => \ctr_q[17]~55\,
	combout => \ctr_q[18]~56_combout\,
	cout => \ctr_q[18]~57\);

-- Location: FF_X30_Y28_N17
\ctr_q[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ctr_q[18]~56_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ctr_q(18));

-- Location: LCCOMB_X30_Y28_N18
\ctr_q[19]~58\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ctr_q[19]~58_combout\ = \ctr_q[18]~57\ $ (ctr_q(19))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => ctr_q(19),
	cin => \ctr_q[18]~57\,
	combout => \ctr_q[19]~58_combout\);

-- Location: FF_X30_Y28_N19
\ctr_q[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ctr_q[19]~58_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ctr_q(19));

-- Location: IOIBUF_X33_Y28_N1
\position[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_position(7),
	o => \position[7]~input_o\);

-- Location: IOIBUF_X33_Y27_N8
\position[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_position(6),
	o => \position[6]~input_o\);

-- Location: IOIBUF_X33_Y27_N1
\position[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_position(5),
	o => \position[5]~input_o\);

-- Location: IOIBUF_X31_Y31_N8
\position[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_position(4),
	o => \position[4]~input_o\);

-- Location: IOIBUF_X33_Y25_N8
\position[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_position(3),
	o => \position[3]~input_o\);

-- Location: IOIBUF_X33_Y25_N1
\position[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_position(2),
	o => \position[2]~input_o\);

-- Location: IOIBUF_X31_Y31_N1
\position[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_position(0),
	o => \position[0]~input_o\);

-- Location: IOIBUF_X33_Y28_N8
\position[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_position(1),
	o => \position[1]~input_o\);

-- Location: LCCOMB_X32_Y29_N12
\Add1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = (\position[0]~input_o\ & (\position[1]~input_o\ $ (VCC))) # (!\position[0]~input_o\ & (\position[1]~input_o\ & VCC))
-- \Add1~1\ = CARRY((\position[0]~input_o\ & \position[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \position[0]~input_o\,
	datab => \position[1]~input_o\,
	datad => VCC,
	combout => \Add1~0_combout\,
	cout => \Add1~1\);

-- Location: LCCOMB_X32_Y29_N14
\Add1~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = (\position[2]~input_o\ & (\Add1~1\ & VCC)) # (!\position[2]~input_o\ & (!\Add1~1\))
-- \Add1~3\ = CARRY((!\position[2]~input_o\ & !\Add1~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \position[2]~input_o\,
	datad => VCC,
	cin => \Add1~1\,
	combout => \Add1~2_combout\,
	cout => \Add1~3\);

-- Location: LCCOMB_X32_Y29_N16
\Add1~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add1~4_combout\ = (\position[3]~input_o\ & (\Add1~3\ $ (GND))) # (!\position[3]~input_o\ & (!\Add1~3\ & VCC))
-- \Add1~5\ = CARRY((\position[3]~input_o\ & !\Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \position[3]~input_o\,
	datad => VCC,
	cin => \Add1~3\,
	combout => \Add1~4_combout\,
	cout => \Add1~5\);

-- Location: LCCOMB_X32_Y29_N18
\Add1~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add1~6_combout\ = (\position[4]~input_o\ & (!\Add1~5\)) # (!\position[4]~input_o\ & ((\Add1~5\) # (GND)))
-- \Add1~7\ = CARRY((!\Add1~5\) # (!\position[4]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \position[4]~input_o\,
	datad => VCC,
	cin => \Add1~5\,
	combout => \Add1~6_combout\,
	cout => \Add1~7\);

-- Location: LCCOMB_X32_Y29_N20
\Add1~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add1~8_combout\ = (\position[5]~input_o\ & ((GND) # (!\Add1~7\))) # (!\position[5]~input_o\ & (\Add1~7\ $ (GND)))
-- \Add1~9\ = CARRY((\position[5]~input_o\) # (!\Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \position[5]~input_o\,
	datad => VCC,
	cin => \Add1~7\,
	combout => \Add1~8_combout\,
	cout => \Add1~9\);

-- Location: LCCOMB_X32_Y29_N22
\Add1~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add1~10_combout\ = (\position[6]~input_o\ & (!\Add1~9\)) # (!\position[6]~input_o\ & ((\Add1~9\) # (GND)))
-- \Add1~11\ = CARRY((!\Add1~9\) # (!\position[6]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \position[6]~input_o\,
	datad => VCC,
	cin => \Add1~9\,
	combout => \Add1~10_combout\,
	cout => \Add1~11\);

-- Location: LCCOMB_X32_Y29_N24
\Add1~12\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add1~12_combout\ = (\position[7]~input_o\ & ((GND) # (!\Add1~11\))) # (!\position[7]~input_o\ & (\Add1~11\ $ (GND)))
-- \Add1~13\ = CARRY((\position[7]~input_o\) # (!\Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \position[7]~input_o\,
	datad => VCC,
	cin => \Add1~11\,
	combout => \Add1~12_combout\,
	cout => \Add1~13\);

-- Location: LCCOMB_X32_Y29_N26
\Add1~14\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add1~14_combout\ = \Add1~13\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add1~13\,
	combout => \Add1~14_combout\);

-- Location: LCCOMB_X31_Y29_N12
\LessThan0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan0~1_cout\ = CARRY((!\position[0]~input_o\ & !ctr_q(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \position[0]~input_o\,
	datab => ctr_q(8),
	datad => VCC,
	cout => \LessThan0~1_cout\);

-- Location: LCCOMB_X31_Y29_N14
\LessThan0~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan0~3_cout\ = CARRY((\Add1~0_combout\ & (ctr_q(9) & !\LessThan0~1_cout\)) # (!\Add1~0_combout\ & ((ctr_q(9)) # (!\LessThan0~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~0_combout\,
	datab => ctr_q(9),
	datad => VCC,
	cin => \LessThan0~1_cout\,
	cout => \LessThan0~3_cout\);

-- Location: LCCOMB_X31_Y29_N16
\LessThan0~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan0~5_cout\ = CARRY((\Add1~2_combout\ & ((!\LessThan0~3_cout\) # (!ctr_q(10)))) # (!\Add1~2_combout\ & (!ctr_q(10) & !\LessThan0~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~2_combout\,
	datab => ctr_q(10),
	datad => VCC,
	cin => \LessThan0~3_cout\,
	cout => \LessThan0~5_cout\);

-- Location: LCCOMB_X31_Y29_N18
\LessThan0~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan0~7_cout\ = CARRY((ctr_q(11) & ((!\LessThan0~5_cout\) # (!\Add1~4_combout\))) # (!ctr_q(11) & (!\Add1~4_combout\ & !\LessThan0~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ctr_q(11),
	datab => \Add1~4_combout\,
	datad => VCC,
	cin => \LessThan0~5_cout\,
	cout => \LessThan0~7_cout\);

-- Location: LCCOMB_X31_Y29_N20
\LessThan0~9\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan0~9_cout\ = CARRY((ctr_q(12) & (\Add1~6_combout\ & !\LessThan0~7_cout\)) # (!ctr_q(12) & ((\Add1~6_combout\) # (!\LessThan0~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ctr_q(12),
	datab => \Add1~6_combout\,
	datad => VCC,
	cin => \LessThan0~7_cout\,
	cout => \LessThan0~9_cout\);

-- Location: LCCOMB_X31_Y29_N22
\LessThan0~11\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan0~11_cout\ = CARRY((\Add1~8_combout\ & (ctr_q(13) & !\LessThan0~9_cout\)) # (!\Add1~8_combout\ & ((ctr_q(13)) # (!\LessThan0~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~8_combout\,
	datab => ctr_q(13),
	datad => VCC,
	cin => \LessThan0~9_cout\,
	cout => \LessThan0~11_cout\);

-- Location: LCCOMB_X31_Y29_N24
\LessThan0~13\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan0~13_cout\ = CARRY((ctr_q(14) & (\Add1~10_combout\ & !\LessThan0~11_cout\)) # (!ctr_q(14) & ((\Add1~10_combout\) # (!\LessThan0~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ctr_q(14),
	datab => \Add1~10_combout\,
	datad => VCC,
	cin => \LessThan0~11_cout\,
	cout => \LessThan0~13_cout\);

-- Location: LCCOMB_X31_Y29_N26
\LessThan0~15\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan0~15_cout\ = CARRY((ctr_q(15) & ((!\LessThan0~13_cout\) # (!\Add1~12_combout\))) # (!ctr_q(15) & (!\Add1~12_combout\ & !\LessThan0~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => ctr_q(15),
	datab => \Add1~12_combout\,
	datad => VCC,
	cin => \LessThan0~13_cout\,
	cout => \LessThan0~15_cout\);

-- Location: LCCOMB_X31_Y29_N28
\LessThan0~16\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan0~16_combout\ = (\Add1~14_combout\ & ((!ctr_q(16)) # (!\LessThan0~15_cout\))) # (!\Add1~14_combout\ & (!\LessThan0~15_cout\ & !ctr_q(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Add1~14_combout\,
	datad => ctr_q(16),
	cin => \LessThan0~15_cout\,
	combout => \LessThan0~16_combout\);

-- Location: LCCOMB_X31_Y29_N8
\LessThan0~18\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan0~18_combout\ = (!ctr_q(17) & (!ctr_q(19) & (!ctr_q(18) & \LessThan0~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ctr_q(17),
	datab => ctr_q(19),
	datac => ctr_q(18),
	datad => \LessThan0~16_combout\,
	combout => \LessThan0~18_combout\);

-- Location: FF_X31_Y29_N9
pwm_q : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \LessThan0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pwm_q~q\);

ww_servo <= \servo~output_o\;
END structure;


