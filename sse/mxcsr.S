.global mxcsr_rm
.global mxcsr_set_rm
.global mxcsr

.text
mxcsr:
    pushq %rbp
    movq %rsp, %rbp
    subq $4, %rsp

    stmxcsr -4(%rbp)
    movl -4(%rbp), %eax
    
    leaveq
    ret
    
mxcsr_rm:
    pushq %rbp
    movq %rsp, %rbp
    subq $4, %rsp

    stmxcsr -4(%rbp)
    movl -4(%rbp), %eax

    shrl $0xd, %eax
    andl $0b11, %eax

    leaveq
    ret

mxcsr_set_rm:
    pushq %rbp
    movq %rsp, %rbp
    subq $4, %rsp

    andl $3, %edi

    xorl %eax, %eax
    stmxcsr -4(%rbp)
    movl -4(%rbp), %eax

    shrl $0xd, %eax
    movl %edi, %eax
    shll $0xd, %eax
    orl -4(%rbp), %eax
    xchgl -4(%rbp), %eax

    ldmxcsr -4(%rbp)
    leaveq
    ret
