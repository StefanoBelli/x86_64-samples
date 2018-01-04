.global bstrlen

.text
//omitted frame pointer
//does not count NUL char
bstrlen:
	movq %rdi, %rsi
	xorq %rdx, %rdx

__count_loop0:
	lodsb
	orb %al, %al
	jz _next
	inc %rdx
	jmp __count_loop0

_next:
	movq %rdx, %rax
	retq
