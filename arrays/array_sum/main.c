#include <stdio.h>

long elem_sum(const long*, long);

int main() {
	long array[5] = { -1,2,3,4,5 };
	printf("sum of -1 + 2 + 3 + 4 + 5 is %ld\n",elem_sum(array,5));
	return 0;
}
