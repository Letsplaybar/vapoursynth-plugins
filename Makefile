.DEFAULT_GOAL := all
AUTOGEN = $(shell find plugins -type f -not -path "*Avi*" -name "autogen.sh" -exec dirname "{}" \; )
CONFIG = $(shell find plugins -type f -not -path "*Avi*" -name "configure" -exec dirname "{}" \; )
MEASON = $(shell find plugins -type f -not -path "*Avi*" -not -path "*TDeintMod*" -not -path "*Yadifmod*" -name "meson.build" -exec dirname "{}" \; )
PLUGINS = $(shell find plugins -type f -not -path "*Avi*" -name "*.py")
SCRIPTS = $(shell find scripts -type f -name "*.py")

PWD = $(shell pwd)

all: compile install

compile: exec_compile
	@echo "compile"
	$(foreach DIR,$(AUTOGEN), $(shell ./make_autogen.sh $(DIR) $(PWD)))
	$(foreach DIR,$(CONFIG), $(shell ./make_config.sh $(DIR) $(PWD)))
	$(shell cd plugins/flash3kyuu_deband/; ./waf configure; ./waf build; cd $(PWD))
	$(foreach DIR,$(MEASON), $(shell ./make_meason.sh $(DIR) $(PWD)))

install: exec_install
	@echo "install"
	$(foreach DIR,$(AUTOGEN), $(shell .install_autogen.sh $(DIR) $(PWD)))
	$(foreach DIR,$(CONFIG), $(shell ./install_autogen.sh $(DIR) $(PWD)))
	$(shell cd plugins/flash3kyuu_deband/; ./waf install; cd $(PWD))
	$(foreach DIR,$(MEASON), $(shell ./install_meason.sh $(DIR) $(PWD)))
	$(foreach SCRIPT,$(PLUGINS), $(shell cp $(SCRIPT) /usr/lib/python3.6/))
	$(foreach SCRIPT,$(SCRIPTS), $(shell cp $(SCRIPT) /usr/lib/python3.6/))

exec_compile:
	$(shell chmod +x make*.sh)

exec_install:
	$(shell chmod +x install*.sh)
echo:
	@echo $(AUTOGEN)
	@echo $(CONFIG)
	@echo $(MEASON)
	@echo $(PLUGINS)
	@echo $(SCRIPTS)