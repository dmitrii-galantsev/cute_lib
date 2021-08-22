GHDL=ghdl
GHDLFLAGS=-a --std=08
LIBNAME=cute_lib

include color.mk

all: $(LIBNAME)

$(LIBNAME): $(LIBNAME)-obj08.cf

%-obj08.cf: %_pkg.vhdl
	$(call print_green,"Compiling [$@] into [$(LIBNAME)]...")
	$(GHDL) $(GHDLFLAGS) --work=$(LIBNAME) $^
	$(call print_green_bld,"Compiling [$@] into [$(LIBNAME)] [DONE]")

clean:
	$(RM) *.cf

.PHONY: all clean $(LIBNAME)
