#include <stdio.h>

//looking for the nth bit
#define X86_FEATURE_HTT(xedx) (xedx & (1 << 28))
#define X86_FEATURE_SSE_4_2(xecx) (xecx & (1 << 20))
#define YON(expr) (expr ? "yes" : "no")

void x86_cpuid_vendor(char*);
void x86_cpuid_features(int* ecx, int* edx);

int main() {
	char vendor[12];
	int dest_ecx;
	int dest_edx;

	x86_cpuid_vendor(vendor);
	x86_cpuid_features(&dest_ecx, &dest_edx);

	printf("CPU vendor: %s\n"
		   "HyperThreading: %s\n"
		   "SSE4.2: %s\n",vendor, YON(X86_FEATURE_HTT(dest_edx)),YON(X86_FEATURE_SSE_4_2(dest_ecx)));
	
	return 0;
}
