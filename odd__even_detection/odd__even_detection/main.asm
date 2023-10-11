;
; odd__even_detection.asm
;
; Created: 6/15/2020 11:28:41 PM
; Author : Asus
;


;in this program we want to create e machine that detects odd and even numbers 

.include "m32def.inc"

ldi r16 , 0 
out ddra , r16 
ldi r16 , 0xff 
out porta , r16 ; set PORTA an input and enable pull-up

ldi r17 , 10    ; set counter 

ldi xl , low(0x060)
ldi xh , high(0x060) ;even numbers storing 
ldi yl , low(0x070)
ldi yh , high(0x070) ;odd numbers storing 
 

main : 
		in r16 , pina  
		mov r18 , r16 
		andi r16 , 0x00000001 ;in order to make decision if the result is zero so the entered number is even 
		breq EVEN
		st  y+ , r18
		rjmp LOOP
		EVEN : 
				st x+ , r18 
		 
		LOOP :	dec r17 
				brne main 
		HERE :	rjmp here

