typedef unsigned long long uint_64;

//32 byte struct begin
typedef struct __element {
	uint_64 field1;
	uint_64 field2;
	uint_64 field3;
	uint_64 field4;
} element_s;
//32 byte struct end

int valcpy(element_s);
void byptr(element_s*);

int main() {

	element_s elem = { 0, 0, 0, 1 };
	printf("valcpy() sum: %d\n",valcpy(elem));

	printf("Values **before** byptr()\n");
	printf(" --> field1: %ld\n",elem.field1);
	printf(" --> field2: %ld\n",elem.field2);
	printf(" --> field3: %ld\n",elem.field3);
	printf(" --> field4: %ld\n",elem.field4);

	byptr(&elem);
	
	printf("Values **after** byptr()\n");
	printf(" --> field1: %ld\n",elem.field1);
	printf(" --> field2: %ld\n",elem.field2);
	printf(" --> field3: %ld\n",elem.field3);
	printf(" --> field4: %ld\n",elem.field4);
	
	return 0;
}
