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

You are a panda with a hankering for a scrumptious donut. When you try to take a bite, you are surprised to see the donut running away! It is so tasty, you must pursue it and take as many yummy bites as possible.

Use the joystick (in port 2) to move the panda in pursuit of the donut. Each successful bite increases your experience of Yum!

### BASIC Source Code Explanation

The BASIC 10Liner Contest creates the extreme challenge of creating an entire video game in 10 lines of BASIC code. Each logical line has a max of 80 characters allowed. Loading of data or program parts from mass storage is not allowed. The 10 lines cannot contain any machine code—it must simply use the factory built-in BASIC for an 8-bit machine, in this case BASIC 2 on the Commodore 64.

Below is the entire 10-line BASIC program listing for Yum Yum Donut. In order to create a game in 10 lines, multiple BASIC statements are included on each line, separated by the : character.

    1 q=54272:s=12288:v=53248:poke52,48:poke56,48:poke2040,192:poke2041,193:y=0:h=1
    2 pokev,99:pokev+1,99:pokev+21,3:pokev+28,1:pokev+39,1:gosub8:gosub8:r=56320
    3 onkgosub10,10,10,10:f=(peek(v+30)and1):onfgosub9:j=rnd(1)*2+2:gosub10:z=rnd(1)
    4 f=(peek(r)and15):k=(f-int(f/5)*5):j=int((k-1)/2):d=(2*(k-int(k/2)*2)-1)*z*37
    5 data 3,234,240,3,170,176,2,170,160,2,251,224,2,251,224,2,234,224,2,238,224
    6 data 2,174,160,2,191,160,2,170,160,2,170,160,0,0,0,0,0,0,0,12,0,0,63,0,0,51
    7 data 0,0,97,128,0,97,128,0,51,0,0,63,0,0,12,0,0,0,0,0,0:pokeq+4,0:goto3
    8 z=y+33:forx=ytoz:reada:pokes+x,a:next:forx=ztoz+63:pokes+x,0:next:y=x:return
    9 print"{clr}{home}yum! ";h:h=h+1:pokeq+5,6:pokeq+4,17:pokeq+24,9:pokeq+1,24:pokeq,155
    10 x=peek(v+(j-int(j/2)*2))+d:x=x-int((x)/239)*239:pokev+j,x:j=int(j/2)*2:return

Here is an explanation of what is happening in each of these lines.

Lines 1 and 2 are the main initialization sequence.

`1 q=54272:s=12288:v=53248:poke52,48:poke56,48:poke2040,192:poke2041,193:y=0:h=1`

- q=54272 : **q** is the memory address for the SID (Sound Interface Device) chip. Referencing **q** later will allow setting values in the address space that controls sound effects for the game.
- s=12288 : **s** is the memory address for the sprite data. Referencing **s** later will allow setting values in the address space that draws the sprites for the game (i.e. the panda and the donut).
- v=53248 : **v** is the memory address for controlling the sprites. Referencing **v** later will allow setting values that control the properties and movment of the sprites.
- poke52,48:poke56,48 : These two lines move the BASIC end-of-strings and end-of-memory pointers to protect the sprite data at address 12288
- poke2040,192:poke2041,193 : These two lines set the pointers for Sprite 0 (panda) and Sprite 1 (donut). Each sprite is 64 bytes in length, so 192 * 64 = 12288 specifies the starting address of Sprite 0, and 193 * 64 = 12352 specifies the starting address of Sprite 1.
- y=0:h=1 : **y** and **h** are program variables that will be used later and required these intial values.

`2 pokev,99:pokev+1,99:pokev+21,3:pokev+28,1:pokev+39,1:gosub8:gosub8:r=56320`

- pokev,99:pokev+1,99 : If you recall **v** controls the sprites. These two lines set the X and Y position of Sprite 0 (panda). The position of Sprite 1 (donut) will be later set to be relative to the panda. X and Y values of 99 just barely get the sprite visible on the screen, but I didn't have enough space to set these to 3-digit numbers.

- pokev+21,3 : This is a bitmask byte to enable (make visible) the sprites. Setting this to a value of 3 (2+1) enables Sprites 0 and 1.
- pokev+28,1 : This turns on multi-color mode for the sprites. Setting this to a value of 1 enables multi-color mode for only Sprite 0, allowing the panda to have the black and white color pattern.
- pokev+39,1 : This sets the main sprite color of the panda sprite to be white.
- gosub8:gosub8 : The calls the subroutine at line 8 two times. Each time this runs, it loads the shape data for the each sprite.
- r=56320 : **r** is the memory address for reading the joystick in port2. Referencing **r** later will allow the program to detect joystick input.

Line 3 begins the main loop of the game. As the user plays, the program will jump here repeatedly until stopped by the user.
    
`3 onkgosub10,10,10,10:f=(peek(v+30)and1):onfgosub9:j=rnd(1)*2+2:gosub10:z=rnd(1)`

The first statement is `on k gosub 10, 10, 10, 10`. The **ON** keyword in Commodore BASIC 2 provides a way to jump to various sepcified program locations, either as a GOTO or a GOSUB based on an indexed variable. The ON keyword is used twice in this line and was a great way to save space in the control logic!

The `on k gosub 10, 10, 10, 10` evaluates the value if **k**, and then performs a GOSUB to line 10 if the value of **k** is 1, 2, 3, or 4. If **k** is less than 1 or more than 4, then no jump will be taken. We will later see that **k** will be set based on the state of the joystick, and the subroutine at line 10 controls the sprite movement appropriately for given values of **k**.

With the `f=(peek(v+30)and1)` statement, **v+30** is the memory location that indicates a sprite collision. The **f** variable is the result of a **PEEK** at the value in that location with a boolean **AND** operation with an operand of 1. Using an operand of 1 for this AND checks for any sprite collision with Sprite 0 (panda), where a resulting value of 1 indicates a collision with another sprite (the donut).

The next statement `on f gosub 9` will go to the subroutine at line 9 if the value of **f** is 1. In other words, if the sprites collide then GOSUB 9 will be performed. As you can probably guess, GOSUB 9 contains the actions for handling when the panda successfully takes a bite of the donut!

Next, `j=rnd(1)*2+2` sets a value of **j** where a value of 2 is added to a random floating point number between 0 and 2. In other words **j** will be some number between approximately 0.0001 and 3.9999. You will see the use of **j** in just a bit.

Now, `gosub10` is performed unconditionally. If you recall from above, GOSUB 10 is the subroutine that moves the sprites. This will be explained more when we cover line 10, but having this subroutine called unconditionally at this point with a random value of **j** allows for the donut to move around even when the panda remains stationary.

The final statement on this line `z=rnd(1)` places a random floating point number between 0 and 1 into the **z** variable.
 
`4 f=(peek(r)and15):k=(f-int(f/5)*5):j=int((k-1)/2):d=(2*(k-int(k/2)*2)-1)*z*37`

Line 4 contains most of the remainder of the main program loop, with the exception of a few statements at the end of line 7.

The first statement `f = (peek(r) and 15)` sets the variable **f** to be the result of a PEEK in location **r**, which is the address showing the current state of the joystick, with an AND operation with 15 as the second operand. With 15 as the operand for the AND, this produces the following results:

- 7 if the joystick is pushed right
- 11 if the joystick is pushed left
- 13 if the joystick is pushed down
- 14 if the joystick is pushed up
- 15 if the joystick is not pushed at all

The next three statements in this line set some critical variables that are used in the sprite movement routine that will be called in the next iteration of the main loop when line 3 is reached again. First the value of **k** is set, which if you recall will be used to perform an additional sprite movement at the start of line 3 iif k equals 1, 2, 3, or 4. As you probably can guess, **k** will be one of these four values if the joystick is pressed in the up, down, left, or right directions. This is done with `k = (f - int(f / 5) * 5)` or **f** MODULUS 5:

- 7 MOD 5 = 2 (Right)
- 11 MOD 5 = 1 (Left)
- 13 MOD 5 = 3 (Down)
- 14 MOD 5 = 4 (Up)
- 15 MOD 5 = 0 (No Direction Pushed)




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
