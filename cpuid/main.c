#include <string.h>
#include <stdio.h>

//looking for the nth bit
#define X86_FEATURE_HTT(xedx) (xedx & (1 << 28))
#define X86_FEATURE_SSE_4_2(xecx) (xecx & (1 << 20))
#define X86_FEATURE_SYSCALL(xedx) (xedx & (1 << 11))
#define X86_EXTND_FEATURE_VAES(xecx) (xecx & (1 << 9))
#define X86_EXTND_FEATURE_BMI_1(xebx) (xebx & (1 << 3))
#define X86_EXTND_FEATURE_BMI_2(xebx) (xebx & (1 << 8))
#define X86_EXTND_FEATURE_AVX_512_4VNNIW(xedx) (xedx & (1 << 2))
#define X86_EXTND_FEATURE_SHA_INTEL_EXT(xebx) (xebx & (1 << 29))
#define X86_IDENTIFY_STEPPING(xeax) (xeax & 0xF)

#define YON(expr) (expr ? "yes" : "no")

void x86_cpuid_vendor(char*);
int x86_cpuid_features(int* ecx, int* edx);
int x86_cpuid_brand(char*);
int x86_has_cpuid();
void x86_cpuid_extnd_features(int* ebx, int* ecx, int* edx);

int main() {
	printf("checking if cpuid instruction is availible... ");
	if(x86_has_cpuid())
		puts("yes");
	else {
		puts("no");
		return 1;
	}

	char vendor[13];
	char brand_name[49];
	int dest_ecx_0;
	int dest_edx_0;
	int dest_ebx_0;
	int dest_ecx_1;
	int dest_edx_1;
	int dest_eax_0;

	memset(vendor,0,13);
	memset(brand_name,0,49);

	x86_cpuid_vendor(vendor);
	dest_eax_0 = x86_cpuid_features(&dest_ecx_0, &dest_edx_0);
	x86_cpuid_extnd_features(&dest_ebx_0, &dest_ecx_1, &dest_edx_1);
	if(x86_cpuid_brand(brand_name))
		puts("branding not supported");

	printf("CPU Stepping: 0x%x\n"
			"CPU vendor: %s\n"
		   	"HyperThreading: %s\n"
		   	"SSE4.2: %s\n"
		   	"syscall: %s\n"
		   	"VAES: %s\n"
		   	"BMI1: %s\n"
		   	"BMI2: %s\n"
		   	"AVX-512/4VNNIW: %s\n"
		   	"SHA Extensions: %s\n"
			"Brand: %s\n",
			X86_IDENTIFY_STEPPING(dest_eax_0),
			vendor, 
			YON(X86_FEATURE_HTT(dest_edx_0)),
			YON(X86_FEATURE_SSE_4_2(dest_ecx_0)),
			YON(X86_FEATURE_SYSCALL(dest_edx_0)),
			YON(X86_EXTND_FEATURE_VAES(dest_ecx_1)),
			YON(X86_EXTND_FEATURE_BMI_1(dest_ebx_0)),
			YON(X86_EXTND_FEATURE_BMI_2(dest_ebx_0)),
			YON(X86_EXTND_FEATURE_AVX_512_4VNNIW(dest_edx_1)),
			YON(X86_EXTND_FEATURE_SHA_INTEL_EXT(dest_ebx_0)),
			brand_name);

	return 0;
}
