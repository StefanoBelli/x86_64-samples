.global sum
.text
sum:
	pushq %rbp
	movq %rsp,%rbp
	subq $16,%rsp

	movq %rdi,-8(%rbp)
	movq %rsi,-16(%rbp)
	movq -8(%rbp),%rax
	addq -16(%rbp), %rax

	leaveq
	retq
