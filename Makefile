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
OBJS = ./src/gp2x_psp.o \
./src/Coleco.o \
./src/ColEm.o \
./src/Debug.o \
./src/SN76489.o \
./src/Unix.o \
./src/LibPsp.o \
./src/Z80.o \
./src/psp_main.o \
./src/psp_sdl.o \
./src/psp_sound.o \
./src/psp_kbd.o \
./src/psp_font.o \
./src/psp_menu.o \
./src/psp_joy.o \
./src/psp_danzeff.o \
./src/psp_menu_set.o \
./src/psp_menu_help.o \
./src/psp_menu_joy.o \
./src/psp_menu_kbd.o \
./src/psp_menu_cheat.o \
./src/psp_menu_list.o \
./src/psp_editor.o \
./src/miniunz.o \
./src/unzip.o \
./src/psp_fmgr.o

DEFAULT_CFLAGS = $(shell $(SDL_CONFIG) --cflags)

MORE_CFLAGS = -I. \
-DUNIX -DBPP16 -DLSB_FIRST -DSOUND  -DNO_STDIO_REDIRECT  -DCOLEM_VERSION=\"$(COLEM_VERSION)\" \
-DLINUX_MODE

CFLAGS = $(DEFAULT_CFLAGS) $(MORE_CFLAGS) -fsigned-char -g 
CXXFLAGS = $(DEFAULT_CFLAGS) $(MORE_CFLAGS) -fno-exceptions -fno-rtti

LIBS += -lSDL_image -lSDL -lXext -lX11 -lpng -ljpeg -lz -lm -lpthread

all : $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) $(LIBS) -o $(TARGET)

clean:
	rm -f $(OBJS) $(TARGET)

ctags: 
	ctags *[ch]
