# project.mak - main rule set for COSC2425 labs 
#    install in /usr/local/include

COBJS   = $(CFILES:.c=.o)
AOBJS   = $(AFILES:.asm=.o)
OBJS    = $(COBJS) $(AOBJS)
LFLAGS  = -lcosc2425

all:    $(TARGET)

$(TARGET):  $(OBJS)
	gcc $(OBJS) $LFLAGS) -o $(TARGET)

%.o:    %.c
	gcc -c $< -o $@

%.o:    %.asm
	nasm -f macho64 $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)

