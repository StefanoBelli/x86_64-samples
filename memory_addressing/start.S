.extern printf
.extern puts
.extern get_by_basereg
.extern get_by_basereg_displacement
.extern get_by_basereg_indexreg
.extern get_by_basereg_indexreg_times_scalef

.globl _start
 
.macro sys_exit_zero
xorq %rdi, %rdi
movq $60, %rax
syscall
.endm

.data
basereg: .asciz "==BASEREG==\n"
basereg_disp: .asciz "==BASEREG+DISPLACEMENT==\n"
basereg_indexreg: .asciz "==BASEREG+INDEXREG==\n"
basereg_indexreg_tscalef: .asciz "==BASEREG+(INDEXREG*SCALE_FACTOR)==\n"
pfmt: .asciz "Array[%d]: %d\n"
array_size_fmt: .asciz "Array size: %d\n"

.text
_start:
	call get_array_size
	movq $array_size_fmt, %rdi
	movq %rax, %rsi
	call printf

	movq $basereg, %rdi
	call puts

//
	movq $0, %rdi
	call get_by_basereg

	movq $pfmt, %rdi
	movq $0, %rsi
	movq %rax, %rdx
	call printf
//
	movq $1, %rdi
	call get_by_basereg

	movq $pfmt, %rdi
	movq $1, %rsi
	movq %rax, %rdx
	call printf
//
	movq $2, %rdi
	call get_by_basereg

	movq $pfmt, %rdi
	movq $2, %rsi
	movq %rax, %rdx
	call printf
//
	movq $3, %rdi
	call get_by_basereg

	movq $pfmt, %rdi
	movq $3, %rsi
	movq %rax, %rdx
	call printf

/**/
	movq $basereg_disp, %rdi
	call puts

//
	movq $0, %rdi
	call get_by_basereg_displacement

	movq $pfmt, %rdi
	movq $0, %rsi
	movq %rax, %rdx
	call printf
//
	movq $1, %rdi
	call get_by_basereg_displacement

	movq $pfmt, %rdi
	movq $1, %rsi
	movq %rax, %rdx
	call printf
//
	movq $2, %rdi
	call get_by_basereg_displacement

	movq $pfmt, %rdi
	movq $2, %rsi
	movq %rax, %rdx
	call printf
//
	movq $3, %rdi
	call get_by_basereg_displacement

	movq $pfmt, %rdi
	movq $3, %rsi
	movq %rax, %rdx
	call printf

/**/
	movq $basereg_indexreg, %rdi
	call puts

//
	movq $0, %rdi
	call get_by_basereg_indexreg

	movq $pfmt, %rdi
	movq $0, %rsi
	movq %rax, %rdx
	call printf
//
	movq $1, %rdi
	call get_by_basereg_indexreg

	movq $pfmt, %rdi
	movq $1, %rsi
	movq %rax, %rdx
	call printf
//
	movq $2, %rdi
	call get_by_basereg_indexreg

	movq $pfmt, %rdi
	movq $2, %rsi
	movq %rax, %rdx
	call printf
//
	movq $3, %rdi
	call get_by_basereg_indexreg

	movq $pfmt, %rdi
	movq $3, %rsi
	movq %rax, %rdx
	call printf

/**/
	movq $basereg_indexreg_tscalef, %rdi
	call puts

//
	movq $0, %rdi
	call get_by_basereg_indexreg_times_scalef

	movq $pfmt, %rdi
	movq $0, %rsi
	movq %rax, %rdx
	call printf
//
	movq $1, %rdi
	call get_by_basereg_indexreg_times_scalef

	movq $pfmt, %rdi
	movq $1, %rsi
	movq %rax, %rdx
	call printf
//
	movq $2, %rdi
	call get_by_basereg_indexreg_times_scalef

	movq $pfmt, %rdi
	movq $2, %rsi
	movq %rax, %rdx
	call printf
//
	movq $3, %rdi
	call get_by_basereg_indexreg_times_scalef

	movq $pfmt, %rdi
	movq $3, %rsi
	movq %rax, %rdx
	call printf

/**/
	sys_exit_zero
