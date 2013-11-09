; hello.asm - test program for COSC2425 IOlibrary

%include "asm_io.inc"

    [bits 64]
    section .data

msg:    db  "Hello, World!",0

    section .text
    global  _asm_main

_asm_main:
    push    rbp
    mov     rbp, rsp

    mov     rdi, msg
    call    _print_string
    call    _print_nl
    ;
    mov     rax, 0
    leave
    ret
