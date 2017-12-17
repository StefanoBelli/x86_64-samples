#include <stdio.h>

int divide(long, long, long*, long*);

int main() {
	long quot;
	long rem;

	if(!divide(6,4,&quot,&rem)) {
		fprintf(stderr,"Division by zero\n");
		return 1;
	}

	printf(" 6 / 4 = %ld with %ld\n",quot,rem);
	return 0;
}
