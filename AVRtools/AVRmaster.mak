FINAL       =   $(TARGET).hex
MCU         =   atmega32u4
F_CPU		=	16000000
FORMAT      =   ihex
include     /tools/lib/AVRtools.mak

OBJS        =   $(CSRCS:%.c=%.o) $(ASRCS:%.S=%.o)

LDFLAGS     =   -Wl,-Map=$(TARGET).map,--cref
LDFLAGS     +=  -nostartfiles
DEBUG       =   dwarf-2
OPT         =   s
CDEFS       =   -DF_CPU=$(F_CPU)UL
CSTANDARD   =   -std=gnu99

CFLAGS      =   -mmcu=$(MCU) -I.
CFLAGS      +=  -g$(DEBUG)
CFLAGS      +=  $(CDEFS)
CFLAGS      +=  -O$(OPT)
CFLAGS      +=  -funsigned-char
CFLAGS      +=  -funsigned-bitfields
CFLAGS      +=    -fpack-struct
CFLAGS      +=  -fshort-enums
CFLAGS      +=  -Wall
CFLAFS      +=  -Wstrict-prototypes
CFLAGS      +=  -Wa,-adhlns=$(<:%c=%.lst)
CFLAGS      +=  $(CSTANDARD)

AFLAGS      =   -mmcu=$(MCU) -I. -x assembler-with-cpp
AFLAGS      +=  -DF_CPU=$(F_CPU)
AFLAGS      +  +=   -Wa,-adhlns=$(<:%.S=%.lst),-gstabs,--listing-cont-lines=100

all:        $(FINAL)

%.hex:      %.elf
			$(OBJCOPY) -O $(FORMAT) \
				-R .eeprom \
				-R .fuse \
				-R lock \
				-R .signature $< $@

%.elf:      $(OBJS)
			$(GCC) $(CFLAGS) $^ --output $@ $(LDFLAGS)


# build objects from C files
%.o:        %.c
			echo building $@
			$(GCC) -c $(CFLAGS) $< -o $@

%.o:        %.S
			$(GCC) -c $(AFLAGS) $< -o $@

ifeq ($(PROCESSOR), atmega328p)
# where did we install the Arduino tools
ARDUINO_ROOT = 	c:/tools/arduino
ARDUINO_TOOLS = $(ARDUINO_ROOT)/hardware/tools/avr/bin
AVRDUDE = 		$(ARDUINO_TOOLS)/avrdude.exe
AVRDUDE_CONF = 	/tools/lib/avrdude.conf
MCU =			atmega328p

LOAD_FLAGS = 	-carduino \
				-P\\.\COM$(PORT) \
				-b115200 \
				-D \
				-Uflash:w:$(TARGET).hex:i
load:   $(TARGET).hex
		$(AVRDUDE) -C$(AVRDUDE_CONF) -p$(MCU) $(LOAD_FLAGS)
endif

ifeq ($(PROCESSOR), atmega32u4)
load:
			echo ?Press the reset button to load the code"
			$(LOADER) -mmcu=$(CPU) -w $(TARGET).hex
endif

clean:
			$(RM) -f *.o
			$(RM) -f *.hex
			$(RM) -f *.lst
			$(RM) -f *.map

            
