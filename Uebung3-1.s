@ File: Uebung3-1.s 

        .text 
        .global Start 

@       ------------------------------------------------	
@          Erhoeht alle Elemente eines Integer-Arrays 
@          um den Wert 0x10.
@
@             int n = 10;
@             int scores[10] = {1,2,3,4,5,6,7,8,9,10};
@
@             for (int i=0;i<n;i++)
@                  scores[i] = scores[i]+0x10;
@
@       --------------------------------------------------
		
Start:
        ldr  r0,=scores   @ r0 = Basisadresse scores 
        ldr  r1,=n        @ r1 = Adresse von n 
        ldr  r1,[r1]      @ r1 = n
		
        mov  r2,#0        @ i=0
Loop:		
        cmp  r2,r1        @ for(i=0;i<n;i=i+1)
        bge  Done         @ i>=n: end for
		
        mov  r4,r2,lsl #2 @ r4=4*i (ssl r4,r2,#2)	
        ldr  r3,[r0,r4]   @ r3=scores[i]
		
        add  r3,r3,#0x10  @ r3=scores[i]+0x10	
        str  r3,[r0,r4]   @ scores[i]=r3
		
        add  r2,r2,#1     @ i=i+1
        b    Loop       
Done:  
        swi	 0x11         @ stop
		
@       --------------------------------------------------

        .data
n:      .word 10
scores: .word 1,2,3,4,5,6,7,8,9,10
        .end
