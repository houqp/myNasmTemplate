
%macro my_print 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 0x80
%endmacro

%macro my_exit 0
	mov    EAX,1
	xor    EBX,EBX
	int    0x80
%endmacro
