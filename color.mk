c_pre = "\\033["
cend = "$(c_pre)0m"
cred = "$(c_pre)0;31m"
cyellow = "$(c_pre)0;33m"
cgreen = "$(c_pre)0;32m"
cgreen_bld = "$(c_pre)1;32m"
cgreen_inv = "$(c_pre)7;32m"
cgreen_und = "$(c_pre)4;32m"
COLORS += cred
COLORS += cyellow
COLORS += cgreen cgreen_bld cgreen_inv cgreen_und


define print_red
	@echo $(cred)$(1)$(cend)
endef

define print_yellow
	@echo $(cyellow)$(1)$(cend)
endef

define print_green
	@echo $(cgreen)$(1)$(cend)
endef

define print_green_bld
	@echo $(cgreen_bld)$(1)$(cend)
endef

define print_green_inv
	@echo $(cgreen_inv)$(1)$(cend)
endef

define print_green_und
	@echo $(cgreen_und)$(1)$(cend)
endef
