# YumYumDonut
## YumYumDonut : Commodore 64 Game for the BASIC 10Liner Contest
**©2023 Adam Whitney**

### Intro

YumYumDonut is the first video game I have ever created. I made it as an entry into the [BASIC 10Liner Contest](https://www.homeputerium.de/). It was inspired (and named) by my daughter, who loves pandas and believes that they should be able to enjoy delicious donuts too.

### Loading the Game

Drag yumyumdonut.D64 to your VICE emulator to load the game. Make sure the joystick in port 2 is enabled in the VICE input device settings and configured for a keyboard keymap that works for you.

If you have native hardware, copy the D64 image to a floppy disk or load it via a device such as an SD2IEC. Assuming your floppy or SD2IEC drive is device #8, then issue the following commands:

    LOAD "YUMYUMDONUT",8
    RUN

### Game Play

You are a panda with a hankering for a delicous donut. Upon taking your first bite, you are surprised to see the donut running away! It is so tasty, you must pursue it and take as many yummy bites as possible.

Use the joystick (in port 2) to move the panda in pursuit of the donut. Each successful bite adds one to your score of Yum!

### BASIC Source Code Explanation

    1 q=54272:s=12288:v=53248:poke52,48:poke56,48:poke2040,192:poke2041,193:y=0:h=1
    2 pokev+1,99:pokev+21,3:pokev+28,1:pokev+39,1:pokev,99:gosub8:gosub8:r=56320
    3 onkgosub10,10,10,10:f=(peek(v+30)and1):onfgosub9:j=rnd(1)*2+2:gosub10:z=rnd(1)
    4 f=(peek(r)and15):k=(f-int(f/5)*5):j=int((k-1)/2):d=(2*(k-int(k/2)*2)-1)*z*37
    5 data 3,234,240,3,170,176,2,170,160,2,251,224,2,251,224,2,234,224,2,238,224
    6 data 2,174,160,2,191,160,2,170,160,2,170,160,0,0,0,0,0,0,0,12,0,0,63,0,0,51
    7 data 0,0,97,128,0,97,128,0,51,0,0,63,0,0,12,0,0,0,0,0,0:pokeq+4,0:goto3
    8 z=y+33:forx=ytoz:reada:pokes+x,a:next:forx=ztoz+63:pokes+x,0:next:y=x:return
    9 print"{clr}{home}yum! ";h:h=h+1:pokeq+5,6:pokeq+4,17:pokeq+24,9:pokeq+1,24:pokeq,155
    10 x=peek(v+(j-int(j/2)*2))+d:x=x-int((x)/239)*239:pokev+j,x:j=int(j/2)*2:return

### BASIC 10Liner Contest Rules

This is an entry in the Category "PUR-80":

> Program a game in 10 lines (max 80 characters per logical line, abbreviations are allowed).
>
> Attention: In this category, only factory built-in BASIC variants are allowed

**Rules:**
1. Loading of data or program parts from mass storage is not allowed
2. The 10 lines must not contain any machine programs
3. Programs may be compiled (source must still be submitted)
4. All code must be visible in the listing: self-modifying code or hidden initializations are not allowed
5. POKEs are allowed
6. Deadline for submissions: Saturday, March 25, 2023, 6 p.m. CET
7. Award ceremony: Saturday, April 1, 2023 at NOMAM
8. Voting by a panel of judges
"Public's Choice" special award on bunsen.itch.io 
9. The program must be submitted on a disk or tape image appropriate for the system
10. The program must be listable (The LIST command must produce a readable program listing)
11. Include the following in a ZIP file with your submission:  The program (on disk or tape image file); a text file with the program description and instructions; a short description of how to start the game via emulator;  a screenshot in jpg or png format (or an animated screenshot in gif format); a program listing, proving that the program does not have more characters than allowed in the category.
12. For program descriptions and code explanations there can be up to 0.5 bonus points in the rating
13. The contest entrants agree to a publication of the programs, the descriptions and the instructions by the organizer
