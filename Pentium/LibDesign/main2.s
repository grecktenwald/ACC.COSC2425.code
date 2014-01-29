	.file	"main2.c"
	.intel_syntax noprefix
	.globl	msg
	.section	.rodata
.LC0:
	.string	"hello, world\n"
	.data
	.align 8
	.type	msg, @object
	.size	msg, 8
msg:
	.quad	.LC0
	.section	.rodata
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
	sub	rsp, 16
	mov	DWORD PTR [rbp-4], edi
	mov	QWORD PTR [rbp-16], rsi
	mov	rdx, QWORD PTR msg[rip]
	mov	eax, OFFSET FLAT:.LC1
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 0
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
