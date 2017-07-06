# Subdirs have dependecies, so compile and install in this order
SUBDIRS = \
	zlib \
	libpng \
	expat \
	freetype-2.4.12 \
	libconfig-1.4.5 \
	libid3tag \
	libjpeg \
	libmad \
	libmikmod \
	libtiff \
	lua \
	romfs \
	sdl \
	sdlimage \
	sdlgfx \
	sdlmixer \
	sdlttf \
	stlport \
	ucl

# build errors or missing dependencies:
#	aalib \
#	madplay \
#	ode \
# libtab is git submodule
#	libtap \

subdir_list  = $(patsubst %,all-%,$(SUBDIRS))
subdir_clean = $(patsubst %,clean-%,$(SUBDIRS))

$(subdir_list):
	make -C $(patsubst all-%,%,$@) all install
$(subdir_clean):
	make -C $(patsubst clean-%,%,$@) clean

config:
	make -C freetype-2.4.12 setup ps2

all: config $(subdir_list)

clean: $(subdir_clean)
