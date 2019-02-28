#
# Colem port on CAANOO 
#
# Copyright (C) 2009 Ludovic Jacomme (ludovic.jacomme@gmail.com)
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
COLEM_VERSION=1.1.1

TARGET = colem.gpe
SDL_CONFIG = $(CAANOOGPH)/bin/sdl-config
OBJS = gp2x_psp.o \
cpucaanoo.o \
Coleco.o \
ColEm.o \
Debug.o \
SN76489.o \
Unix.o \
LibPsp.o \
Z80.o \
psp_main.o \
psp_sdl.o \
psp_sound.o \
psp_kbd.o \
psp_font.o \
psp_menu.o \
psp_joy.o \
psp_danzeff.o \
psp_menu_set.o \
psp_menu_help.o \
psp_menu_joy.o \
psp_menu_kbd.o \
psp_menu_cheat.o \
psp_menu_list.o \
psp_editor.o \
miniunz.o \
unzip.o \
psp_fmgr.o

CC=arm-gph-linux-gnueabi-gcc
CXX=arm-gph-linux-gnueabi-g++
STRIP=arm-gph-linux-gnueabi-strip

DEFAULT_CFLAGS = $(shell $(SDL_CONFIG) --cflags)

MORE_CFLAGS = -I. -I$(CAANOODEV)/include \
-DUNIX -DBPP16 -DLSB_FIRST -DSOUND  -DNO_STDIO_REDIRECT  -DCOLEM_VERSION=\"$(COLEM_VERSION)\" \
-DCAANOO_MODE 

CFLAGS = $(DEFAULT_CFLAGS) $(MORE_CFLAGS) -O2 -Wall -fsigned-char

LIBS += -Wl,-rpath,$(OPENCAANOO)/lib -L$(CAANOODEV)/lib -lSDL_image -lSDL -lpng -lz -lm -lpthread

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

.cpp.o:
	$(CXX) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) $(LIBS) -o $(TARGET) && $(STRIP) $(TARGET)

install: $(TARGET)
	cp $< /media/caanoo/game/caanoocolem/

clean:
	rm -f $(OBJS) $(TARGET)

ctags: 
	ctags *[ch]


#
#
# /usr/local/caanoodev/bin/arm-opencaanoo-linux-gnu-gcc -L/usr/local/caanoodev/lib gp2x_psp.o Coleco.o ColEm.o Debug.o SN76489.o Unix.o LibPsp.o Z80.o psp_main.o psp_sdl.o psp_sound.o psp_kbd.o psp_font.o psp_danzeff.o psp_menu.o psp_menu_help.o psp_menu_set.o psp_menu_kbd.o psp_fmgr.o -o colem.gpe -Wl,-rpath,/usr/local/caanoodev/lib -lSDL -lSDL_image -lpng -lm -lz -lpthread
#
