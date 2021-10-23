.DEFAULT_GOAL := all
AUTOGEN = $(shell find plugins -type f -not -path "*Avi*" -name "autogen.sh" -exec dirname "{}" \; )
CONFIG = $(shell find plugins -type f -not -path "*Avi*" -name "configure" -exec dirname "{}" \; )
MEASON = $(shell find plugins -type f -not -path "*Avi*" -not -path "*TDeintMod*" -not -path "*Yadifmod*" -name "meson.build" -exec dirname "{}" \; )
PLUGINS = $(shell find plugins -type f -not -path "*Avi*" -name "*.py")
SCRIPTS = $(shell find scripts -type f -name "*.py")

PWD = $(shell pwd)

all: compile install

compile:
	@echo "compile"
	$(foreach DIR,$(AUTOGEN), $(shell cd $(DIR); ./autogen.sh; ./configure; make -j4; cd $(PWD)))
	$(foreach DIR,$(CONFIG), $(shell cd $(DIR); chmod +x configure; ./configure; make -j4; cd $(PWD)))
	$(shell cd plugins/flash3kyuu_deband/; ./waf configure; ./waf build; cd $(PWD))
	$(foreach DIR,$(MEASON), $(shell cd $(DIR); meson build; ninja -C build; cd $(PWD)))

install:
	@echo "install"
	$(foreach DIR,$(AUTOGEN), $(shell cd $(DIR); make install; cd $(PWD)))
	$(foreach DIR,$(CONFIG), $(shell cd $(DIR); make install; cd $(PWD)))
	$(shell cd plugins/flash3kyuu_deband/; ./waf install; cd $(PWD))
	$(foreach DIR,$(MEASON), $(shell cd $(DIR); ninja -C build install; cd $(PWD)))
	$(foreach SCRIPT,$(PLUGINS), $(shell cp $(SCRIPT) /usr/lib/python3.6/))
	$(foreach SCRIPT,$(SCRIPTS), $(shell cp $(SCRIPT) /usr/lib/python3.6/))

echo:
	@echo $(AUTOGEN)
	@echo $(CONFIG)
	@echo $(MEASON)
	@echo $(PLUGINS)
	@echo $(SCRIPTS)