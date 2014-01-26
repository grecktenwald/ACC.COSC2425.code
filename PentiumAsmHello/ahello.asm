; aHello.asm - reverse engineered version of cHello.c

        section .data

LCO:    db      "Hello, World",0

        section .text

        global  main
        extern  puts
main:
        push    rbp
        mov     rbp. rsp
        sub     rsp, 16
        mov     DWORD [rbp-4], edi
        mov     [rbp-16], rsi
        mov     edi, LCO
        call    puts
        leave
        ret
