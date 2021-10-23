.DEFAULT_GOAL := all
AUTOGEN = $(shell find plugins -type f -not -path "*Avi*" -name "autogen.sh" -exec dirname "{}" \; )
CONFIG = $(shell find plugins -type f -not -path "*Avi*" -name "configure" -exec dirname "{}" \; )
MEASON = $(shell find plugins -type f -not -path "*Avi*" -not -path "*TDeintMod*" -not -path "*Yadifmod*" -name "meson.build" -exec dirname "{}" \; )
SCRIPTS = $(shell find scripts -type f -name "*.py")

PWD = $(shell pwd)

all: compile install

compile: exec_compile
	@echo "compile"
	$(foreach DIR,$(CONFIG), $(bash ./make_config.sh $(DIR) $(PWD)))
	$(foreach DIR,$(AUTOGEN), $(bash ./make_autogen.sh $(DIR) $(PWD)))
	$(bash echo "build waf" > /dev/stderr; cd plugins/flash3kyuu_deband/; ./waf configure; ./waf build; cd $(PWD))
	$(foreach DIR,$(MEASON), $(bash ./make_meason.sh $(DIR) $(PWD)))

install: exec_install
	@echo "install"
	$(foreach DIR,$(CONFIG),$(bash ./install_autogen.sh $(DIR) $(PWD)))
	$(bash echo "install waf" > /dev/stderr; cd plugins/flash3kyuu_deband/; ./waf install; cd $(PWD))
	$(foreach DIR,$(MEASON), $(bash ./install_meason.sh $(DIR) $(PWD)))
	$(foreach SCRIPT,$(SCRIPTS), $(bash cp $(SCRIPT) /usr/lib/python3.8/))

exec_compile:
	$(shell chmod +x make*.sh)

exec_install:
	$(shell chmod +x install*.sh)
echo:
	@echo $(AUTOGEN)
	@echo $(CONFIG)
	@echo $(MEASON)
	@echo $(SCRIPTS)