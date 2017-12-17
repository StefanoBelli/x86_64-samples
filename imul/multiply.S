.global multiply
.text

multiply:
	pushq %rbp
	movq %rsp, %rbp
	subq $24, %rsp

	movq %rdi,-8(%rbp)
	movq %rsi,-16(%rbp)
	movq %rdx,-24(%rbp)

	movq %rdi, %rax
	imulq %rax, %rsi
	movq %rsi, (%rdx)

	leaveq
	retq

