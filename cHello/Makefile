# Makefile for cHello

TARGET = cHello

CFILES = cHello.c
COBJS = $(CFILES:.c=.o)

all:    $(TARGET) $(TARGET).s

$(TARGET):  $(COBJS)
		gcc -o $(TARGET) $^

$(TARGET).s:    $(TARGET).c
		gcc -S $< -o $@

%.o:    %.c
		gcc -c $< -o $@

