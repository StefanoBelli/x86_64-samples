#include <stdio.h>

typedef unsigned long long uint_64;
typedef struct __element_s {
	uint_64 field1;
	uint_64 field2;
	uint_64 field3;
	uint_64 field4;
} element_s;

void print_field_sum(element_s elem) {
	printf("field1: %lld\n"
			"field2: %lld\n"
			"field3: %lld\n"
			"field4: %lld\n"
			"sum: %lld\n", 
			elem.field1, elem.field2, elem.field3, elem.field4,
			elem.field1 + elem.field2 + elem.field3 + elem.field4);
}

void byptr_structure(element_s* elem) {
	elem->field1 = 10;
	elem->field2 = 11;
	elem->field3 = 12;
	elem->field4 = 13;
}
