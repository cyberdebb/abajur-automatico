library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.round;  -- Adicione esta linha para incluir o pacote math_real



entity led_controller is
  generic (
    clk_hz : real := 50.0e6; -- Frequência do clock
    pwm_hz : real := 1000.0; -- Frequência PWM
    max_brightness : positive := 255; -- Máxima intensidade (8-bit)
    slow_breath_rate : positive := 500; -- Taxa de respiração lenta (alterações por segundo)
    fast_breath_rate : positive := 2000 -- Taxa de respiração rápida (alterações por segundo)
  );
  port (
    clk : in std_logic;
    rst : in std_logic;
    speed_sel : in std_logic; -- Selecionador de velocidade
    led : out std_logic
  );
end led_controller;

architecture rtl of led_controller is

  constant clk_hz_int : integer := integer(clk_hz);
  constant slow_breath_period : integer := clk_hz_int / slow_breath_rate;
  constant fast_breath_period : integer := clk_hz_int / fast_breath_rate;

  signal breath_period : integer;  -- Removida a faixa
  signal breath_rate : positive := slow_breath_rate; -- Inicialmente, use a taxa de respiração lenta

  constant pwm_period : integer := clk_hz_int / integer(pwm_hz);
  signal counter : integer range 0 to pwm_period := 0;
  signal breath_counter : integer range 0 to breath_period := 0;
  signal brightness : integer range 0 to max_brightness := 0;
  signal duty_cycle : integer range 0 to pwm_period := 0;

begin
process(clk, rst, speed_sel)
begin
    -- Atualiza a taxa de respiração com base em speed_sel
  process(clk, rst, speed_sel)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        breath_rate <= slow_breath_rate;
      else
        if speed_sel = '1' then
          breath_rate <= fast_breath_rate;
        else
          breath_rate <= slow_breath_rate;
        end if;
      end if;
    end if;
  end process;

  -- Contador PWM e de Respiração
  pwm_counter : process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        counter <= 0;
        brightness <= 0; -- Reseta a intensidade
        breath_counter <= 0; -- Reseta o contador de respiração
      else
        -- Incrementa o contador PWM
        if counter < pwm_period then
          counter <= counter + 1;
        else
          counter <= 0;
        end if;
        
        -- Incrementa o contador de respiração
        if breath_counter < breath_period then
          breath_counter <= breath_counter + 1;
        else
          breath_counter <= 0;
          brightness <= (brightness + 1) mod max_brightness;
        end if;
      end if;
    end if;
  end process;

  -- Processo para gerar o sinal PWM
  pwm_process : process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        led <= '0';
      else
        -- Calcula o ciclo de trabalho com base na intensidade
        duty_cycle <= (brightness * pwm_period) / max_brightness;
        -- Define o estado do LED
        led <= '0';
        if counter < duty_cycle then
          led <= '1';
        end if;
      end if;
    end if;
  end process;

end architecture rtl;
