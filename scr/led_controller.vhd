library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity led_controller is
  generic (
    clk_hz : real; -- Frequência do clock
    pwm_hz : real; -- Frequência PWM
    min_brightness_us : real; -- Largura de pulso mínima em microssegundos
    max_brightness_us : real; -- Largura de pulso máxima em microssegundos
    step_count : positive -- Número de passos do brilho mínimo ao máximo
  );
  port (
    clk : in std_logic;
    rst : in std_logic;
    brightness : in integer range 0 to step_count - 1;
    led_pwm : out std_logic
  );
end led_controller;

architecture rtl of led_controller is

  function cycles_per_us(us_count : real) return integer is
  begin
    return integer(round(clk_hz / 1.0e6 * us_count));
  end function;

  constant min_count : integer := cycles_per_us(min_brightness_us);
  constant max_count : integer := cycles_per_us(max_brightness_us);
  constant min_max_range_us : real := max_brightness_us - min_brightness_us;
  constant step_us : real := min_max_range_us / real(step_count - 1);
  -- A variável intermediária antes de ser atribuída a cycles_per_step
  variable temp_cycles_per_step : integer;
  constant counter_max : integer := integer(round(clk_hz / pwm_hz)) - 1;
  signal counter : integer range 0 to counter_max;

  signal duty_cycle : integer range 0 to max_count;

begin
  -- Calcula temp_cycles_per_step e garante que seja pelo menos 1
  temp_cycles_per_step := cycles_per_us(step_us);
  if temp_cycles_per_step = 0 then
    temp_cycles_per_step := 1;
  end if;
  constant cycles_per_step : positive := temp_cycles_per_step;
  
  counter_proc: process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        counter <= 0;
      else
        if counter < counter_max then
          counter <= counter + 1;
        else
          counter <= 0;
        end if;
      end if;
    end if;
  end process;

  pwm_proc: process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        led_pwm <= '0';
      else
        led_pwm <= '0';
        if counter < duty_cycle then
          led_pwm <= '1';
        end if;
      end if;
    end if;
  end process;

  duty_cycle_proc: process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        duty_cycle <= min_count;
      else
        duty_cycle <= brightness * cycles_per_step + min_count;
      end if;
    end if;
  end process;

end rtl;
