; blink.S - Arduino blink program

.include    "config.inc"        ; configuration for this project

        .section    .text
        .global     main

main:
        ; initialize chip and stack
        eor         r1, r1                  ; keep this register as a zero
        out         SREG, r1                ; clear status flag
        ldi         r28, (RAMEND & 0x00FF)  ; low byte of last ram address
        ldi         r29, (RAMEND >> 8)      ; high byte of last ram address
        out         SPH, r29                ; set stack pointer
        out         SPL, r28    

        call        Init                    ; project initialization
1:      call        Toggle                  ; flip the LED on/off
        call        Delay                   ; wait for a bit
        rjmp        1b                      ; loop forever

Init:
        ; slow the clock doen to 1/32 max speed
        ldi         r24, 0x80               ; need this to write to clock register
        out         CLKPR, r24
        ldi         r25, (1 << CLKPS0) | (1 << CLKPS2)        ; divide by 32
        out         CLKPR, r25
        ; set up LED 
        sbi         LED_DDR, LED_PIN        ; configure LED_PIN for output 
        cbi         LED_PORT, LED_PIN       ; turn LED off
        ret

Toggle:
        in          r24, LED_PORT           ; get current data
        ldi         r25, (1 << LED_PIN)     ; get bit into position
        eor         r24, r25                ; flip the bit
        out         LED_PORT, r24           ; put it back
        ret

Delay:
        ret
        
