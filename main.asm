;@==========================================================
;@
;@ houqp's nasm program template 
;@
;@==========================================================

;%include "io.mac"
;%include "asm_io.inc"
%include "myio.asm"
%include "Along32.inc"

segment .data 
	msg:				db "hello",10,0
	msg_len:		equ $-msg
	nextline:		db 0x0d,0x0a,0

segment .bss
	l1_count	resd	1

segment .text
	global _start
	;global main

_start:
;main:


	my_print nextline,3

;exit progrem
my_exit
