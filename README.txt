a faire psp_fmgr !
revoir toutes les touches pour les menus (A, B, X, Y)

-> cheat
-> menu joystick
-> 


    Welcome to Colem - 1.1.1

Original Author of ColEm

  Marat Fayzullin

Author of the PSP and GP2X ports version 

  Ludovic.Jacomme also known as Zx-81 (zx81.zx81@gmail.com)


1. INTRODUCTION
   ------------

  ColEm is one of the best emulator of the ColecoVision videogame system
  running on FreeBSD, HP-UX, SunOS, Solaris, Linux, and other Unix systems. 
  There are also ports to MacOS, MSDOS, Windows, OS/2, PocketPC and other 
  systems. See http://fms.komkon.org/ColEm/ for further informations.

  GP2X-Colem is a port on GP2X of the Unix version 1.0 of ColEm.

  Thanks to Danzel and Jeff Chen for their virtual keyboard,
  and to all GP2X-SDK developpers.

  This package is under GPL Copyright, read COPYING file for
  more information about it.


2. INSTALLATION
   ------------

  Unzip the zip file, and copy the content of the directory game to your
  SD memory.

  Put your roms files on "roms" sub-directory. 

  For any comments or questions on this version, please visit 
  http://zx81.zx81.free.fr, http://zx81.dcemu.co.uk or 
  http://www.gp32x.com/

3. CONTROL
   ------------

  In the emulator window, there are three differents mappings (standard, left
  trigger, and right Trigger mappings). 

  You can toggle between while playing inside the emulator using the two GP2X
  trigger keys.

  GP2X        ColecoVision  (normal)
    
  A          *
  B          Fire2
  Y          $
  X          Fire1
  Up         0
  Down       2
  Left       3 
  Right      1
  
  GP2X        ColecoVision  (left trigger)
    
  A          Fps
  B          Toggle joystick
  Y          Load state
  X          Save state
  Up         0
  Down       2
  Left       3 
  Right      1
  
  GP2X        ColecoVision  (right trigger)
    
  A          5
  B          Fire2
  Y          4
  X          Auto-fire
  Up         0
  Down       2
  Left       Inc-fire
  Right      Dec-fire
  
  Joystick   Up, Down, Left, Rigth
      
  Press Select  to enter in emulator main menu.
  Press Start   open/close the virtual keyboard
  
  In the main menu
  
  RTrigger   Reset the emulator
  
  Y          Go Up directory
  X/B        Valid
  A          Go Back to the emulator window
  
  The virtual Keyboard of "Danzel" and "Jeff Chen"
  
  Use the stick to choose one of the 9 squares, and use A, B, X, Y to 
  choose one of the 4 letters of the highlighted square.
  
  Use LTrigger and RTrigger to see other 9 squares figures.


4. LOADING COLECOVISION ROM FILES
   ------------

  If you want to load rom image in your emulator, you have to put your rom file
  (with .zip, or .rom file extension) on your SD memory in the 'roms' 
  directory.

  Then, while inside Colem emulator, just press SELECT to enter in 
  the emulator main menu, and then using the file selector choose one 
  rom file to load in your emulator.

  Back to the emulator window, the rom should start automatically.

5. LOADING KEY MAPPING FILES
   ------------

  For given games, the default keyboard mapping between GP2X Keys and
  ColecoVision keys, is not suitable, and the game can't be played on Colem.

  To overcome the issue, you can write your own mapping file. Using notepad for
  example you can edit a file with the .kbd extension and put it in the kbd 
  directory.

  For the exact syntax of those mapping files, have a look on sample files already
  presents in the kbd directory (default.kbd etc ...).

  After writting such keyboard mapping file, you can load them using the main menu
  inside the emulator.

  If the keyboard filename is the same as the rom filename (.zip etc ...)
  then when you load this rom, the corresponding keyboard file is automatically 
  loaded !

  You can now use the Keyboard menu and edit, load and save your
  keyboard mapping files inside the emulator. The Save option save the .kbd
  file in the kbd directory using the "Game Name" as filename. The game name
  is displayed on the right corner in the emulator menu.

6. COMPILATION
   ------------

  It has been developped under Linux using gcc with GP2XSDK. 
  To rebuild the homebrew run the Makefile in the src archive.

  Enjoy,

            Zx
