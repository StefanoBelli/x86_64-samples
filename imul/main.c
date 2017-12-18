#include <stdio.h>

void multiply(long,long,long*);

int main() {
	long res;
	multiply(-3,3,&res);
	printf("-3 * 3 = %ld\n",res);
	return 0;
}
