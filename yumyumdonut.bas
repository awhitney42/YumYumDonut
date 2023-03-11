    1 q=54272:r=56320:s=12288:v=53248:poke2040,192:poke2041,193:y=0:h=1
    2 pokev,50:pokev+1,80:pokev+21,3:pokev+28,1:pokev+39,1:gosub8:gosub8
    3 onkgosub10,10,10,10:f=(peek(v+30)and1):onfgosub9:j=rnd(1)*2+2:gosub10:z=rnd(1)
    4 f=(peek(r)and15):k=(f-int(f/5)*5):j=int((k-1)/2):d=(2*(k-int(k/2)*2)-1)*z*37
    5 data 3,234,240,3,170,176,2,170,160,2,251,224,2,251,224,2,234,224,2,238,224
    6 data 2,174,160,2,191,160,2,170,160,2,170,160,0,0,0,0,0,0,12,0,0,63,0,0,51
    7 data 0,0,97,128,0,97,128,0,51,0,0,63,0,0,12,0,0,0,0,0:pokeq+4,0:goto3
    8 z=y+32:forx=ytoz:reada:pokes+x,a:next:forx=z+1toz+31:pokes+x,0:next:y=x:return
    9 print"{clr}{home}yum! ";h:h=h+1:pokeq+5,6:pokeq+4,17:pokeq+24,9:pokeq+1,24:pokeq,155
    10 x=peek(v+(j-int(j/2)*2))+d:x=x-int((x)/239)*239:pokev+j,x:return
