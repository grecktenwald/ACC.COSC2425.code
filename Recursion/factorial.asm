; factorial.asm - recursive factorial procedure
;
;   input RAX: number to evaluate
;   output RAX: - result
;   no other registers modified
;
factorial:
        push        rbx         ; save caller's registers
        push        rdx         ; zapped by multiply
        cmp         rax, 0      ; base case
        jnz         non_base
base_case:
        mov         rax, 1      ; set value
        pop         rdx         ; restore caller's registers
        pop         rbx
        ret                     ; back with answer in RAX
        ;
non_base:
        push        rax         ; save N for later
        dec         rax         ; calculate N-1
        call        factorial   ; recursive call
        pop         rbx         ; recover N
        mul         rbx         ; n * f(N-1) into RAX
        pop         rdx         ; recover user registers
        pop         rbx
        ret                     ; back with answer in RAX

