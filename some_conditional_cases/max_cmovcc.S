.global max_cmovcc
.text
max_cmovcc:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp

	movq %rdi, -8(%rbp)
	movq %rsi, -16(%rbp)

	movq -8(%rbp), %rax
	cmpq %rax, -16(%rbp)
	cmovaq -16(%rbp), %rax

	leaveq
	retq
