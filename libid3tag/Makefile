EE_LIB = libid3tag.a
EE_INCS += -I$(PS2SDK)/ports/include
EE_OBJS = compat.o crc.o debug.o field.o file.o frame.o frametype.o \
	genre.o latin1.o parse.o render.o tag.o ucs4.o utf16.o utf8.o \
	util.o version.o

include $(PS2SDKSRC)/Defs.make
include $(PS2SDKSRC)/ee/Rules.lib.make
include $(PS2SDKSRC)/ee/Rules.make
include ../Rules.release
