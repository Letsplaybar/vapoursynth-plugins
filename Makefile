.DEFAULT_GOAL := all
AUTOGEN = $(shell find plugins -type f -not -path "*Avi*" -name "autogen.sh" -exec dirname "{}" \; )
CONFIG = $(shell find plugins -type f -not -path "*Avi*" -name "configure" -exec dirname "{}" \; )
MEASON = $(shell find plugins -type f -not -path "*Avi*" -not -path "*TDeintMod*" -not -path "*Yadifmod*" -name "meson.build" -exec dirname "{}" \; )
SCRIPTS = $(shell find scripts -type f -name "*.py")

PWD = $(shell pwd)

all: compile install

compile: exec_compile
	$(foreach DIR,$(CONFIG), ./make_config.sh $(DIR) $(PWD);)
	$(foreach DIR,$(AUTOGEN), ./make_autogen.sh $(DIR) $(PWD);)
	cd plugins/flash3kyuu_deband/; ./waf configure; ./waf build; cd $(PWD)
	$(foreach DIR,$(MEASON),  ./make_meason.sh $(DIR) $(PWD);)
	cd plugins/vapoursynth-wwxd/; gcc -o libwwxd.so -fPIC -shared -O2 -Wall -Wextra -Wno-unused-parameter $(pkg-config --cflags vapoursynth) src/wwxd.c src/detection.c; cd $(PWD)
	cd plugins/waifu2x-ncnn-vulkan/; mkdir build; cd build; cmake ../src; cmake --build . -j 4; cd $(PWD)
	cd plugins/vapoursynth-waifu2x-ncnn-vulkan/; mkdir build; cd build; cmake ..; cmake --build . -j 4; cd $(PWD)

install: exec_install
	$(foreach DIR,$(CONFIG), ./install_autogen.sh $(DIR) $(PWD);)
	cd plugins/flash3kyuu_deband/; ./waf install; cd $(PWD)
	$(foreach DIR,$(MEASON), ./install_meason.sh $(DIR) $(PWD);)
	$(foreach SCRIPT,$(SCRIPTS), cp $(SCRIPT) /usr/lib/python3.8/;)
	cp plugins/vapoursynth-wwxd/libwwxd.so /usr/local/lib/
	cd plugins/waifu2x-ncnn-vulkan/build; make install; cd $(PWD)
	cd plugins/vapoursynth-waifu2x-ncnn-vulkan/build; make install; cd $(PWD)

exec_compile:
	$(shell chmod +x make*.sh)

exec_install:
	$(shell chmod +x install*.sh)

exec_clean:
	$(shell chmod +x clean*.sh)

echo:
	@echo $(AUTOGEN)
	@echo $(CONFIG)
	@echo $(MEASON)
	@echo $(SCRIPTS)

clean: exec_clean
	$(foreach DIR,$(CONFIG), ./clean_config.sh $(DIR) $(PWD);)
	cd plugins/flash3kyuu_deband/; ./waf clean; cd $(PWD)
	$(foreach DIR,$(MEASON), ./clean_meason.sh $(DIR) $(PWD);)
	rm plugins/vapoursynth-wwxd/libwwxd.so
	cd plugins/waifu2x-ncnn-vulkan/build; make clean; cd $(PWD)
	cd plugins/vapoursynth-waifu2x-ncnn-vulkan/build; make clean; cd $(PWD)


