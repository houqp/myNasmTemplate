; test.asm 
;%include "io.mac"
;%include "asm_io.inc"
%include "myio.asm"

segment .date
	msg1 db "@-----set the zero flag-----",10,0
	msg1_len equ $-msg1
	nextline db 0x0d,0x0a,0

segment .bss
	a	resd	1
	re resd 1

segment .text
	global _start
	;global main

_start:
;main:

; Input the first number
		mov EAX,msg1
		
; go to next line
	;	mov EAX,nextline
	;	call print_string
	my_print nextline,3
		
	;	dump_regs 1

;exit progrem
my_exit
