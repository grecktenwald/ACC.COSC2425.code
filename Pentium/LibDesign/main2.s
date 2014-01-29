	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp2:
	.cfi_def_cfa_offset 16
Ltmp3:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp4:
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	leaq	L_.str1(%rip), %rax
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	movq	_msg(%rip), %rsi
	movq	%rax, %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, %ecx
	movl	%eax, -20(%rbp)         ## 4-byte Spill
	movl	%ecx, %eax
	addq	$32, %rsp
	popq	%rbp
	ret
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	 "hello, world\n"

	.section	__DATA,__data
	.globl	_msg                    ## @msg
	.align	3
_msg:
	.quad	L_.str

	.section	__TEXT,__cstring,cstring_literals
L_.str1:                                ## @.str1
	.asciz	 "%s"


.subsections_via_symbols
