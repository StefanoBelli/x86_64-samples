.global get_array_size
.global get_by_basereg
.global get_by_basereg_displacement
.global get_by_basereg_indexreg
.global get_by_basereg_indexreg_times_scalef

.data
common_array: .quad 1,2,3,4
carray_fixed_size: .quad (carray_fixed_size - common_array)/8

.text
get_array_size:
	movq carray_fixed_size, %rax
	retq

get_by_basereg:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp

	movq %rdi, -8(%rbp)

	movq $common_array, %rbx

	cmp $0, -8(%rbp)
	je retrieve_value

	shlq $3, -8(%rbp)
	addq -8(%rbp), %rbx

retrieve_value:
	movq (%rbx), %rax

	leaveq
	retq

get_by_basereg_displacement:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp

	movq %rdi, -8(%rbp)

	xorq %rsi, %rsi

	cmp $0, -8(%rbp)
	je retrieve_value1

	movq -8(%rbp), %rsi
	shlq $3, %rsi

retrieve_value1:
	movq common_array(,%rsi,), %rax

	leaveq
	retq

get_by_basereg_indexreg:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp

	movq %rdi, -8(%rbp)

	movq $common_array, %rbx
	xorq %rsi, %rsi

	cmp $0, -8(%rbp)
	je retrieve_value2

	movq -8(%rbp), %rsi
	shlq $3, %rsi
	
retrieve_value2:
	movq (%rbx,%rsi), %rax

	leaveq
	retq

get_by_basereg_indexreg_times_scalef:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp

	movq %rdi, -8(%rbp)

	movq $common_array, %rbx
	movq -8(%rbp),%rcx
	
	movq (%rbx,%rcx,8),%rax
	
	leaveq
	retq
