.global x87_max
.global x87_min
.global x87_eq

.text
x87_max:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp

	movss %xmm0, -4(%rbp)
	movss %xmm1, -8(%rbp)

	flds -8(%rbp)
	flds -4(%rbp)
	fcomi %st(1)
	fcmovb %st(1), %st(0)

	fstp -8(%rbp)
	movss -8(%rbp), %xmm0

	fstp -8(%rbp)

	leaveq
	retq
	
x87_min:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp
	
	movss %xmm0, -4(%rbp)
	movss %xmm1, -8(%rbp)

	flds -8(%rbp)
	flds -4(%rbp)
	fcomi %st(1)
	fcmovnb %st(1), %st(0)

	fstp -8(%rbp)
	movss -8(%rbp), %xmm0

	fstp -8(%rbp)

	leaveq
	retq
	
x87_eq:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp
	
	xorl %eax, %eax

	movss %xmm0, -4(%rbp)
	movss %xmm1, -8(%rbp)

	flds -4(%rbp)
	flds -8(%rbp)
	fcomip %st(1)
	fstps -8(%rbp)

	jne __finish
	movl $0x1, %eax

__finish:
	leaveq
	ret
