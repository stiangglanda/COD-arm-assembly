@ File: Modulo.s 

        .text 
        .global Start 

@       ------------------------------------------------	
@
@             unsigned int n = 10;
@             unsigned int m = 3;
@             unsigned int r = n;
@
@             while (r > m) {
@                  r = r - m;
@             }
@       --------------------------------------------------

Start:
        ldr  r1,=n         @ r1 = Adresse von n
        ldr  r1,[r1]       @ r1 = n

        ldr  r2,=m         @ r2 = Adresse von m
        ldr  r2,[r2]       @ r2 = m
		
        mov  r0, r1        @ r=n
Loop:		
        cmp  r0,r2         @ while (r > m)
        ble  Done          @ r<=m: end while
		
        sub  r0,r0,r2      @ r=r-m

        b    Loop 
Done:  
        ldr  r3,=r         @ r3 = Adresse von r
        str  r0,[r3]       @ r = r0
        swi  0x11          @ stop
		
@       --------------------------------------------------

        .data
n:      .word 27
m:      .word 5
r:      .word 0
        .end
