.global x87_1dot0
.global x87_zero
.global x87_pi
.global x87_log2
.global x87_ln2

.text
x87_1dot0:
	pushq %rbp
	movq %rsp, %rbp
	subq $4, %rsp

	fld1 #load 1.0 into st(0)
	fstps -4(%rbp)
	movss -4(%rbp), %xmm0

	leaveq
	retq

x87_zero:
	pushq %rbp
	movq %rsp, %rbp
	subq $4, %rsp

	fldz #load 0 into st(0)
	fstps -4(%rbp)
	movss -4(%rbp), %xmm0

	leaveq
	retq
	
x87_pi:
	pushq %rbp
	movq %rsp, %rbp
	subq $4, %rsp

	fldpi #load pi into st(0)
	fstps -4(%rbp)
	movss -4(%rbp), %xmm0

	leaveq
	retq


x87_log2:
	pushq %rbp
	movq %rsp, %rbp
	subq $4, %rsp

	fldlg2 #load log10(2) into st(0)
	fstps -4(%rbp)
	movss -4(%rbp), %xmm0

	leaveq
	retq
	
x87_ln2:
	pushq %rbp
	movq %rsp, %rbp
	subq $4, %rsp

	fldln2 #load ln(2) into st(0)
	fstps -4(%rbp)
	movss -4(%rbp), %xmm0

	leaveq
	retq
