; test.asm 
;%include "io.mac"
%include "asm_io.inc"

segment .date
	msg1 dd "Please input the first number :",0
	msg2 dd "Please input the second number :",0
	msg3 dd "Please input the third number :",0
	msg4 db "The result is: ",0
	nextline db 0x0d,0x0a,0

segment .bss
	a	resd	1
	b	resd	1
	c	resd	1
	re resd 1

segment .text
	global main

main:
; Input the first number
		mov EAX,msg1
		call print_string
		call read_int 
			mov [a],EAX
; Input the second number
		mov EAX,msg2
		call print_string
		call read_int
			mov [b],EAX
; Input the third number
		mov EAX,msg3
		call print_string
		call read_int
			mov [c],EAX
; Subtract three numbers
		mov AX,[a]
		sub AX,[b]
		sub AX,[c]
		mov [re],AX
		
		mov EAX,msg4
		call print_string
		mov EAX,[re]
		call print_int

		mov EAX,nextline
		call print_string
		
		dump_regs 1

;exit progrem
mov    EAX,1
xor    EBX,EBX
int    0x80

