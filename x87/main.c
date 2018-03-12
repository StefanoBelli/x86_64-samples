#define rad(xdeg) ((xdeg * 3.14) / 180)
#define TOF(expr) ((expr) ? "true" : "false")
#include <stdio.h>
#include "x87-ctl.h"

//Arithmetical operations
float x87_sum(float, float);
float x87_sub(float, float);
float x87_mul(float, float);
float x87_div(float, float);

//Trascendental operations
//Must be radians
float x87_sin(float);
float x87_cos(float);
void x87_sincos(float*, float*, float);
float x87_tan(float);
float x87_atan(float);

//Constants
float x87_1dot0();
float x87_zero();
float x87_pi();
float x87_log2();
float x87_ln2();

//Comparsion
float x87_max(float, float);
float x87_min(float, float);
int x87_eq(float, float);

int main() {
	x87_ctl_init();

	float xsin, xcos;
	x87_sincos(&xsin, &xcos, rad(180));

	printf(
			"=== Constants\n"
			"x87_1dot0() = %.1f\n"
			"x87_zero() = %.1f\n"
			"x87_pi() = %.5f\n"
			"x87_log2() = %.3f\n"
			"x87_ln2() = %.3f\n",
			x87_1dot0(),
			x87_zero(),
			x87_pi(),
			x87_log2(),
			x87_ln2()
		  );

	printf(
			"=== Arithmetical\n"
			"1.34 + 1.57 = %.3f\n"
			"2.10 - 1.09 = %.3f\n"
			"3.15 * 2.19 = %.3f\n"
			"4.10 / 2.10 = %.3f\n", 
			x87_sum(1.34,1.57),
			x87_sub(2.10,1.09),
			x87_mul(3.15,2.19),
			x87_div(4.10,2.10)
		  );

	printf(
			"=== Trascendental\n"
			"x87_sin(90) = %.3f\n"
			"x87_sin(0) = %.3f\n"
			"x87_cos(90) = %.3f\n"
			"x87_cos(0) = %.3f\n"
			"x87_sincos(...,180) = (s=%.3f;c=%.3f)\n"
			"x87_tan(45) = %.3f\n"
			"x87_tan(0) = %.3f\n"
			"x87_tan(90) = %.5f\n"
			"x87_atan(45) = %.3f\n"
			"x87_atan(0) = %.3f\n"
			"x87_atan(90) = %.5f\n",
			x87_sin(rad(90)),
			x87_sin(0),
			x87_cos(rad(90)),
			x87_cos(0),
			xsin,
			xcos,
			x87_tan(rad(45)),
			x87_tan(0),
			x87_tan(rad(90)),
			x87_atan(rad(45)),
			x87_atan(0),
			x87_atan(rad(90))
		  );

	printf(
			"=== Comparsion\n"
			"x87_max(1.0,1.1) = %.1f\n"
			"x87_max(1.1,1.0) = %.1f\n"
			"x87_min(1.1,1.0) = %.1f\n"
			"x87_min(1.0,1.1) = %.1f\n"
			"x87_eq(1.1,1.1) = %s\n"
			"x87_eq(1.0,1.1) = %s\n"
			"x87_eq(1.1,1.0) = %s\n",
			x87_max(1.0,1.1),
			x87_max(1.1,1.0),
			x87_min(1.1,1.0),
			x87_min(1.0,1.1),
			TOF(x87_eq(1.1,1.1)),
			TOF(x87_eq(1.0,1.1)),
			TOF(x87_eq(1.1,1.0))
		);
	return 0;
} 
