.global x87_sin
.global x87_cos
.global x87_sincos
.global x87_tan
.global x87_atan

.text
x87_sin:
	pushq %rbp
	movq %rsp, %rbp
	subq $4, %rsp

	movss %xmm0, -4(%rbp)

	flds -4(%rbp)
	fsin
	fstps -4(%rbp)
	
	movss %xmm0, -4(%rbp)
	
	leaveq
	retq

x87_cos:
	pushq %rbp
	movq %rsp, %rbp
	subq $4, %rsp

	movss %xmm0, -4(%rbp)

	flds -4(%rbp)
	fcos
	fstps -4(%rbp)
	
	movss -4(%rbp), %xmm0
	
	leaveq
	retq

x87_sincos:
	pushq %rbp
	movq %rsp, %rbp
	subq $4, %rsp
		
	movss %xmm0, -4(%rbp) #value

	flds -4(%rbp)
	fsincos

	# cosine
	fstps -4(%rbp)
	movss -4(%rbp), %xmm0
	movss %xmm0, (%rsi)

	# sine
	fstps -4(%rbp)
	movss -4(%rbp), %xmm0
	movss %xmm0, (%rdi)

	leaveq
	retq

x87_tan:
	pushq %rbp
	movq %rsp, %rbp
	subq $4, %rsp

	movss %xmm0, -4(%rbp)

	flds -4(%rbp)
	fptan
	fstps -4(%rbp)
	fstps -4(%rbp)
	
	movss -4(%rbp), %xmm0
	
	leaveq
	retq

x87_atan:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp

	movss %xmm0, -4(%rbp)
	movw $1, -8(%rbp)

	flds -4(%rbp)
	fild -8(%rbp) 
	fpatan
	fstps -4(%rbp)
	
	movss -4(%rbp), %xmm0
	
	leaveq
	retq
