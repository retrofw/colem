#
# Colem port on PSP 
#
# Copyright (C) 2006 Ludovic Jacomme (ludovic.jacomme@gmail.com)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#

CHAINPREFIX := /opt/mipsel-linux-uclibc
CROSS_COMPILE := $(CHAINPREFIX)/usr/bin/mipsel-linux-

CC = $(CROSS_COMPILE)gcc
CXX = $(CROSS_COMPILE)g++
STRIP = $(CROSS_COMPILE)strip

SYSROOT     := $(shell $(CC) --print-sysroot)

COLEM_VERSION=1.1.0

TARGET = colem/colem.dge
SDL_CONFIG = $(SYSROOT)/usr/bin/sdl-config

OBJS = ./src/gp2x_psp.o
OBJS += ./src/Coleco.o
OBJS += ./src/ColEm.o
OBJS += ./src/Debug.o
OBJS += ./src/SN76489.o
OBJS += ./src/TMS9918.o
OBJS += ./src/Unix.o
OBJS += ./src/LibPsp.o
OBJS += ./src/Z80.o
OBJS += ./src/psp_main.o
OBJS += ./src/psp_sdl.o
OBJS += ./src/psp_sound.o
OBJS += ./src/psp_kbd.o
OBJS += ./src/psp_font.o
OBJS += ./src/psp_menu.o
OBJS += ./src/psp_joy.o
OBJS += ./src/psp_danzeff.o
OBJS += ./src/psp_menu_set.o
OBJS += ./src/psp_menu_help.o
OBJS += ./src/psp_menu_joy.o
OBJS += ./src/psp_menu_kbd.o
OBJS += ./src/psp_menu_cheat.o
OBJS += ./src/psp_menu_list.o
OBJS += ./src/psp_editor.o
OBJS += ./src/miniunz.o
OBJS += ./src/unzip.o
OBJS += ./src/psp_fmgr.o

DEFAULT_CFLAGS = $(shell $(SDL_CONFIG) --cflags)

MORE_CFLAGS = -I. -DUNIX -DBPP16 -DLSB_FIRST -DSOUND  -DCOLEM_VERSION=\"$(COLEM_VERSION)\"
# MORE_CFLAGS += -DCAANOO_MODE

# MORE_CFLAGS += -DNARROW -DSOUND -DBPP16 -DSDL -DLSB_FIRST
# MORE_CFLAGS += -I. -I$(SYSROOT)/usr/include  -I$(SYSROOT)/usr/lib  -I$(SYSROOT)/lib
# MORE_CFLAGS += -DMPU_JZ4740
# MORE_CFLAGS += -I./src -I./src/emucore -I./src/common -I./src/psp -DPSP -DBSPF_PSP -DSOUND_SUPPORT
# MORE_CFLAGS += -fsigned-char -ffast-math -fomit-frame-pointer -fno-strength-reduce
MORE_CFLAGS += -DDINGUX_MODE -mips32 -O3
#MORE_CFLAGS += -g -DNO_STDIO_REDIRECT
# MORE_CFLAGS += -O2 -fomit-frame-pointer -ffunction-sections -ffast-math -fsingle-precision-constant # -G0

CFLAGS = $(DEFAULT_CFLAGS) $(MORE_CFLAGS) -O2 -Wall -fsigned-char

LIBS += -Wl,-rpath,$(SYSROOT)/lib -L$(SYSROOT)/lib -lSDL_image -lSDL -lpng -lz -lm
 # -lpthread







# LIBS += -B$(SYSROOT)/lib
# LIBS += -lSDL_image -lpng
# LIBS += -lpthread  -ldl -lstdc++

CFLAGS = $(DEFAULT_CFLAGS) $(MORE_CFLAGS) 









all : $(TARGET)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

.cpp.o:
	$(CXX) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) $(LIBS) -o $(TARGET) && $(STRIP) $(TARGET)

clean:
	rm -f $(OBJS) $(TARGET)

ctags: 
	ctags *[ch]
