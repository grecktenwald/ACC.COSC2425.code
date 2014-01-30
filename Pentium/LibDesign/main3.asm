; main3.asm - masn example 

        section .data

msg     db      "hello, world",10,0
fmt     db      "%s",0

        section    .text
        global      asm_main
        extern      printf

asm_main:
        push        rbp
        mov         rbp, rsp
        mov         rdi, fmt
        mov         rsi, msg 
        mov         eax, 0
        call        printf
        leave
        ret
        
