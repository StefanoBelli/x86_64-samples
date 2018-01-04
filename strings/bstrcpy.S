.global bstrcpy
.extern bstrlen

.text
bstrcpy:
	pushq %rdi
	pushq %rsi
	movq %rsi, %rdi
	call bstrlen
	popq %rsi
	popq %rdi
	inc %rax
	xchgq %rax, %rcx
	rep movsb
	ret
