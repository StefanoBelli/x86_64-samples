# x86/cpuid
Interrogate CPU about it

Allows us to get a lot of informations, from CPU manufacturer to its features.

### Compatability
CPUID is implemented and availible in almost any x86-based modern processor.

Checking if availible is not necessary, unless your code requires it to run on old
processors.

It was introduced in 1993, since so, both Intel and AMD, used it.

### GCC and MSVC
The ideal if you want to use CPUID within your C and C++ code, is to use
their builtin functions for this x86 instruction.

**Documentation**

* MSVC: https://msdn.microsoft.com/it-it/library/hskdteyh.aspx
* (header file) GCC: https://github.com/gcc-mirror/gcc/blob/master/gcc/config/i386/cpuid.h#L178

You may want to use your own implementation for this instruction, maybe using inline extended assembly.

### In this example
You can get vendor name and if your CPU supports hyper threading and SSE4.2 instructions

### Further reading

 * https://en.wikipedia.org/wiki/CPUID
 * https://www.microbe.cz/docs/CPUID.pdf
 * https://wiki.osdev.org/CPUID
