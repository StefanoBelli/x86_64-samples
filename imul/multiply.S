.global multiply
.text

multiply:
	pushq %rbp
	movq %rsp, %rbp
	subq $24, %rsp

	movq %rdi,-8(%rbp)
	movq %rsi,-16(%rbp)
	movq %rdx,-24(%rbp)

	movq -8(%rbp), %rax
	movq -16(%rbp), %rbx
	imulq %rax, %rbx
	movq -24(%rbp), %rcx
	movq %rbx, (%rcx)

	leaveq
	retq

