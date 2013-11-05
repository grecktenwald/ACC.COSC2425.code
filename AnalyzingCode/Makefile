# Makefile for Bubble Sort testing

PROGS = TimerTest1 TimerTest2 BubbleSort

CFILES = $(PROGS:%=%.c) sort.c
OBJS = $(CFILES:%.c=%.o)

all:    $(PROGS)

TimerTest1: TimerTest1.o
	gcc $< -o $@

TimerTest2: TimerTest2.o sort.o
	gcc $^ -o $@

BubbleSort: BubbleSort.o sort.o
	gcc $^ -o $@ 

# implicit rules

%.o:    %.c
	gcc -c $< -o $@

clean:
	rm $(OBJS) $(PROGS)
