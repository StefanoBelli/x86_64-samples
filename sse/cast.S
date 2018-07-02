.global cvtsi2ss
.global cvtss2sd
.global cvtsd2ss
.global cvtsd2si
.global cvtss2si

.text

cvtsi2ss:
    cvtsi2ss %edi, %xmm0
    ret

cvtss2sd:
    cvtss2sd %xmm0, %xmm0
    ret
    
cvtsd2ss:
    cvtsd2ss %xmm0, %xmm0
    ret
    
cvtsd2si:
    cvtsd2si %xmm0, %rax
    ret
     
cvtss2si:
    cvtss2si %xmm0, %rax
    ret
