.globl _start
.text
_start:
	xorw %ax, %ax
	movb $5, %cl #try zeroing cl register also

//do-while loop, gets executed ANYWAY at least once
sum_loop:
	inc %ax
	inc %cl
	cmp $5, %cl
	jl sum_loop

	movw %ax, %dx
	movq $60, %rax
	movq %rdx, %rdi
	syscall
