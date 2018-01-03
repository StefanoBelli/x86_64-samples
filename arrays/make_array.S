.globl _start
.text
make_array_method0:
	pushq %rbp
	movq %rsp, %rbp

	pushq $3 #-8
	pushq $2 #-16
	pushq $1 #-24
	pushq $0 #-32
	
	movq -24(%rbp), %rax
	leaveq
	retq

make_array_method1:
	pushq %rbp
	movq %rsp, %rbp

	// 4 (size) * 4 (number of elements) = 16 Bytes (size of array)
	subq $16, %rsp
	movl $0, -16(%rbp)
	movl $1, -12(%rbp)
	movl $2, -8(%rbp)
	movl $3, -4(%rbp)

	/* 
	push 3
	push 2
	push 1
	push 0
	*/

	movq -16(%rbp), %rax

	leaveq
	retq

_start:
	call make_array_method0
	movq %rax, %rdi
	call make_array_method1
	addq %rax, %rdi

	movq $60, %rax
	syscall
