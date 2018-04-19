#ifndef VECTORIZED_TYPES_H
#define VECTORIZED_TYPES_H

#define __vector_type(blen) __attribute__((__vector_size__(blen)))

//types are defined as
// vec[size in bits for vector]_int[size in bits for the integer]_type

typedef char __vector_type(8) vec64_int8_type;
typedef short __vector_type(8) vec64_int16_type;
typedef int __vector_type(8) vec64_int32_type;

#endif