.global bstrcmatch

.text
bstrcmatch:
	movw %si, %dx #match char
	movq %rdi, %rsi #string

	xorq %rcx, %rcx
__match_loop0:
	inc %rcx
	lodsb
	cmpb %al,%dl
	jne __match_loop0
	jz _next
	
_next:
	xchgq %rcx, %rax
	retq
