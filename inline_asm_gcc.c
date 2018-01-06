#include <stdio.h>

/*
 * __asm__ [__volatile__] (
 * 		template
 * 		: output operands
 * 		: input operands
 * 		: clobbed registers
 * 	);
 */

int ret_something() {
	__asm__("movl $1, %%eax;" ::: "%eax");
}

int direct_sum(int a, int b) {
	__asm__ __volatile__ (
			"movl %0, %%eax;"
			"addl %1, %%eax;"
			: : "r"(a), "r"(b) : "%eax"
	);
}

int sum(int a, int b) {
	int result;

	__asm__ __volatile__ (
			"movl %1, %%eax;"
			"addl %2, %%eax;"
			"movl %%eax, %0;"
			: "=r"(result) : "r"(a), "r"(b) :
	);

	return result;
}

int main() {
	printf("direct_sum(1,2) = %d\n", direct_sum(1,2));
	printf("sum(1,2) = %d\n", sum(1,2));
	
	return ret_something();
}
