# x86_64/examples/structs/basic_fields_addressing
You can find an example of how to interact with C structs using GCC

First of all, analyze the disassembly of *main.c* source file, so
we'll see how GCC actually passes the struct in these 3 different cases:

~~~
$ gcc main.c -c
$ objdump --disassemble --section=.text main.o | cut -f 3
~~~

	* By value (aka copying the struct)
	* By pointer

```asm
movq   $0x0,-0x30(%rbp)
movq   $0x0,-0x28(%rbp)
movq   $0x0,-0x20(%rbp)
movq   $0x1,-0x18(%rbp)
```

Above, GCC is initializing fields

The first element is put on the lowest address of the stack, the last one at [rbp - 0x30]

### By value

```asm
pushq  -0x18(%rbp)
pushq  -0x20(%rbp)
pushq  -0x28(%rbp)
pushq  -0x30(%rbp)
callq  48 <main+0x48>
```

Here GCC does not use registers but pushes onto the stack values, 
we can use the base pointer with an offset to make it point on higher addresses.

The last pushed value is the first field. As the first one is the last field.

### By pointer

```asm
lea    -0x30(%rbp),%rax
mov    %rax,%rdi
callq  58 <main+0x58>
```

We used the same structure in memory for both value and by-pointer, so [rbp-30] is good:

	* Load Effective Address calculates the effective address for the first field of the struct
		and then loads it on rax register
	* Address is moved on the rdi register
