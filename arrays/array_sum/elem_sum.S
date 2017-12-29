.global elem_sum
.text
elem_sum:
	pushq %rbp
	movq %rsp, %rbp

	movq %rdi, %rbx #arr
	movq %rsi, %rcx #length

	xorq %rax, %rax
	dec %rcx

__sum_loop0:
	addq (%rbx, %rcx, 8), %rax
	
	dec %rcx
	cmp $0, %rcx
	jge __sum_loop0
	
	leaveq
	retq
