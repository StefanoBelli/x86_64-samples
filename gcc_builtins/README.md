# gcc_builtins
In this directory you'll find some examples on GCC's builtin functions for x86.

### Why using builtins?
Compiler deeply know how they are implemented and how to optimize them as well, while performing the operation you requested (explicitly). Avoid using inline assembly! Let the compiler do its job and avoid annoying bugs. On some compiler, inline asm is **disabled** by default (such as Visual C++ / MSVC).

### Enabling them
It might be possible that some functions used in these examples are availible only if using some switch with GCC: 

```
-mmmx -msse -mavx #etc etc...
```

### Examples

 * x86_cpu_identify.c  - identify your CPU name, features
 * x86_mmx.c           - perform some SIMD basic arithemtical operations (MMX)
 * x86_sse.c           - same, but using SSE
 * x86_avx.c           - same, but using AVX
 * x86_bmi.c           - perform some bit manipulation using Bit Manipulation Instructions extensions (at-least: Haswell)
 * vector_types.h      - Vectorized data -- basic types

### Further reading
(GCC 4.8.5) https://gcc.gnu.org/onlinedocs/gcc-4.8.5/gcc/X86-Built-in-Functions.html

