.global x86_cpuid_vendor
.global x86_cpuid_features

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
