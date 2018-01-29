.global x86_cpuid_vendor
.global x86_cpuid_features
.global x86_cpuid_brand

.text
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
	cmpq $0, %rcx
	jge _full_string
	
	addq $16, %rsp
	xorl %eax, %eax
	
_brand_not_supported:
	ret
