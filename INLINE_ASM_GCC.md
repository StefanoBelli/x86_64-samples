# Inline Assembly
Also inline assembly is an important feature of C compilers:
they let you write your own assembly code within C code. It will take
some time to practice and mastering this great feature.

A very **VERY** basic example can be found in this repository, but you should take
look at documentation. Extended asm is not so easy.

**THIS IS CONSIDERED TO BE VALID ONLY FOR GCC COMPILER**

```c

__asm__ [__volatile__] (
	assembly format template
	: output operands [OPTIONAL] (each one separated by comma)
	: input operands [OPTIONAL] (each one separated by comma)
	: clobbered registers [OPTIONAL] (each one separated by comma)
);

```


* __volatile__ prevents the compiler to apply optimizations on inline assembly code, OPTIONAL

* the assembly format template is the format string of the final assembly code

* clobbered registers tells GCC that a particular register is holding a value for us, so it will find
another solution to do whatever it was going to do with that register, and will not touch that.

* each instruction has to end with semi-colon ';'

### Further reading

https://www.ibm.com/developerworks/library/l-ia/index.html

https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html
