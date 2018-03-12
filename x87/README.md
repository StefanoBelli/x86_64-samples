# x86/x87_FPU
The x87 was the floating point unit (FPU) paired with older 8086 based CPUs, they weren't capable of
doing floating point mathematics, so an additional dedicated chip was necessary.

Nowadays the x87 instructions are builtin inside the x86-based modern processors.

These instruction are superseeded by newer extension but it is worth it to have a knownledge of these x87 instructions.

In this section, some examples are provided along with an implementation for high-level usage with GCC extended inline asm.

### IEEE 754
The FPU uses this standard in order to compute floating points.

We won't actually convert in these examples, as we are calling functions from C,
compiler takes care about converting our floating point number to IEEE 754 standard representation.

It is still worth to take a look on HOW we do that.

https://en.wikipedia.org/wiki/IEEE_754
