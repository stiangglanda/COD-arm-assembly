@ File: copyStrTest.s 

        .text 
        .global copyStrTest 
	
@      	====================================================
@      
@      	Testfälle für Unterprogramm copyStr:				
@      		Test-1: source und target mit gleicher Länge
@      		Test-2: target kürzer als source
@      		Test-3: source kürzer als target 
@           Test-4: source und target mit gleicher Länge
@      
@       ====================================================

copyStrTest:	
		
		@ -------- Test-1 ----------------------------------
	    
		ldr		r0,=source1  @ Source-String
		ldr		r1,=target1  @ Target-String
		ldr		r2,=code1		
		bl		copyStr
		str		r0,[r2]      @ Return-Code1 speichern	
		
		@ ------- Test-2 -----------------------------------
		
		ldr		r0,=source2  @ Source-String
		ldr		r1,=target2  @ Target-String
		ldr		r2,=code2		
		bl		copyStr
		str		r0,[r2]      @ Return-Code2 speichern	

		@ ------- Test-3 -----------------------------------

		ldr		r0,=source3  @ Source-String
		ldr		r1,=target3  @ Target-String
		ldr		r2,=code3		
		bl		copyStr
		str		r0,[r2]      @ Return-Code3 speichern
        
        @ ------- Test-4 -----------------------------------

		ldr		r0,=source4  @ Source-String
		ldr		r1,=target4  @ Target-String
		ldr		r2,=code4		
		bl		copyStr
		str		r0,[r2]      @ Return-Code4 speichern
     
		@ --------------------------------------------------		
		
		swi	0x11			@ Stop
        
        @ --------------------------------------------------

			.data
code1:		.word 81
code2:		.word 81
code3:		.word 81
code4:		.word 81		
source1:	.asciz "t:U"
target1:	.asciz "123"
source2:	.asciz "t:U"
target2:	.asciz "12" 
source3:	.asciz "t:U"
target3:	.asciz "12345"
source4:    .asciz "Das Studium 'HSD' im Überblick: [PDF-Datei, 2 MB]" 
target4:    .asciz "                                                 "
			.end
