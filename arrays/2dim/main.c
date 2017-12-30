#include <stdio.h>
#define N_COLS 2

long get_at(const long*, const long, const long, const long);

int main() {
	long matrix[2][2] = {
		{ 10,11 },
		{ 12,13 }
	};

	for(long i=0;i<2;++i)
		for(long j=0;j<2;++j)
			printf("matrix[%ld][%ld] = %ld\n",i,j,get_at((const long*) matrix,N_COLS,i,j));
}
