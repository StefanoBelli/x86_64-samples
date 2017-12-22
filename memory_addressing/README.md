# x86/examples/memory_addressing
This example shows how is possible to access a memory location, however, we 'll not use GCC to compile this code, BUT, we actually use the C library to achieve output operations.

After code is assembled, we have to link it using ld:

~~~
 $ ld --dynamic-linker $YOUR_RUNTIME_LINKER -l$YOUR_LIBC_ABSOULTE_PATH main.o addressing.o
~~~
