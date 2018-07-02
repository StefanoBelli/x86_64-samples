#include <stdio.h>
#include <stdbool.h>

bool comiss_equal(float, float);
bool comiss_nequal(float, float);
bool comiss_major(float, float);
bool comiss_minor(float, float);

void compare_and_print(float a, float b) {
    printf("\n--> a: %f, b: %f\n"
           "comiss_equal: %d\n"
           "comiss_nequal: %d\n"
           "comiss_major: %d\n"
           "comiss_minor: %d\n",
           a,b,
           comiss_equal(a,b),
           comiss_nequal(a,b),
           comiss_major(a,b),
           comiss_minor(a,b)
          );
}

int main() {

    compare_and_print(1.45, 1.34);
    compare_and_print(2.10, 2.10);
    compare_and_print(-2.9, 8.8);
    compare_and_print(8.8, -2.9);
    compare_and_print(-5.5, -5.5);

    return 0;
}
