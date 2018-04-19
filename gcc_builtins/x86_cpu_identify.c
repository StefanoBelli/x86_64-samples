#include <x86intrin.h>
#include <stdio.h>

int main() {
	puts("running cpu detection code...\n");
	
	// Execute CPU detection code
	__builtin_cpu_init();
	
	// fetch informations about CPU
	if(__builtin_cpu_is("intel"))
		puts("intel CPU detected\n");
	else if(__builtin_cpu_is("amd"))
		puts("amd CPU detected\n");
	else
		puts("unknown CPU manufacturer\n");
	
	// check for particular extension
	if(__builtin_cpu_supports("mmx"))
		puts("MMX: yes");
	
	if(__builtin_cpu_supports("sse"))
		puts("SSE: yes");
	
	if(__builtin_cpu_supports("ssse3"))
		puts("SSSE3: yes");
	
	if(__builtin_cpu_supports("avx2"))
		puts("AVX2: yes");
	
	if(__builtin_cpu_supports("cmov"))
		puts("CMOV[cc] instruction: yes");
	
	return 0;
}