ARDUINO_ROOT = 	/tools/arduino
ARDUINO_TOOLS = $(ARDUINO_ROOT)/hardware/tools/avr/bin

GCC     =   $(ARDUINO_TOOLS)/avr-gcc.exe
ASM     =   $(ARDUINO_TOOLS)/avg-as.exe
LINK    =   $(ARDUINO_TOOLS)/avr-size.exe
OBJCOPY =   $(ARDUINO_TOOLS)/avr-objcopy.exe
OBJDUMP =   $(ARDUINO_TOOLS)/avr-objdump.exe
NM      =   $(ARDUINO_TOOLS)/avr-nm.exe
RM      =   rm -f

