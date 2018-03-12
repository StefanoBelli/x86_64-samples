.global x87_sum
.global x87_sub
.global x87_mul
.global x87_div

.text
x87_sum:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp

	movss %xmm0, -4(%rbp)
	movss %xmm1, -8(%rbp)

	//Pushing to the register stack
	flds -4(%rbp) # st(0) = rbp-4
	fadds -8(%rbp) # st(0) = st(0) + rbp-8
	fstps -8(%rbp) # rbp-8 = STACK_POP(st(0))

	movss -8(%rbp), %xmm0 # REG(xmm0) = rbp-8

	leaveq
	retq

x87_sub:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp

	movss %xmm0, -4(%rbp)
	movss %xmm1, -8(%rbp)

	flds -4(%rbp)
	fsubs -8(%rbp)
	fstps -8(%rbp)

	movss -8(%rbp), %xmm0

	leaveq
	retq
	
x87_mul:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp

	movss %xmm0, -4(%rbp)
	movss %xmm1, -8(%rbp)

	flds -4(%rbp)
	fmuls -8(%rbp)
	fstps -8(%rbp)

	movss -8(%rbp), %xmm0

	leaveq
	retq
	
x87_div:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp

	movss %xmm0, -4(%rbp)
	movss %xmm1, -8(%rbp)

	flds -4(%rbp)
	fdivs -8(%rbp)
	fstps -8(%rbp)

	movss -8(%rbp), %xmm0
	
	leaveq
	retq
