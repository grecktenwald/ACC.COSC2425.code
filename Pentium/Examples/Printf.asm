    ;type this to create an executable file:
    ;
    ;nasm -f elf64 -g -F stabs hello.asm
    ;gcc -o hello hello.o
    ;
    ;this code only works on 64 bit Linux
    ;
     
    extern printf
     
    section .data
     
    message: db "Hello World", 0
    type: db "%s",10,0
     
    section .text
     
    global main
     
    main:
    mov rdi, type ;first parameter
    mov rsi, message ;second parameter
    mov rax, 0 ;no floating point register used
    call printf
    mov rax, 1 ;exit syscall
    mov rbx, 0
    int 80h
     
