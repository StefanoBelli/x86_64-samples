.global bstrncmp

.text
bstrncmp:
	xchgq %rsi, %rdi
	xchgq %rdx, %rcx

	xorw %ax, %ax
	movw $1, %bx

	repe cmpsb
	cmovnzw %bx, %ax
	
	retw
