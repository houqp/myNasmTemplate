%include "myc32.mac"

%macro my_print 2
	pushad	
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 0x80
	popad
%endmacro

%macro my_creat_file 2
; %1 store file_path
; %2 store file_mode
; eax : returned fd
	mov eax,8
	mov ebx,%1
	mov ecx,%2
	int 0x80
%endmacro

%macro my_write_file 3
; %1 : fd, remember to have the name included in [] if you pass a variable name
; %2 : buf
; %3 : count
	mov eax,4
	mov ebx,%1
	mov ecx,%2
	mov edx,%3
	int 0x80
%endmacro

%macro my_close_file 1
; %1 : fd, remember to have the name included in [] if you pass a variable name
	pushad
	mov ebx,%1
	mov eax,6
	int 0x80
	popad
%endmacro

%macro my_exit 0
	mov    EAX,1
	xor    EBX,EBX
	int    0x80
%endmacro

;swap two arguments
;arguments should be memory addresses
; usage: invoke _swap arg1,arg2
proc _swap
	.arg1 arg 4	
	.arg2 arg 4	
	pushad
	mov esi, [ebp + .arg1]
	mov edi, [ebp + .arg2]
	mov eax, [esi]
	xchg [edi], eax
	mov [esi], eax
	popad
endproc
_swap_arglen equ 8
