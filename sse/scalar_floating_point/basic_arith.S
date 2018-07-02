.global addss
.global subss
.global mulss
.global divss
.global maxss
.global minss

.text
addss: #(f,f) -> f
    addss %xmm1, %xmm0
    retq

subss: #(f,f) -> f
    subss %xmm1, %xmm0
    retq

mulss: #(f,f) -> f
    mulss %xmm1, %xmm0
    retq
    
maxss: #(f,f) -> f
    maxss %xmm1, %xmm0
    retq

minss: #(f,f) -> f
    minss %xmm1, %xmm0
    retq   
    
divss: #(f,f) -> f
    divss %xmm1, %xmm0
    retq
