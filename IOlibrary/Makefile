# Makefile - for COSC2425 IOlibrary

LFLAGS = -Wl,-no_pie

FILES   = \
        print_string.c \
        print_nl.c \
        print_int.c \
        print_qword.c \
        main.c

LIB     = cosc2425

OBJS    = $(FILES:.c=.o)

all:    lib$(LIB).a hello

lib$(LIB).a:    $(OBJS)
	ar rcs lib$(LIB).a $(OBJS)

hello:  hello.o
	gcc $(LFLAGS) $< -o $@ -L. -lcosc2425

# Make patterns follow --------------------------

%.o:    %.asm
	nasm -f macho64 $< -o $@

%.o:    %.c
	gcc -c $< -o $@

install:
	cp lib$(LIB).a /usr/local/lib
	cp asm_io.inc /usr/local/include
	cp project.mak /usr/local/include

clean:
	rm $(OBJS) lib$(LIB).a
