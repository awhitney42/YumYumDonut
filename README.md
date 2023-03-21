<picture><img src="https://adamwhitney.net/static/images/YumYumDonut-GameCoverArt.jpg" alt="Cover Art" width="200" height="320" style="display: block;margin-left: auto;margin-right: auto;width: 50%;"></picture>

# Yum Yum Donut
## Yum Yum Donut : Commodore 64 Game for the BASIC 10Liner Contest
**©2023 Adam Whitney**

### Intro

Yum Yum Donut is my first video game creation! I made it as an entry into the [BASIC 10Liner Contest](https://www.homeputerium.de/) in the PUR-80 Category and runs on the Commodore 64. It was inspired (and named) by my daughter, who loves pandas and believes that they should be able to enjoy delicious donuts too.

### Loading the Game

Drag yumyumdonut.prg to your VICE emulator to load the game. Make sure the joystick in port 2 is enabled in the VICE input device settings, and that it is configured for a keyboard keymap that works for you.

If you have native hardware, copy the D64 image to a floppy disk or load it via a device such as an SD2IEC. Assuming your floppy or SD2IEC drive is device #8, then issue the following commands:

    LOAD "YUMYUMDONUT",8
    RUN

### Game Play

You are a panda with a hankering for a scrumptious donut. When you try to take a bite, you are surprised to see the donut running away! It is so tasty, you must pursue it and take as many yummy bites as possible.

Use the joystick to move the panda in pursuit of the donut. Each successful bite increases your experience of Yum! Each bite also makes the donut harder to catch. How many bites can you take in 2 minutes before the game is over?

### BASIC Source Code Explanation

The BASIC 10Liner Contest is an extreme challenge of creating an entire video game in 10 lines of BASIC code. Each logical line has a max of 80 characters allowed. Loading of data or program parts from mass storage is not allowed. The 10 lines cannot contain any machine code—it must simply use the factory built-in BASIC for an 8-bit machine, in this case BASIC V2 on the Commodore 64.

Below is the entire 10-line BASIC program listing for Yum Yum Donut. In order to create a game in 10 lines, multiple BASIC statements are included on each line, separated by the : character.

    0 w=192:s=w*64:v=53248:poke2040,w:poke2041,w+1:t$="{clr}{home}{wht}donut! yum":ti$="000000"
    1 pokev,50:pokev+1,80:pokev+21,3:pokev+28,1:pokev+39,1:y=0:q=54272:gosub7:gosub7
    2 onkgosub9,9,9,9:j=z*2+2:f=peek(v+30)and1:onf+1gosub9,8:f=peek(56320)and15
    3 l=39:k=f-int(f/5)*5:d=(2*(int(k/2)-int(k/4)*2)-1)*z*l:b=h*z:ifti>q/7thenend
    4 data3,234,240,3,170,176,2,170,160,2,251,224,2,251,224,2,234,224,2,238,224,2
    5 data174,160,2,191,160,2,170,160,2,170,160,0,0,0,0,0,0,12,0,0,63,0,0,51,0,0,97
    6 data128,0,97,128,0,51,0,0,63,0,0,12,0,0,0,0,0:j=int((k-1)/2):z=rnd(1):goto2
    7 z=y+32:forx=ytoz:reada:pokes+x,a:next:forx=z+1toz+31:pokes+x,0:next:y=x:w=24
    8 printt$h:h=h+1:pokeq+4,0:pokeq+4,17:pokeq+24,15:pokeq+5,6:pokeq+1,g:g=w+ti/300
    9 c=int(j/2):x=peek(v+(j-c*2))+d+(c*b):x=x-int(x/239)*239:pokev+j,x:return

Here is an explanation of what happens in each of these program lines.


#### Line 0 : Set Memory Location Constants, Sprite Pointers, Scoreboard Message, and Reset System Clock ####

Lines 0 is the first of two lines that comprise the main initialization sequence.

`0 w=192:s=w*64:v=53248:poke2040,w:poke2041,w+1:t$="{clr}{home}{wht}donut! yum":ti$="000000"`

- w=192 : **w** is the a constant value 192 that will be used for the sprite data memory and associated pointers.
- s=w*64 : **s** is the memory address for the sprite data. Referencing **s** later will allow setting values in the address space that draws the sprites for the game (i.e. the panda and the donut). The memory address is calculated here as w * 64 = 12288.
- v=53248 : **v** is the memory address for controlling the sprites. Referencing **v** later will allow setting values that control the properties and movment of the sprites.
- poke2040,w:poke2041,w+1 : These two lines set the pointers for Sprite 0 (panda) and Sprite 1 (donut), and are based on the **w** constant of 192. Each sprite is 64 bytes in length, so 192 * 64 = 12288 specifies the starting address of Sprite 0, and 193 * 64 = 12352 specifies the starting address of Sprite 1.
- t$="{clr}{home}{wht}donut! yum" : **t$** is the message that will be printed on the game scoreboard at the top of the screen.
- ti$="000000" : This sets the system clock to 00:00:00 to start the game's countdown timer.

*Note:* All the books would correctly have you add two more statements to the game initialization code:

`poke52,48:poke56,48` : These two lines move the BASIC end-of-strings and end-of-memory pointers to protect the sprite data at address 12288

As our BASIC program will never use that much dynamic free memory, we can safely omit these statements to save space.


#### Line 1 : Set Sprite Properties, SID Address, and Draw Sprite Data ####

`1 pokev,w/2:pokev+1,w:pokev+21,3:pokev+28,1:pokev+39,1:y=0:q=54272:gosub7:gosub7`

- pokev,50:pokev+1,80 : If you recall, **v** is the memory address for controlling the sprites. These two lines set the X and Y position of Sprite 0 (panda). The position of Sprite 1 (donut) will be later set to random coordinates. The X and Y values of 50 and 80 respectively get the panda sprite visible and positioned on the screen.
- pokev+21,3 : This is a bitmask byte to enable (make visible) the sprites. Setting this to a value of 3 (2+1) enables Sprites 0 and 1.
- pokev+28,1 : This turns on multi-color mode for the sprites. Setting this to a value of 1 enables multi-color mode for only Sprite 0, allowing the panda to have the black and white color pattern.
- pokev+39,1 : This sets the main sprite color of the panda sprite to be white.
- q=54272 : **q** is the memory address for controlling the SID (Sound Interface Device). Referencing **q** later will allow for controlling the game's sound effects.
- y = 0 : **y** will be the counter used for populating the sprite data in line 7.
- gosub7:gosub7 : The calls the subroutine at line 7 two times. Each time this runs, it loads the shape data for the each of the two sprites.


#### Line 2 : Start of Main Loop - Call Sprite Movement Subroutines, Check for Sprite Collision, and Read Joystick Position ####

Line 2 begins the main loop of the game. As the user plays, the program will jump here repeatedly until the game ends.
    
`2 onkgosub9,9,9,9:j=z*2+2:f=peek(v+30)and1:onf+1gosub9,8:f=peek(56320)and15`

The first statement in this line uses the **ON** keyword in Commodore BASIC 2 provides a way to jump to various sepcified program locations, either as a GOTO or a GOSUB based on an indexed variable. The ON keyword is used twice in this line and was a great way to save space in the control logic!

The `on k gosub 9, 9, 9, 9` statement evaluates the value of **k**, and then performs a GOSUB to line 9 if the value of **k** is 1, 2, 3, or 4. If **k** is less than 1 or more than 4, then no jump will be taken. We will later see that **k** will be set based on the state of the joystick, and the subroutine at line 9 controls the sprite movement appropriately for given values of **k** as well as other variables **d** and **j**, whose values will be calcuated based on **k** prior to calling the subroutine.

Then `j=z*2+2` sets a value of **j** to be a random floating point number between approximately 2.0001 and 3.9999. You will see the use of **j** in just a bit.

With the `f= peek(v + 30) and 1` statement, **v+30** is the memory location that indicates a sprite collision. The **f** variable is the result of a **PEEK** at the value in that location with a boolean **AND** operation with an operand of 1. Using an operand of 1 for this AND checks for any sprite collision with Sprite 0 (panda), where a resulting value of 1 indicates a collision with another sprite (the donut).

The next statement `onf+1gosub9,8` will go to the subroutine at line 9 if the value of **f** is 0 or the subroutine at line 8 if the value is 1. In other words, if the sprites did not collide then GOSUB 9 will be performed, which will cause the donut to move at this point. If the sprites did collide, however, then GOSUB 8 will be performed. As you can probably guess, subroutine 8 contains the actions for handling when the panda successfully takes a bite of the donut!

The last statement `f=peek(56320)and15` sets the variable **f** to be the result of a PEEK in location **56320**, the address showing the current state of the joystick, with an AND operation using 15 as the second operand. The value of 15 for the second operand for AND produces the following results:

- 7 if the joystick is pushed right
- 11 if the joystick is pushed left
- 13 if the joystick is pushed down
- 14 if the joystick is pushed up
- 15 if the joystick is not pushed at all
 
 
#### Line 3 : Calculate Sprite Movement Values and Check Game Timer ####
 
`3 l=39:k=f-int(f/5)*5:d=(2*(int(k/2)-int(k/4)*2)-1)*z*l:b=h*z:ifti>q/7thenend`

Line 4 contains most of the remainder of the main program loop, with the exception of a few statements at the end of line 6.

The statements in this line set some essential variables that are used in the sprite movement routine, which will be called in the next iteration of the main loop when line 2 is reached again.

First, a constant **l** is set to 39. This contant is used in the sprite movement calculation.

Next the value of **k** is set, which if you recall will be used to perform a sprite movement at the start of line 2 if k equals 1, 2, 3, or 4. As you probably can guess, **k** will be one of these four values if the joystick is pressed in the up, down, left, or right directions. This is done with `k = f - int(f / 5) * 5` or **f** MODULO 5:

**k**:
- 11 MOD 5 = **1 (Left)**
-  7 MOD 5 = **2 (Right)**
- 13 MOD 5 = **3 (Down)**
- 14 MOD 5 = **4 (Up)**
- 15 MOD 5 = *0 (No Direction Pushed)*

The next statement in this line `d=(2 * (int(k / 2) - int(k / 4) * 2) - 1) * z * l` sets **d** to a value that is based largely on **k**. At the end of the expression, you can see `* z * l`. As you will see in line 6, **z** is a random floating point number between 0 and 1, which applies some randomness to the final value of **d**. This is then multiplied by a constant value of **l** or 39. Using 39 applies a reasonable amount of distance on the screen when the sprites are moved in the subroutine at line 9. 

So **d** as derived from **k**, before the random jump value is applied, will be the following values:
- (2 * (INT(0/2) - INT(0/4) * 2) - 1) = **-1 (No Movement)**
- (2 * (INT(1/2) - INT(1/4) * 2) - 1) = **-1 (Left)**
- (2 * (INT(2/2) - INT(2/4) * 2) - 1) = **1 (Right)**
- (2 * (INT(3/2) - INT(3/4) * 2) - 1) = **1 (Down)**
- (2 * (INT(4/2) - INT(4/4) * 2) - 1) = **-1 (Up)**

As you can see, **d** is either positive or negative based on the joystick direction, and the sprite will therefore either increase or decrease its X/Y coordinates based on **d**, moving it in the correct direction.

If there is no joystick movement and **k** is -1, then **d** will be evaluated to `(2 * (0 - int(0 / 2) * 2) - 1) * z * l` or `-1 * z * l`. As **z** is a random number between 0 and 1, the resulting **d** will be a random value between 0 and -39, providing the random jump distance for the donut. 

The next statement is `b = h * z`. If you recall, **z** is a random floating point number between 0 and 1. As you will see in line 8, **h** is the current score. So, the value of **b** calculated here will be a fraction of the current score, that will become randomly larger (on average) as the score increases. This **b** value will be used in the sprite movement subroutine on line 9 to jump the donut a larger distance as the score increases, making the game progressively more difficult.

The final statement in this line `if ti > q / 7 then end` checks the built-in system timer variable TI to see if it exceeds approximately 120 seconds. If so, then the game will be over. This gives the panda only 2 minutes per gameplay to eat the donut!


#### Line 4 : Sprite Shape Data ####

Lines 4, 5, and 6 hold the sprite data that defines the shapes of the panda and donut sprites. Each sprite has the same amount of shape data (33 bytes), so that the subroutine at line 7 that POKEs (draws) the sprite into memory could be run without needing to specify the sprite size and thereby saving space in this 10-line program.

`4 data3,234,240,3,170,176,2,170,160,2,251,224,2,251,224,2,234,224,2,238,224,2`


#### Line 5 : More Sprite Shape Data ####

`5 data174,160,2,191,160,2,170,160,2,170,160,0,0,0,0,0,0,12,0,0,63,0,0,51,0,0,97`


#### Line 6 : More Sprite Shape Data, Calculate Panda Movement Axis, Get New Random Number, and Keep Looping ####

Line 7 has the remainder of the sprite data. There are three additional statements at the end.

`6 data128,0,97,128,0,51,0,0,63,0,0,12,0,0,0,0,0:j=int((k-1)/2):z=rnd(1):goto2`

After the sprite data in line 6, the next statement `j = int((k - 1) / 2)` sets **j** to the following values based on **k**:

**j**:
- INT((0 - 1) / 2) = *-1 (No Movement)*
- INT((1 - 1) / 2) = **0 (Left)**
- INT((2 - 1) / 2) = **0 (Right)**
- INT((3 - 1) / 2) = **1 (Down)**
- INT((4 - 1) / 2) = **1 (Up)**

`z=rnd(1)` places a random floating point number between 0 and 1 into the **z** variable.

The last statement is the final statement in the program's main loop. `goto 2` does just that! It jumps to line 2, starting the main loop all over again!


#### Line 7 : SUBROUTINE - Read Sprite Data and Poke It Into Memory ####

Line 7 is the first of three subroutines in the program. This subroutine is called twice in line 2 to draw (POKE) the sprite shape data into memory, starting at the location stored in **s** that holds the memory address of the start of Sprite 0.

`7 z=y+32:forx=ytoz:reada:pokes+x,a:next:forx=z+1toz+31:pokes+x,0:next:y=x:w=24`

This subroutine has two loops. The first FOR loop starts at the value in **y** (which is initially set to 0 on line 1) and then loops each iteration by 1 until it reaches y + 32, in order to load 33 bytes of data into each sprite data location in memory. The loop iterator index **x** is added to the sprite memory location **s** (memory location 12288) to specify where to POKE the sprite data byte into memory. So when this subroutine runs the first time, the first loop POKEs data into 12288+0 to 12288+32 to draw Sprite 0.

During each iteration of this loop, it READs the sprite data from the DATA bytes contained in lines 4 through 6.

The second FOR loop in this subroutine writes zeroes to the remaining sprite data memory to make sure that is cleared out and the sprite shape is drawn as intended. It loops from **z + 1** (**z** as you may recall is **y + 32**) until **z + 31** to reach the 64th and final sprite data byte. So, the first time this subroutine runs, the second FOR loop POKEs a 0 byte into 12288+33 to 12288+63 to finish drawing Sprite 0.

The next statement in this sub is `y=x`. After the first run, this sets the **y** value to 63. This value will POKE the sprite data into 12288+63 to 12288+127 when this subroutine is called a second time to draw Sprite 1.

The final statement in this sub is `w=24`. This sets the baseline sound effect frequency value used in SUB 8.


#### Line 8 : SUBROUTINE - Increment Score and Play Sound Effects ####

When the sprites collide, subroutine 8 is called. This increments the Yum score shown on the screen and then plays a sound effect.

`8 printt$h:h=h+1:pokeq+4,0:pokeq+4,17:pokeq+24,15:pokeq+5,6:pokeq+1,g:g=w+ti/300`

The `print t$ h` statement prints the scoreboard message in **t$** followed by the current YUM! score **h** to the top of the screen.

The `h=h+1` statement obviously increments the score counter.

The remaining statements that POKE to t**q** control the SID sound chip in order to play the sound effects.

`pokeq+4,0` resets the SID chip to ready it for the sound

`pokeq+4,17` selects the triangle waveform

`pokeq+24,15` sets the volume to 15 (max volume).

`pokeq+5,6` sets the attack and decay values to 6 (attack = 0, decay = 6)

`pokeq+1,g` sets the high frequency (pitch) to the value stored in **g**.

`g = w + ti / 300` sets the sound frequency value for next time. The value of **g** is set to the constant **w** (a value of 24 set in line 7) plus the current system timer value divided by 300. The result is that the pitch of the sound effect increases in frequency every few seconds as the game goes on, adding a sense of urgency and an indicator for how much time may be left before the game is over.

This results in a very arcade-like "Boop!" sound every time the panda bites the donut, adding significantly to the gameplay experience!

If you have eagle eyes, you may have noticed that lines 7 and 8 don't end with a RETURN even though they are subroutines. Omitting the RETURNs saves space. So, at the conclusion of both subroutines 7 and 8, the program continues along and runs the subsequent subroutines. The program is structured such that that running line 8 and/or line 9 immediately after running the previous line(s) has no negative effect on the program. For example, in the case of running line 9 immediately after calling line 8 due to a sprite collision, this will have the effect of simply moving the donut sprite after the collision.


#### Line 9 SUBROUTINE - Move A Sprite Based on Current Sprite Position and Movement Amount ####

All of the sprite movement is performed by the tenth and final line of the program. This subroutine is called by line 2 at least once per program loop, and the **j**, **d**, and **b** values are used to specify which sprite to move, which direction to move it, and by what amount.

`9 c=int(j/2):x=peek(v+(j-c*2))+d+(c*b):x=x-int(x/239)*239:pokev+j,x:return`

This line still seems like a bit of magic to me, and I wrote it! The BASIC code, however, is actually quite simple once you understand the possible values of **j** and **d** that might be present when the sub is called and how they affect the sprite movement. The explanation here is very long, but the goal is to sure it is understood how this one line (interacting with lines 2, 3, and 6 where **j** and **d** are calculated) can control all sprite movement in the entire game!

The first statement `c=int(j/2)` calculates a value of **c** as follows:

- **c** = **0** if **j** is 0 or 1
- **c** = **1** if **j** is 1 or 2

The next statement `x = peek( v + (j - c * 2)) + d + (c * b)` calculates the coordinate to use for moving the sprite.

The coordinates of the current position of both sprites are always as follows:

- **v + 0** : the X position of Sprite 0 (panda)
- **v + 1** : the Y position of Sprite 0 (panda)
- **v + 2** : the X position of Sprite 1 (donut)
- **v + 3** : the Y position of Sprite 1 (donut)

**Moving the Panda Based on Joystick Push**

If sub 9 gets called from line 2 when the joystick has been pushed, the value of **j** will be based on the joystick position:

- **j** = INT((**1** - 1) / 2) = **0** (left)
- **j** = INT((**2** - 1) / 2) = **0** (right)
- **j** = INT((**3** - 1) / 2) = **1** (down)
- **j** = INT((**4** - 1) / 2) = **1** (up)

So, using this value of **j**, the following coordinates will be PEEKed:

- j = 0 : PEEK(v + 0) : X coordinate of Sprite 0 (panda) : joystick was pushed left or right
- j = 1 : PEEK(v + 1) : Y coordinate of Sprite 0 (panda) : joystick was pushed up or down

In the middle of the expression in this statement `x = peek( v + (j - c * 2)) + d + (c * b)`, the value of **d** is added to the coordinate value retrieved by the PEEK. If you recall from line 4, **d** will be either a positive or negative value (to move up or left for a negative value, down or right for a positive one).

At the end of the expression, `(c * b)` is added to the coordination. This value will only be non-zero if the donut sprite is selected. So, in the case covered here for a joystick push and panda movement, this will be zero.

When completed, this statement produces an **x** value that will be a coordinate moving the panda sprite either up or down by a certain amount if the joystick was pushed in the up or down directions, or left or right by that amount if the joystick was pushed in those directions.

The next statement `x = x - int((x) /239) * 239` or `x = x MOD 239` adjusts the destination coordinate using the modulo operator to make sure it doesn't land outside the bounds of the screen coordinates. This allows the sprite to enter the far side of the screen, PAC-MAN style, if it exits the other side and thereby avoids crashing the program.

The next statement `poke v + j, x` simply moves the sprite to the **x** coordinate using the **j** index! As we just discussed, **j** will be 0 or 1 when this sub is called after the joystick is moved, so this always moves the panda (Sprite 0) whenever the joystick is moved, allowing the user to control only the panda!

Finally, the subroutine RETURNs to line 2.

**The Random Jumping Donut**

At this point in the program execution, regardless of whether or not sub10 was just called because of a joystick push, line 3 will now calculate the value of **j** to be `j=z*2+2`, setting it to be **some random number between approximately 2.0001 and 3.9999**.

Given these values of **j**, when sub 9 runs `x = peek( v + (j - c * 2)) + d + (c * b)` this will PEEK the following locations:

- j >=2 and j < 3 : PEEK(v + 0) : **X** coordinate of Sprite 0 (**panda**)
- j >=2 and j < 4 : PEEK(v + 1) : **Y** coordinate of Sprite 0 (**panda**)

(You will see that PEEK and POKE both accept the input of `v + j` in line 10, where **j** is a floating point number, so they must simply run INT on this value internally.)

So, in the expression `x = peek( v + (j - c * 2)) + d + (c * b)` the value from the PEEK will be based on the position of the panda.

With there having been no joystick movement, **d** will always be a negative random number between 0 and 39 based on the calculation in line 3.

At the end of the expression `(c * b)` is added to the coordination in the case where the donut is moving. If you recall, **c** will be 1 when the donut sprite is selected and **b** is a random value that increases in magnitude as the game score increases. This results in the **x** coordinate that is on average farther away from the panda as the score increases, making it progressively harder to catch!

So, the final value of **x** from this statement therefore will be the current X or Y coordinate of the panda plus some random distance. Therefore the donut will always move some random amount relative to the current position of the panda.

Now you can understand the sprite movement for the game. When line 9 runs, either the panda is moved in a controlled direction specified by the joystick push or the donut makes a random jump!

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
