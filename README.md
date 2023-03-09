# YumYumDonut
YumYumDonut : Commodore 64 Game Entry for the 10Liner Video Game Challenge
(c)2023 Adam Whitney

Intro:

YumYumDonut is the first video game I have ever written. It was inspired by my daughter, who loves pandas and believes that they should be able to enjoy delicious donuts as well.

Loading the Game:

Drag yumyumdonut.D64 to your VICE emulator to load the game. Make sure the joystick in port 2 is enabled in the settings to a keyboard keymap that works for you.

If you have native hardware, copy the D64 image to a floppy disk or load it via a device such as SD2IEC. Assuming your floppy or SD2IEC drive is device #8, then issue the following commands:

    LOAD "YUMYUMDONUT",8
    RUN

Game Play:

You are a panda with a hankering for a delicous donut. Upon taking your first bite, you are surprised to see the donut running away! It is so tasty, you must pursue it and take as many yummy bites as possible.

Use the joystick (in port 2) to move the panda in pursuit of the donut. Each successful bite adds one to your score of Yum!

BASIC Source Code Explanation:

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
