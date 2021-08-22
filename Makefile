#GHDL=ghdl
#GHDLFLAGS=-a --std=08
#
#include color.mk
#
#all: $(LIBNAME)
#
#$(LIBNAME): $(LIBNAME)-obj08.cf
#
#%-obj08.cf: %_pkg.vhdl
#	$(call print_green,"Compiling [$@] into [$(LIBNAME)]...")
#	$(GHDL) $(GHDLFLAGS) --work=$(LIBNAME) $^
#	$(call print_green_bld,"Compiling [$@] into [$(LIBNAME)] [DONE]")
#
#clean:
#	find ./ -iname "*.cf" -delete
#
#.PHONY: all clean $(LIBNAME)

GHDL = ghdl
LIBNAME=cute_lib
LIBFLAGS =
LIBFILES += $(wildcard *.vhdl)
GHDLFLAGS = --std=08 $(LIBFLAGS)
GHDLRUNFLAGS =
VHDLFILES = $(wildcard test/*.vhdl)

include color.mk

all: run

# Run target
run: init
	$(call print_green,"Running testbench...")
	$(GHDL) -c $(GHDLFLAGS) -r testbench $(GHDLRUNFLAGS)
	$(call print_green_bld,"Running testbench [DONE]")

# Targets to analyze libraries
init: libs $(VHDLFILES)
	$(GHDL) -a $(GHDLFLAGS) $(VHDLFILES)

libs: $(LIBNAME)
$(LIBNAME): $(LIBNAME)-obj08.cf

$(LIBNAME)-obj08.cf: $(LIBFILES)
	$(call print_green,"Compiling [$@] into [$(LIBNAME)]...")
	$(GHDL) -a $(GHDLFLAGS) --work=$(LIBNAME) $^
	$(call print_green_bld,"Compiling [$@] into [$(LIBNAME)] [DONE]")

clean:
	$(GHDL) clean
	find ./ -iname "*.cf" -delete

.PHONY: all clean init run libs
