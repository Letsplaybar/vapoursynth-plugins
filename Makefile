.DEFAULT_GOAL := compile install
AUTOGEN = $(shell find plugins -type f -not -path "*Avi*" -name "autogen.sh" -exec dirname "{}" \; )
CONFIG = $(shell find plugins -type f -not -path "*Avi*" -name "configure" -exec dirname "{}" \; )
MEASON = $(shell find plugins -type f -not -path "*Avi*" -name "meson.build" -exec dirname "{}" \; )
PLUGINS = $(shell find plugins -type f -not -path "*Avi*" -name "*.py")
SCRIPTS = $(shell find scripts -type f -name "*.py")

PWD = $(shell pwd)

compile:
    $(foreach DIR,$(AUTOGEN), shell cd $(DIR); ./autogen.sh; ./configure; make; cd $(PWD))
    $(foreach DIR,$(CONFIG), shell cd $(DIR); ./configure; make; cd $(PWD) )
    $(shell cd plugins/flash3kyuu_deband/; ./waf configure; ./waf build; cd $(PWD)  )
    $(foreach DIR,$(MEASON), shell cd $(DIR); ./meson build; ninja -C build; cd $(PWD) )
    $(shell cd plugins/vapoursynth-wwxd/; gcc -o libwwxd.so -fPIC -shared -O2 -Wall -Wextra -Wno-unused-parameter $(pkg-config --cflags vapoursynth) src/wwxd.c src/detection.c; cd $(PWD)

install:
    $(foreach DIR,$(AUTOGEN), shell cd $(DIR); make install; cd $(PWD))
    $(foreach DIR,$(CONFIG), shell cd $(DIR); make install; cd $(PWD) )
    $(shell cd plugins/flash3kyuu_deband/; ./waf install; cd $(PWD)  )
    $(foreach DIR,$(MEASON), shell cd $(DIR); ninja -C build install; cd $(PWD) )
    $(foreach SCRIPT,$(PLUGINS), shell cp $(SCRIPT)  /usr/lib/python3.6/ )
    $(foreach SCRIPT,$(SCRIPTS), shell cp $(SCRIPT)  /usr/lib/python3.6/ )
