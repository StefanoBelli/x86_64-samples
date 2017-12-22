.globl _start
.text
_start: #linker entry point
	xorq %rax, %rax

	movq $1, %rdi
	movq $2, %rsi
	movq $3, %rdx
	call main

	movq %rax, %rdx #save return code from main
	
	movq $60, %rax #software interrupt, exit request
	movq %rdx, %rdi
	syscall

main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp

	movq $16, -8(%rbp)
	movq $-16, -16(%rbp)

	movq -8(%rbp), %rax
	addq -16(%rbp), %rax

	# the following is the same as leave(q)
	addq $16, %rsp # release the local storage space
	popq %rbp # restore the base pointer

	retq #jump back
