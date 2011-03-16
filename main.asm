; test.asm 
;%include "io.mac"
%include "asm_io.inc"

segment .date
	msg1 dd "Please input the first number :",0
	nextline db 0x0d,0x0a,0

segment .bss
	a	resd	1
	re resd 1

segment .text
	global main

main:
; Input the first number
		mov EAX,msg1
		call print_string
		call read_int 
			mov [a],EAX
; Subtract three numbers
		mov AX,[a]
		mov [re],AX
		
; go to next line
		mov EAX,nextline
		call print_string
		
		dump_regs 1

;exit progrem
mov    EAX,1
xor    EBX,EBX
int    0x80

