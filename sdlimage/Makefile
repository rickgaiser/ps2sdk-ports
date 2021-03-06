# makefile for sdlimage.a 
#------------------------------------------------------------------
# Review README & LICENSE files for further details.
#------------------------------------------------------------------
# GCC 3.2.2 / PS2SDK / SDL / ZLIB / PNG / JPG / TIFF
#------------------------------------------------------------------


LIB_SDLIMAGE 	= libSDL_image.a

EE_INCS      += -I./include -I$(PS2SDK)/ports/include -I$(PS2SDK)/ports/include/zlib -I$(PS2SDK)/ports/include/SDL
EE_LIBS      += -lpng -lz -ljpg -lSDL

EE_CFLAGS    += -DLOAD_BMP \
		-DLOAD_GIF \
		-DLOAD_JPG \
		-DLOAD_LBM \
		-DLOAD_PCX \
		-DLOAD_PNG \
		-DLOAD_PNM \
		-DLOAD_TGA \
		-DLOAD_XCF \
		-DLOAD_XPM \
		-DLOAD_TIF

SDLIMAGE_OBJS =	IMG.o			\
		IMG_bmp.o		\
		IMG_gif.o		\
		IMG_jpg.o		\
		IMG_lbm.o		\
		IMG_pcx.o		\
		IMG_png.o		\
		IMG_pnm.o		\
		IMG_tga.o		\
		IMG_tif.o		\
		IMG_xcf.o		\
		IMG_xpm.o

EMBEDDED += \
	$(PS2SDK)/ports/lib/libpng.a \
	$(PS2SDK)/ports/lib/libjpeg.a \
	$(PS2SDK)/ports/lib/libtiff.a \
	$(PS2SDK)/ports/lib/libz.a

$(LIB_SDLIMAGE): $(SDLIMAGE_OBJS)
	# packing with all embedded libraries
	rm -rf tmp
	mkdir tmp
	$(foreach f, $(EMBEDDED), (cd tmp; $(AR) x $f);)
	cp $(SDLIMAGE_OBJS) tmp
	$(EE_AR) cru $(LIB_SDLIMAGE) tmp/*
	rm -rf tmp


all: $(LIB_SDLIMAGE)

install: all
	mkdir -p $(DESTDIR)$(PS2SDK)/ports/include/SDL
	mkdir -p $(DESTDIR)$(PS2SDK)/ports/lib
	cp -f $(LIB_SDLIMAGE) $(DESTDIR)$(PS2SDK)/ports/lib
	cp -f include/*.h $(DESTDIR)$(PS2SDK)/ports/include/SDL

clean:
	/bin/rm -f $(SDLIMAGE_OBJS) $(LIB_SDLIMAGE)

include $(PS2SDK)/Defs.make
include ../Makefile.eeglobal
