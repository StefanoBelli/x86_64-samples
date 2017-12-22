.global is_false_jcc
.text
is_false_jcc:
	pushq %rbp
	movq %rsp, %rbp
	subq $4, %rsp
	
	movw %di, -4(%rbp)

	movb $1, %al
	cmp $0, -4(%rbp)
	je false_ret
	xorb %al, %al

false_ret:
	leaveq
	retw
