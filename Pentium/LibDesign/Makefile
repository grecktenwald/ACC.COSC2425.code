FILES = main1.c main2.c
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

clean:
		rm *.o *.s $(PROGS)

