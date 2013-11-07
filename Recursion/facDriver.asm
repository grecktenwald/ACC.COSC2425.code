; factorial.asm - demonstration of recursion
;
%include "/usr/local/lib/asm_io.inc"

        section     .data
msg     db          "Factorial demo",0
res_msg db          "Factorial of ",0
val_msg db          " is ",0

        section     .text
        global      _asm_main
_asm_main:
        mov         rdi,msg
        call        _print_string
        call        _print_nl

floop:  call        _read_int
        cmp         rax, 0
        jl          fend
        ;                           do the factorial of this number
        push        rax             ; N is on stack (do not trust procedures!)
        mov         rdi, res_msg    ; display result string
        call        _print_string
        pop         rdi             ; N is in rdi
        push        rdi             ; N is back on stack
        call        _print_int       ; display N
        pop         rax             ; recover parameter
        call        factorial       ; go calculate factorial
        push        rax             ; save F(N) on stack
        mov         rdi, val_msg    ;
        call        _print_string
        pop         rdi             ; back in RDI
        call        _print_int
        call        _print_nl
        jmp         floop           ; back for another round
fend:
        mov         rax, 0
        ret

