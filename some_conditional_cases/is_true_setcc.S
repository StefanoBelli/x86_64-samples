.global is_true_setcc
.text
is_true_setcc:
	pushq %rbp
	movq %rsp, %rbp
	subq $4, %rsp

	movw %di, -4(%rbp)
	
	cmp $0,-4(%rbp)
	setne %al
	
	leaveq
	retw
