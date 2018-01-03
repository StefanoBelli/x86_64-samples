//Use GCC
.extern print_field_sum
.extern byptr_structure

.global main

.text
main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp

	//element_s elem = { 0,0,0,1 };
	movq $1, -32(%rbp)
	movq $1, -24(%rbp)
	movq $0, -16(%rbp)
	movq $1, -8(%rbp)

	//
	// Pushing again onto the stack can be omitted
	// before the function call, same values on the same order
	// are already placed on the stack, however...
	pushq -8(%rbp)
	pushq -16(%rbp)
	pushq -24(%rbp)
	pushq -32(%rbp)
	call print_field_sum

	//remember to release memory
	//we did 4 push of 8 bytes data
	// 4x8 = 32 bytes of useless stack space
	addq $32, %rsp

	////

	//byptr_structure is expecting a pointer to the structure
	//use LEA instruction to calculate the effective address of -32(%rbp) or rbp-32
	//which is the first field of the data structure
	//this is equivalent to:
	// byptr_structure(&elem);
	leaq -32(%rbp), %rdi
	call byptr_structure

	//as on the stack the lowest address still contains the first field of the struct
	//and we passed the effective address to the byptr_structure which changed those values
	//we now print new values
	call print_field_sum

	//rax contains return value, so
	// xor'ing rax makes main function to return 0 value
	xorq %rax, %rax

	leaveq
	retq

