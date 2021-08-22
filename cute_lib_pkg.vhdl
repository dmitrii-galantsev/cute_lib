use std.textio.all; -- Imports the standard textio package.
library ieee;
use ieee.std_logic_1164.all;

package cute_pkg is
  subtype sl is std_logic;
  subtype slv is std_logic_vector;
  subtype slv2 is std_logic_vector(1 downto 0);
  subtype slv4 is std_logic_vector(3 downto 0);
  subtype slv8 is std_logic_vector(7 downto 0);
  subtype slv16 is std_logic_vector(15 downto 0);
  subtype slv32 is std_logic_vector(31 downto 0);
  subtype slv64 is std_logic_vector(63 downto 0);
  subtype slv128 is std_logic_vector(127 downto 0);

  procedure wait_clk (signal clk : sl);
  procedure wait_clk (constant cycles_k : integer; signal clk : sl);

  procedure info;
  procedure info (constant str : string);

  procedure finish;

  function to_info_string (constant str : sl) return string;
  function to_info_string (constant str : slv) return string;
  function to_info_string (constant str : integer) return string;
end package;

package body cute_pkg is

  -- PROCEDURES --
  procedure wait_clk (signal clk : sl)
  is begin
    wait until rising_edge(clk);
  end procedure;

  procedure wait_clk (constant cycles_k : integer; signal clk : sl)
  is begin
    for i in 1 to cycles_k loop
      wait_clk(clk);
    end loop;
  end procedure;

  procedure info
  is begin
    info("");
  end procedure;

  procedure info (
    constant str : string
  ) is
    variable l : line;
  begin
    write(l, STRING'("[INFO]: "));
    write(l, str);
    writeline(output, l);
  end procedure;

  procedure finish
  is begin
    assert false report "Finished! " severity note;
    wait;
  end procedure;


  -- FUNCTIONS --
  function to_info_string (
    constant str : sl
  ) return string
  is begin
    return "sl : " & to_string(str);
  end function;

  function to_info_string (
    constant str : slv
  ) return string
  is begin
    return "slv(" & to_string(str'high) & " downto " & to_string(str'low) & ") : [" & to_string(str) & "]";
  end function;

  function to_info_string (
    constant str : integer
  ) return string
  is begin
    return "int : " & to_string(str);
  end function;
end package body;
