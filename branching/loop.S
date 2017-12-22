.globl _start

.macro sys_write_stdout what, len
movq $0x1, %rax
movq \len, %rdx
movq \what, %rsi
movq $0x1, %rdi
syscall
.endm

.data
repeat: .ascii "looping around...\n"
repeat_len: .byte repeat_len - repeat

.text
_start:
	movq $5, %rcx

__one_loop:
	pushq %rcx #preserve cx is necessary, might be also done by moving content into another register
	sys_write_stdout $repeat, repeat_len
	popq %rcx #restore cx value
	loop __one_loop

	xorq %rdi, %rdi
	movq $60, %rax
	syscall
