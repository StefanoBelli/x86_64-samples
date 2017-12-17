.global divide
.text

divide:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp

	xor %eax,%eax
	
	movq %rdi, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdx, -24(%rbp)
	movq %rcx, -32(%rbp)

	cmp $0,-16(%rbp)
	jz zerodiv

	movq -8(%rbp),%rax
	cdq
	divq -16(%rbp)

	movq -24(%rbp), %rcx
	movq %rax,(%rcx)

	movq -32(%rbp), %rcx
	movq %rdx, (%rcx)

	movl $0x1, %eax
zerodiv:
	leaveq
	ret
