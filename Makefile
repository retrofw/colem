#
# Colem for the RetroFW
#
# by pingflood; 2019
#
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

MORE_CFLAGS += -DDINGUX_MODE -mips32 -O3

CFLAGS = $(DEFAULT_CFLAGS) $(MORE_CFLAGS) -O2 -Wall -fsigned-char

LIBS += -Wl,-rpath,$(SYSROOT)/lib -L$(SYSROOT)/lib -lSDL_image -lSDL -lpng -lz -lm

CFLAGS = $(DEFAULT_CFLAGS) $(MORE_CFLAGS)

all : $(TARGET)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

.cpp.o:
	$(CXX) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) $(LIBS) -o $(TARGET) && $(STRIP) $(TARGET)

ipk: all
	@rm -rf /tmp/.colem-ipk/ && mkdir -p /tmp/.colem-ipk/root/home/retrofw/emus/colem /tmp/.colem-ipk/root/home/retrofw/apps/gmenu2x/sections/emulators /tmp/.colem-ipk/root/home/retrofw/apps/gmenu2x/sections/emulators.systems
	@cp -r colem/coleco.rom colem/colem.dge colem/colem.man.txt colem/colem.png colem/splash.png colem/thumb.png colem/background.png colem/graphics /tmp/.colem-ipk/root/home/retrofw/emus/colem
	@cp colem/colem.lnk /tmp/.colem-ipk/root/home/retrofw/apps/gmenu2x/sections/emulators
	@cp colem/colecovision.colem.lnk /tmp/.colem-ipk/root/home/retrofw/apps/gmenu2x/sections/emulators.systems
	@sed "s/^Version:.*/Version: $$(date +%Y%m%d)/" colem/control > /tmp/.colem-ipk/control
	@cp colem/conffiles /tmp/.colem-ipk/
	@tar --owner=0 --group=0 -czvf /tmp/.colem-ipk/control.tar.gz -C /tmp/.colem-ipk/ control conffiles
	@tar --owner=0 --group=0 -czvf /tmp/.colem-ipk/data.tar.gz -C /tmp/.colem-ipk/root/ .
	@echo 2.0 > /tmp/.colem-ipk/debian-binary
	@ar r colem/colem.ipk /tmp/.colem-ipk/control.tar.gz /tmp/.colem-ipk/data.tar.gz /tmp/.colem-ipk/debian-binary

opk: all
	@mksquashfs \
	colem/default.retrofw.desktop \
	colem/colecovision.retrofw.desktop \
	colem/colem.dge \
	colem/colem.png \
	colem/coleco.rom \
	colem/colem.man.txt \
	colem/splash.png \
	colem/thumb.png \
	colem/background.png \
	colem/graphics \
	colem/colem.opk \
	-all-root -noappend -no-exports -no-xattrs

ctags:
	ctags *[ch]

clean:
	rm -f $(OBJS) $(TARGET) ./colem/colem.ipk
