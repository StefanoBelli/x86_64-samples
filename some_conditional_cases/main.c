#include <stdio.h>

typedef unsigned char byte;
typedef unsigned long uint64_type;

byte is_true_setcc(byte);
byte is_false_jcc(byte);
uint64_type max_cmovcc(uint64_type,uint64_type);
uint64_type count_loopcc(uint64_type);

int main() {
	printf("is_true_setcc(1) = %d\n", is_true_setcc(1));
	printf("is_true_setcc(0) = %d\n", is_true_setcc(0));
	printf("is_false_jcc(1)  = %d\n", is_false_jcc(1));
	printf("is_false_jcc(0)  = %d\n", is_false_jcc(0));
	printf("max_cmovcc(1,2)  = %ld\n", max_cmovcc(1,2));
	printf("max_cmovcc(2,1)  = %ld\n", max_cmovcc(2,1));
	printf("max_cmovcc(1,1)  = %ld\n", max_cmovcc(1,1));
	printf("count_loopcc(5)  = %ld\n", count_loopcc(5));

	return 0;
}

