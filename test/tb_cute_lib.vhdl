library ieee;
use ieee.std_logic_1164.all;
library cute_lib;
use cute_lib.cute_pkg.all;

entity testbench is
-- empty
end testbench;

architecture tb of testbench is

  type test_record_t is record
    sl : sl;
    slv : slv;
    str : string;
  end record;

  procedure print_names (
    constant t_record : test_record_t
  )
  is begin
    info("simple name: " & t_record'simple_name);
    info("instance name: " & t_record'instance_name);
  end procedure;

begin

  process
  is
    constant test_record : test_record_t := (
      sl => '0',
      slv => "0101",
      str => "test_string"
    );
  begin
    info("test info");
    info(to_info_string(test_record.sl));
    info(to_info_string(test_record.slv));
    info(test_record.str);
    info;
    print_names(test_record);
    assert false report "Finished! " severity note;
    wait;
  end process;

end tb;

