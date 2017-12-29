# x86_64/examples/stack_arrays
This section contains a simple example about writing
x86 assembly code that deals with arrays.

Basically an array consists in a kind of data put one after another in memory,
here we are considering the stack segment, other segments such as data and bss may be used to create arrays.

Said that, the C language makes easier for us to access arrays, but if you take a closer look, you'll see that
arrays are not so complicated to understand.

```c
int main() {
	int array[4] = { 0,1,2,3 };
	return array[0];
```

In this example we can see a simple array getting created and then accessed at its first value.

But how actually it gets created?

No specific way actually exist, a compiler may do in a specific way, another may adopt different
technique.

GCC does the following:
	* reserves the necessary space on the stack by moving the stack pointer (subtract)
	```
	sizeof arr => 16 Bytes
	```

	* moves each direct value to its location on the stack using the base pointer register.
	```
	long => 4 bytes
	```

But you may also consider to push directly them one after another (please note these are **QWORD**s,
so probably you may want to put them using the base pointer register)

```
pushq $3
pushq $2
pushq $1
pushq $0
```

## Order
How are these element pushed?

**Answer**: The first element is at the lower address of the stack, where the stack pointer register is, the last ones are at higher addresses.


