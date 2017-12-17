#include <stdio.h>

void multiply(long,long,long*);

int main() {
	long res;
	multiply(-2,3,&res);
	printf("-2 * 3 = %ld\n",res);
	return 0;
}
