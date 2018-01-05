# GNU Assembler directives
Having a better knownledge and mastering of the assembler directive itself,
may result in better code and experience.

**These directives are NOT executable instructions**

In fact, before assembling, assembler executes these directives which may modify the final
code itself (e.g. macros) and then assemble the resulting final code.

### Some examples

  * Text, Data, Bss
  
  ```asm
  .text
  .data
  .bss
  ```

  * Set

  ```asm
  .set symbol, 2
  ```

  * If

  ```asm
  .if symbol == 2
  .endif

  .ifdef symbol
  .endif
  ```
  
  * Macro

  ```asm
  .macro sys_exit exit_code
  movq $60, %rax
  movq \exit_code, %rdi
  syscall
  .endm
  ```

  * Comm

  ```asm
  .bss
  .comm symbol_name, 16
  ```

  (16 bytes of uninitialized data for symbol named "symbol_name")

  * Global
  
  ```asm
  .global makesum

  .text
  makesum:
   //...
   retq
  ```

  Global linkage for symbol makesum

  * Extern

  ```asm
  .extern printf

  .text
  main:
  	movq $format, %rdi
  	call printf
  	xorq %rax, %rax
  	retq
  ```

  Symbol printf defined externally

  * Long, Quad, Int, Byte, Short...

  ```asm
  .data
  some_long: .long 646464
  some_quad: .quad 212112
  ```

  Defines data of various size (Long IS NOT 8 Byte, QWORD / Quad instead)

  * Include

  ```asm
  .include "macros.h"
  ```

  You may want to include some macros defined by C preprocessors in you assembly source file,
  use -I command line option to specify include search path

  * Error, Warning

  ```asm
  .ifndef HAVE_CONFIG_
  .error "Config required"
  .endif
  ```

  ```asm
  .if a < b
  .warn "a is less than b, this might not be as good as it sounds."
  .endif
  ```

  * Ascii, Asciz, String, String8

  ```asm
  .data
  name: .ascii "Stefano"
  name_nulterm: .asciz "Stefano"
  more: .string "kiaoo"
  more1: .string8 "kiaoo"
  ```
  
  * Fill

  ```asm
  .data
  array_zeroed: .fill 10,8,0
  ```

  10 is repeat, 8 is size in bytes, 0 is the value to put inside

  * Defining an array

  ```asm
  .data
  array: .long 0,1,2,3,4,5
  ```

  * Length of a string

  ```asm
  .data
  str: .asciz "kiaone"
  len: .int (len - str)
  ```

  subtract address of len and str

  Other advanced directives can be found here(defining new sections, data alignment, structs, relocations, debug symbols etc etc...): https://sourceware.org/binutils/docs/as/Pseudo-Ops.html#Pseudo-Ops
