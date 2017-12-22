.globl _start
.text
_start:
	xorq %rax, %rax
	jmp __system_exit #JUMPING AT <address>
	 
	//unreachable code
	movq $0x1, %rax
	movq $0x1, %rbx
	
__system_exit: 
	xorq %rdi, %rdi #IP points here
	movq $60, %rax
	syscall
