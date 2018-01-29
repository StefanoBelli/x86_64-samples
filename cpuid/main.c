#include <string.h>
#include <stdio.h>

//looking for the nth bit
#define X86_FEATURE_HTT(xedx) (xedx & (1 << 28))
#define X86_FEATURE_SSE_4_2(xecx) (xecx & (1 << 20))
#define YON(expr) (expr ? "yes" : "no")

void x86_cpuid_vendor(char*);
void x86_cpuid_features(int* ecx, int* edx);
int x86_cpuid_brand(char*);

int main() {
	char vendor[12];
	char brand_name[48];
	int dest_ecx;
	int dest_edx;
	
	memset(vendor,0,12);
	memset(brand_name,0,48);
	
	x86_cpuid_vendor(vendor);
	x86_cpuid_features(&dest_ecx, &dest_edx);
	if(x86_cpuid_brand(brand_name))
		puts("branding not supported");
	
	printf("CPU vendor: %s\n"
		   "HyperThreading: %s\n"
		   "SSE4.2: %s\n"
			 "Brand: %s\n",
				 vendor, 
				 YON(X86_FEATURE_HTT(dest_edx)),
				 YON(X86_FEATURE_SSE_4_2(dest_ecx)),
				 brand_name);
	
	return 0;
}
