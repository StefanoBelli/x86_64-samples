# x86/examples/branching
This section shows branching instructions provided by x86 processors

The following instruction are shown:

	* jmp (unconditional jumps)
	* call (function call)
	* jcc (if-then  / if-then-else / do-while loops / while loops)
	* loop

===

## Note about jmp and call
Please, do not replace *call* with *jmp*!

They are different and do different jobs!

*call* pushes the return address on the stack, then jumps at *address*, so we can use *ret* to resume execution at the return address pushed onto the stack.

*jmp* does not, however sometime we still see code that is meant to replace call (no reason to do that), which consists in pushing the return address before using *jmp*. You should avoid this kind of "technique", use call!
