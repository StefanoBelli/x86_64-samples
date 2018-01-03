.global byptr
.global valcpy
.global dynalloc

.text
byptr:
	pushq %rbp
	movq %rsp, %rbp
	//not reserving stack space, not needed

	/*
	rdi --> [EFFECTIVE(-0x30(%rbp))] = MOVE => rbx
	*/
	movq %rdi, %rbx

	//
	// HIGHER f3-f2-f1-f0---(this function's call stack)-- LOWER
	//        24 16 8  ^-----EFFECTIVE ADDRESS LOADED ON RBX
	//        +  +  +
	//Accessing higher addresses
	movq $3, (%rbx)
	movq $2, 8(%rbx)
	movq $1, 16(%rbx)
	movq $0, 24(%rbx)

	//moving in lower addresses would compromise return address, locales and eventually 
	//parameters pushed onto the stack

	leaveq
	retq

valcpy:
	pushq %rbp
	movq %rsp, %rbp

	//rbp : current base pointer location
	//rbp+8 : return value
	//rbp+16 : structure first element
	//...
	//rbp+40 : structure last element
	
	//32 bytes structure
	movq $0x1,40(%rbp)
	movq $0x2,32(%rbp)
	movq $0x3,24(%rbp)
	movq $0x4,16(%rbp)
	//32 bytes structure

	movq $0x4, %rcx
	xorq %rax, %rax

	pushq %rbp
	addq $16, %rbp
	
__sumloop0:
	addq (%rbp), %rax
	addq $0x8, %rbp
	loop __sumloop0

	popq %rbp #not function prologue
	
	leaveq
	retq
