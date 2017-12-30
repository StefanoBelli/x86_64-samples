.global get_at
.text
get_at:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp

	movq %rsi, -16(%rbp)
	movq %rdx, -24(%rbp)
	movq %rcx, -32(%rbp)

	movq -16(%rbp), %rax
	imulq -24(%rbp)
	addq -32(%rbp), %rax
	shlq $3, %rax
	addq %rax, %rdi
	movq (%rdi), %rax

	leaveq
	retq
