#include <stdio.h>

// SS = Scalar Single (Floating-Point)

float addss(float, float);
float subss(float, float);
float mulss(float, float);
float divss(float, float);
float maxss(float, float);
float minss(float, float);

int main() {
    float a = 1.59;
    float b = 2.51;

    printf("a = %f; b = %f\n"
           "addss: %f\n"
           "subss: %f\n"
           "mulss: %f\n"
           "divss: %f\n"
           "maxss: %f\n"
           "minss: %f\n",
           a, b, 
           addss(a,b),
           subss(a,b),
           mulss(a,b),
           divss(a,b),
           maxss(a,b),
           minss(a,b));

    return 0;
}
