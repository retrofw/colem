#ifndef _GLOBAL_H_
#define _GLOBAL_H_

#ifdef __cplusplus
extern "C" {
#endif

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int   u32;

#include <time.h>
#include <dirent.h>
#include <SDL/SDL.h>

#include "gp2x_psp.h"
#include "gp2x_cpu.h"

# ifndef CLK_TCK
# define CLK_TCK  CLOCKS_PER_SEC
# endif

#ifdef __cplusplus
}
#endif

#endif
