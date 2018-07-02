.global comiss_equal
.global comiss_nequal
.global comiss_major
.global comiss_minor

.text

comiss_equal: # (f,f) -> b
    xorl %eax, %eax
    comiss %xmm1, %xmm0
    setz %al
    ret

comiss_nequal: # (f,f) -> b
    xorl %eax, %eax
    comiss %xmm1, %xmm0
    setnz %al
    ret

comiss_major: # (f,f) -> b
    xorl %eax, %eax
    comiss %xmm1, %xmm0
    seta %al
    ret

comiss_minor: # (f,f) -> b
    xorl %eax, %eax
    comiss %xmm1, %xmm0
    jnb _L_comiss_minor_end
    movb $0x1, %al
_L_comiss_minor_end:
    ret
