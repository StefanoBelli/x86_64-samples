.global count_loopcc
.text
count_loopcc:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp
	
	movq %rdi, -8(%rbp)
	
	xorq %rax, %rax
	movq -8(%rbp), %rcx
	movq $3, %rdx

__get_there_again:
	addq $2, %rax
	dec %rdx
	cmp $0, %rdx
	loopnz __get_there_again
	//-- possible substitutes --
	//loopne __get_there_again
	//loope __get_there_again
	//loopne __get_there_again
	//loop __get_there_again

	leaveq
	retq
