program = main

$(program):$(program).o $(program).lst
	#ld -s -o $(program) $(program).o io.o
	#ld -m elf_i386 -o $(program) $(program).o io.o asm_io.o
	#gcc -m32 $(program).o asm_io.o -o $(program)
	ld -m elf_i386 -o $(program) $(program).o 

$(program).lst $(program).o:$(program).asm myio.asm
	#nasm -f elf32 $(program).asm -l $(program).lst
	yasm -f elf32 $(program).asm -l $(program).lst

.PHONY: clean
clean:
	rm $(program).o *.lst $(program)
