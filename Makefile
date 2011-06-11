program = main
debug = dbg
include = myc32.mac myio.asm Along32.inc 
LDFLAGS += -lc
CFLAGS = -L./Along32

$(program):$(program).o ./Along32/Along32.o
	#gcc -m32 $(program).o asm_io.o -o $(program)
	ld -m elf_i386 $(LDFLAGS) --dynamic-linker /lib/ld-linux.so.2 -o $(program) $(program).o ./Along32/Along32.o

$(program).lst $(program).o:$(program).asm $(include)
	nasm -f elf32 $(program).asm -l $(program).lst
	#yasm -f elf32 $(program).asm -l $(program).lst

$(debug):$(program)_$(debug).o 
	gcc -g -m32 $(program).o asm_io.o -o $(debug)

$(program)_$(debug).o:$(program).asm myio.asm
	nasm -g -f elf32 $(program).asm -l $(program).lst

./Along32/Along32.o: ./Along32/Along32.asm
	cd ./Along32/ && make

debug:$(debug)

partial_clean:
	rm -rf $(program).o *.lst $(debug)

clean: partial_clean
	rm -rf $(program)

.PHONY: clean debug partial_clean
