#include <mmintrin.h>
#include <stdio.h>

#include "vector_types.h"

#define IS_EQUAL_OR_NOT(expr) ((expr) ? "equal" : "NOT equal")
#define FOREACH_PRINT_RESULT(set0, set1, res, nmemb, opchr) \
	for(int i = 0; i < nmemb; ++i) \
		printf(" %d %c %d = %d\n", set0[i], opchr, set1[i], res[i])
		
int main() {
	puts("MMX\n");
	
	vec64_int8_type set0_bytes 		= { 	34, 35, 89, 30, 90, 79, -90, 50 	};
	vec64_int8_type set1_bytes 		= { 	56, 78, 90, -68, 50,  90, 80, 89 	};
	
	vec64_int16_type set0_words 	= { 	6453, -897, 1899, 500 				};
	vec64_int16_type set1_words 	= { 	3000, 892, 6785, -400 				};
	
	vec64_int32_type set0_dwords 	= { 	3648732, -4897328 					};
	vec64_int32_type set1_dwords 	= { 	-56453,   433535  					};
	
	//BYTES
	puts("PADDB:");
	vec64_int8_type result0 = __builtin_ia32_paddb(set0_bytes, set1_bytes);
	FOREACH_PRINT_RESULT(set0_bytes, set1_bytes, result0, 8, '+');
	
	puts("PSUBB");
	vec64_int8_type result1 = __builtin_ia32_psubb(set0_bytes, set1_bytes);
	FOREACH_PRINT_RESULT(set0_bytes, set1_bytes, result1, 8, '-');
	
	//WORDS
	puts("PADDW:");
	vec64_int16_type result2 = __builtin_ia32_paddw(set0_words, set1_words);
	FOREACH_PRINT_RESULT(set0_words, set1_words, result2, 4, '+');
	
	puts("PSUBW:");
	vec64_int16_type result3 = __builtin_ia32_psubw(set0_words, set1_words);
	FOREACH_PRINT_RESULT(set0_words, set1_words, result3, 4, '-');
	
	//DWORDS
	puts("PADDD:");
	vec64_int32_type result4 = __builtin_ia32_paddd(set0_dwords, set1_dwords);
	FOREACH_PRINT_RESULT(set0_dwords, set1_dwords, result4, 2, '+');
	
	puts("PSUBD:");
	vec64_int32_type result5 = __builtin_ia32_psubd(set0_dwords, set1_dwords);
	FOREACH_PRINT_RESULT(set0_dwords, set1_dwords, result4, 2, '-');
	
	//
	/// Check for equal vectors
	//
	
	vec64_int32_type set0_dwords_eq = { 1, 2 };
	vec64_int32_type set1_dwords_eq = { 1, 3 };
	
	vec64_int32_type result6 = __builtin_ia32_pcmpeqd(set0_dwords_eq, set1_dwords_eq);
	for(int i = 0; i < 2; ++i)
		printf(" %d element is %s\n", i, IS_EQUAL_OR_NOT(result6[i]));
	
	return 0;
}