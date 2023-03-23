**Yum Yum Donut**
**Commodore 64 Game**

- By Adam Whitney (Copyright 2023)
- 2023 BASIC 10Liner Contest Entry (https://bunsen.itch.io/)
- PUR-80 Category
- Written for Commodore 64 BASIC V2
- YumYumDonut on GitHub (https://github.com/awhitney42/YumYumDonut)**

## Intro

Yum Yum Donut is my first video game creation! It was inspired (and named) by my daughter, who loves pandas and believes that they should be able to enjoy delicious donuts too.

I created it as a contest entry into the [BASIC 10Liner Contest](https://www.homeputerium.de/) in the PUR-80 category.


## How to Play

You are a panda with a hankering for a scrumptious donut. When you try to take a bite, you are surprised to see the donut running away! It is so tasty, you must pursue it and take as many yummy bites as possible.

**Use the joystick to move the panda** in pursuit of the donut. Each successful bite increases your experience of Yum! Each bite also makes the donut harder to catch.

How many bites can you take in 90 seconds before the game is over?


## File List

- README.txt : README file containing the following:
  - Intro and Directions for How to Play
  - Starting the Game via Emulator (or Original C64 Hardware)
  - File List
  - Full Program Listing for PUR-80 Category (10 Lines with 80 Characters Max)
  - BASIC Code Explanation
- yumyumdonut.bas : BASIC program code listing
- yumyumdonut.prg : Yum Yum Donut Commodore 64 Program
- yumyumdonut.d64 : Yum Yum Donut Commodore 64 Disk Image
- Yum Yum Donut - Game Cover Art.jpg : Game Cover Art
- Yum Yum Donut - Game.png : Game Screenshot
- Yum Yum Donut - Program Listing.png : Program Listing Screenshot


## Starting the Game via Emulator (or Original C64 Hardware)

Drag YUMYUMDONUT.PRG to your VICE emulator to load the game. Make sure the joystick in port 2 is enabled in the VICE input device settings, and that the joystick is configured for a keyboard mapping that works for you.

If you have original hardware, then copy the YUMYUMDONUT.D64 image to a floppy disk or load it via a device such as an SD2IEC. Assuming your floppy or SD2IEC drive is device #8, then issue the following commands:

    LOAD "YUMYUMDONUT",8
    RUN

Type LIST you want to see the program listing:

    LOAD "YUMYUMDONUT",8
    LIST


## Full Program Listing for PUR-80 Category (10 Lines with 80 Characters Max)

Below is the *entire* 10-line BASIC program listing for Yum Yum Donut.2

    0 s=12288:v=53248:poke2040,192:poke2041,193:t$="{clr}{home}donut! yum":ti$="000000"
    1 pokev,50:pokev+1,80:pokev+21,3:pokev+28,1:pokev+39,1:q=54272:y=0:gosub7:gosub7
    2 onkgosub9,9,9,9:j=z*2+2:f=peek(v+30)and1:onf+1gosub9,8:f=peek(56320)and15
    3 k=f-int(f/5)*5:d=(2*(int(k/2)-int(k/4)*2)-1)*z*33:b=h*z:z=rnd(1):ife>90thenend
    4 data3,234,240,3,170,176,2,170,160,2,251,224,2,251,224,2,234,224,2,238,224,2
    5 data174,160,2,191,160,2,170,160,2,170,160,0,0,0,0,0,0,12,0,0:ife>70thena$="{yel}"
    6 data63,0,0,51,0,0,97,128,0,97,128,0,51,0,0,63,0,0,12,0,0,0,0,0:j=-(k>2):goto2
    7 z=y+32:forx=ytoz:reada:pokes+x,a:next:forx=z+1toz+31:pokes+x,0:next:y=x:a$="{wht}"
    8 g=24+e/5:printt$a$h:h=h+1:pokeq+4,0:pokeq+4,17:pokeq+24,15:pokeq+5,6:pokeq+1,g
    9 c=-(j>1):x=peek(v+(j-c*2))+d-(c*b):x=x-int(x/239)*239:pokev+j,x:e=ti/60:return

The BASIC 10Liner Contest is an extreme challenge of creating an entire video game in 10 lines of BASIC code.

In order to create a game in 10 lines, multiple BASIC statements are included on each line, separated by the : character.

Each logical line has a max of 80 characters allowed for the PUR-80 category. Loading of data or program parts from mass storage is not allowed. The 10 lines cannot contain any machine code—it must simply use the factory built-in BASIC for an 8-bit machine, in this case BASIC V2 on the Commodore 64.


## BASIC Code Explanation

### Line 0 : Set Memory Location Constants, Sprite Pointers, Scoreboard Message, and Reset System Timer
  - `s` : Sprite Data Memory Location at 12288
  - `v` : Sprite Control at 53248
  - `poke2040,192:poke2041,193` : Sprite Data Memory Pointers at 192 * 64 = 12288 and 193 * 64 = 12352
  - `t$` : Scoreboard Message
  - `ti$="000000"` : Reset System Timer
### Line 1 : Set Sprite Properties, SID Address, and Draw Sprite Data
  - `pokev,50:pokev+1,80` : Set X/Y Coordinates of Panda Sprite
  - `pokev+21,3` : Enabled Sprites 0 and 1 (Panda and Donut)
  - `pokev+28,1` : Enabled Multi-Color Mode on Sprite 0
  - `pokev+39,1` : Set Main Sprite Color to White
  - `q` : SID Chip Control at 54272
  - `y` : Initial Sprite Memory Offset to 0
  - `gosub7:gosub7` : Call SUB 7 Twice to Draw Both Sprites
### Line 2 : Start of Main Loop - Call Sprite Movement Subroutines, Check for Sprite Collision, and Read Joystick Position
  - `on k gosub 9,9,9,9` : On Joystick Push (k is 1, 2, 3, or 4) Then Call Sprite Movement Subroutine 9
  - `j=z*2+2` : Set Random Donut Movement Axis
  - `f=peek(v+30) and 1` : Check for Sprite Collision
  - `on f+1 gosub 9,8` : If No Collision Then Call Sprite Movement Subroutine 9 ; If Collision then Call Scoreboard Subroutine 8
  - `f=peek(56320) and 15` : Check for Joystick Push
### Line 3 : Calculate Sprite Movement Values and Check Game Timer
  -  `k=f-int(f/5) * 5` : Determine Joystick Direction
  -  `d=(2 * (int(k/2) - int(k/4) * 2) - 1) * z * 33` : Calculate Sprite Movement Direction and Amount
  -  `b=h*z` : Additional Donut Jump As Score Increases
  -  `z=rnd(1)` : Set Random Number for Next Loop Iteration
  -  `if e>90 then end` : If Game Timer > 90 Seconds Then Game Over
### Line 4 : Sprite Shape Data
  - Sprite Data Bytes  
### Line 5 : More Sprite Shape Data and Scoreboard Color for Game End
   - More Sprite Data Bytes
   - `if e>70 then a$="{yel}` : If Game Timer > 70 Seconds Then Set Scoreboard to Yellow
### Line 6 : More Sprite Shape Data, Calculate Panda Movement Axis, and Keep Looping
   - More Sprite Data Bytes
   - `j=-(k>2)` : Set Panda Movement Axis Based on Joystick Direction
   - `goto 2` : Loop Back to Line 2
### Line 7 : SUBROUTINE - Read Sprite Data and Draw (Poke) Sprites Into Memory
   - `z=y+32:for x=y to z:read a:pokes+x,a:next` : Read 33 Bytes of Sprite Data and Poke into Memory
   - `for x=z+1 to z+31:pokes+x,0:next` : Poke Zero into Remaining Sprite Memory
   - `y=x` : Set Sprite Memory Offset for Next Run
   - `a$="{wht}"` : Set Initial Scoreboard Color to White
### Line 8 : SUBROUTINE - Increment Scoreboard and Play Sound Effects
  - `g=24+e/5` : Set Sound Frequency to Increase as Game Timer Increases
  - `print t$ a$ h` : Print Scoreboard Color, Message, and Score
  - `h=h+1` : Increment Score
  - `pokeq+4,0` : Reset Sound Chip
  - `pokeq+4,17` : Set Sound Waveform to Triangle
  - `pokeq+24,15` : Set Sound Volume to Max
  - `pokeq+5,6` : Set Sound Decay to 6
  - `pokeq+1,g` : Set Sound Frequency for Boop! Sound Effect
### Line 9 : SUBROUTINE - Move A Sprite Based on Current Sprite Position and Movement Amount
  - `c=-(j>1)` : Set Additional Jump Flag (0 for Panda, 1 for Donut)
  - `x=peek(v + (j - c * 2)) + d - (c * b)` : Calculate New Sprite Coordinate Based on Sprite Selector (j), Additional Jump Flag (c), Direction and Amount (d), and Additional Jump Value (b)
  - `x=x-int(x/239) * 239` : Make Sure New Coordinate is Within Screen Dimensions
  - `pokev+j,x` : Move the Sprite
  - `e=ti/60` : Update Elapsed Timer
  - `return` : Return to Main Program Loop
  
