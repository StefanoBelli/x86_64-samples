.global x86_cpuid_extnd_features
.global x86_cpuid_vendor
.global x86_cpuid_features
.global x86_cpuid_brand
.global x86_has_cpuid

.text
# thanks to: https://wiki.osdev.org/CPUID
x86_has_cpuid:
	pushfq #store original values, before manipulation

	pushfq #these are the values we're going to work with
	xorl $2097152, (%rsp) #this number enables bit 22 (22-1 = 21th bit), the xor enables it
	popfq #saved the xor'd value to flags register
	pushfq #flags onto the stack, bit 22 might be changed after popping back
	popq %rax #getting flags on the rax register to compare with the original value still on the stack
	xorq (%rsp), %rax # xoring latest flags with the original values, after we put it to 1, if changed to 0
	#then the bit 22 is set to 0 thanks to the OR operation (0 OR 0 EQ 0)

	# as on rax we have the xor'd value, we have now to use the AND operation
	# considering that 1 AND 0 EQ 0 (and vice-versa) but 1 AND 1 EQ 1
	# so we are comparing the 21th bit, if on both side it is 1, cpuid is supported and a
	# non-zero but positive value is returned
	# %rax & $2097152
	andq $2097152, %rax # 0 if not enabled, stored on rax

	popfq #restore anyway the original values
	ret

x86_cpuid_vendor:
	xorl %eax, %eax 
	cpuid

# result is stored in ebx,edx,ecx
# a 12 bytes string
	
	subq $12, %rsp #get more size, this will let us store the string on the stack
	movl %ebx, -12(%rsp) #each register contains 4 Bytes of data (es: eax = "Genu")
	movl %edx, -8(%rsp) #(edx = "ineI")
	movl %ecx, -4(%rsp) #(ecx = "ntel")

	movl $12, %ecx #move exactly 12 bytes to the destination
	leaq -12(%rsp), %rsi
	rep movsb

	addq $12, %rsp
	ret

x86_cpuid_features:
	movl $1, %eax
	cpuid

	movl %ecx, (%rdi)
	movl %edx, (%rsi)

	ret

x86_cpuid_brand:
  #check if brand name is supported
	movl $0x80000000, %eax
	cpuid
	
	movl $1, %eax
	
	cmp $0x80000004, %eax
	jl _brand_not_supported
	
	subq $16, %rsp
	movl $0x80000001, %eax
	movq $2, %rcx
_full_string:
	pushq %rcx
	incl %eax
	pushq %rax
	
	cpuid
	
	movl %eax, -16(%rsp)
	movl %ebx, -12(%rsp)
	movl %ecx, -8(%rsp)
	movl %edx, -4(%rsp)
	
	movq $16, %rcx
	leaq -16(%rsp), %rsi
	rep movsb
	
	popq %rax
	popq %rcx
	
	decq %rcx
	testq %rcx, %rcx
	jge _full_string
	
	addq $16, %rsp
	xorl %eax, %eax
	
_brand_not_supported:
	ret

x86_cpuid_extnd_features:
	pushq %rdx

	movl $7, %eax
	xorl %ecx, %ecx
	cpuid

	movl %ebx, (%rdi)
	movl %ecx, (%rsi)

	popq %rax
	movl %edx, (%rax)

	ret
