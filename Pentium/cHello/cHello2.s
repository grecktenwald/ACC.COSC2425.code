	.file	"cHello2.c"
	.intel_syntax noprefix
	.section	.rodata
.LC0:
	.string	"Hello, World"
.LC1:
	.string	"%s"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	DWORD PTR [rbp-20], edi
	mov	QWORD PTR [rbp-32], rsi
	mov	QWORD PTR [rbp-8], OFFSET FLAT:.LC0
	mov	eax, OFFSET FLAT:.LC1
	mov	rdx, QWORD PTR [rbp-8]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 0
	call	printf
	mov	edi, 10
	call	putchar
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
