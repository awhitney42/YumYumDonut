0 w=192:r=56320:s=w*64:v=53248:poke2040,w:poke2041,w+1:t$="{clr}{home}{wht}yum!":ti$="000000"
1 pokev,w/2:pokev+1,w:pokev+21,3:pokev+28,1:pokev+39,1:y=0:q=54272:gosub7:gosub7
2 onkgosub9,9,9,9:f=peek(v+30)and1:onfgosub8:j=z*2+2:gosub9:f=peek(r)and15
3 l=39:k=f-int(f/5)*5:d=(2*(int(k/2)-int(k/4)*2)-1)*z*l:b=h*z:ifti>r/8thenend
4 data3,234,240,3,170,176,2,170,160,2,251,224,2,251,224,2,234,224,2,238,224,2
5 data174,160,2,191,160,2,170,160,2,170,160,0,0,0,0,0,0,12,0,0,63,0,0,51,0,0,97
6 data128,0,97,128,0,51,0,0,63,0,0,12,0,0,0,0,0:j=int((k-1)/2):z=rnd(1):goto2
7 z=y+32:forx=ytoz:reada:pokes+x,a:next:forx=z+1toz+31:pokes+x,0:next:y=x:w=24
8 printt$h:h=h+1:pokeq+4,0:pokeq+4,17:pokeq+24,15:pokeq+5,6:pokeq+1,g:g=w+ti/300
9 c=j/2:x=peek(v+(j-int(c)*2))+d+(int(c)*b):x=x-int(x/239)*239:pokev+j,x:return
