.global bstrcat
.extern bstrlen

.text
bstrcat:
	pushq %rdi
	pushq %rsi

	call bstrlen
	movq %rax, %rbx

	popq %rdi
	call bstrlen
	movq %rax, %rcx
	movq %rdi, %rsi 
	popq %rdi
	addq %rbx, %rdi

	rep movsq
	ret
