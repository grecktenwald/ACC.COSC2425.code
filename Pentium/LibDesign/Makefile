FILES = main1.c main2.c main4.c
PROGS = $(FILES:.c=)
ASMS  = $(FILES:.c=.s)

all:	$(PROGS) $(ASMS)

%.o:	%.c
		gcc	-c	$< -o $@

main1:	main1.o
		gcc		$< -o $@

main2:	main2.o
		gcc		$< -o $@


%.s:	%.c
		gcc	$<	-S	-o $@ -masm=intel

main3.o: main3.asm
		nasm -f elf64 main3.asm -o main3.o

main4:	main4.o main3.o
		gcc  main4.o main3.o -o main4

clean:
		rm *.o *.s $(PROGS)

