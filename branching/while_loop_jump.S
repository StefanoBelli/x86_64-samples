.globl _start
.text
_start:
	xorw %ax, %ax
	xorb %cl, %cl #try setting cl register value 5 or whatever

//while loop, condition has to get verified first
sum_loop:
	cmp $0, %cl
	je follow_next

	inc %ax
	dec %cl

	jmp sum_loop

follow_next:
	movw %ax, %dx
	movq $60, %rax
	movq %rdx, %rdi
	syscall
