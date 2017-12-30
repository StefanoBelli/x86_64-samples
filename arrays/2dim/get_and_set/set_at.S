.global set_at
.text
set_at:
	pushq %rbp
	movq %rsp, %rbp
	subq $40, %rsp

	movq %rdi, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdx, -24(%rbp)
	movq %rcx, -32(%rbp)
	movq %r8, -40(%rbp)

	movq -8(%rbp), %rbx

	movq -16(%rbp), %rax
	imulq -24(%rbp)
	addq -32(%rbp), %rax
	shlq $3, %rax
	addq %rax, %rbx
	movq -40(%rbp),%rax
	movq %rax,(%rbx)

	leaveq
	retq
