0 s=12288:v=53248:poke2040,192:poke2041,193:t$="{clr}{home}donut! yum":ti$="000000"
1 pokev,50:pokev+1,80:pokev+21,3:pokev+28,1:pokev+39,1:q=54272:y=0:gosub7:gosub7
2 onkgosub9,9,9,9:j=z*2+2:f=peek(v+30)and1:onf+1gosub9,8:f=peek(56320)and15
3 k=f-int(f/5)*5:d=(2*(int(k/2)-int(k/4)*2)-1)*z*37:b=h*z:z=rnd(1):ife>90thenend
4 data3,234,240,3,170,176,2,170,160,2,251,224,2,251,224,2,234,224,2,238,224,2
5 data174,160,2,191,160,2,170,160,2,170,160,0,0,0,0,0,0,12,0,0:ife>70thena$="{yel}"
6 data63,0,0,51,0,0,97,128,0,97,128,0,51,0,0,63,0,0,12,0,0,0,0,0:j=-(k>2):goto2
7 z=y+32:forx=ytoz:reada:pokes+x,a:next:forx=z+1toz+31:pokes+x,0:next:y=x:a$="{wht}"
8 g=24+e/5:printt$a$h:h=h+1:pokeq+4,0:pokeq+4,17:pokeq+24,15:pokeq+5,6:pokeq+1,g
9 c=-(j>1):x=peek(v+(j-c*2))+d-(c*b):x=x-int(x/239)*239:pokev+j,x:e=ti/60:return
