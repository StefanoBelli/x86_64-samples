.globl _start
.data
met_zero: .ascii "zero\n"
met_notz: .ascii "not-zero\n"
greater_zero: .ascii "greater\n"
less_zero: .ascii "less\n"

.macro sys_write_stdout what, len
movq $0x1, %rax
movq \len, %rdx
movq \what, %rsi
movq $0x1, %rdi
syscall
.endm

.text
_start:
	xorl %ebx, %ebx

	cmp $0, %ebx
	je zero
	sys_write_stdout $met_notz, $9
	jmp endif
zero:	
	sys_write_stdout $met_zero, $5
endif:

	movl $1, %ebx
	
	cmp $0, %ebx
	je zero1
	jg greater
	jl less
zero1:
	sys_write_stdout $met_zero, $5
	jmp _endif
greater:
	sys_write_stdout $greater_zero, $8
	jmp _endif
less:
	sys_write_stdout $less_zero, $5
_endif:

	xorq %rdi, %rdi
	movq $60, %rax
	syscall
