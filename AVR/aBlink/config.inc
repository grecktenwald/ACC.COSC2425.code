; configuration settings (include this after chip def file)

.include    "/usr/local/include/atmega328p.inc"    ; chip definitions

; use the on-board LED (PB13)
.equ    LED_DDR,    DDRB
.equ    LED_PORT,   PORTB
.equ    LED_PIN,    5
