#include <stdio.h>

typedef enum __e_rounding_mode {
    ROUNDING_NEAREST,
    ROUNDING_DOWN,
    ROUNDING_UP,
    ROUNDING_TRUNCATE
} rounding_mode;

rounding_mode mxcsr_rm();
int mxcsr();
void mxcsr_set_rm(rounding_mode);

int cvtss2si(float);
float cvtsi2ss(int);
double cvtss2sd(float);
int cvtsd2si(double);

void print_mxcsr_mode() {
    printf("rounding_mode: ");

    rounding_mode mxcsr_rm_mode = mxcsr_rm();

    if(mxcsr_rm_mode == ROUNDING_NEAREST)
        printf("nearest\n");
    else if(mxcsr_rm_mode == ROUNDING_DOWN)
        printf("down\n");
    else if(mxcsr_rm_mode == ROUNDING_UP)
        printf("up\n");
    else
        printf("truncate\n");
}

int main() {
    
    printf("MXCSR status: 0x%x\n",mxcsr());
    mxcsr_set_rm(ROUNDING_DOWN);
    print_mxcsr_mode();
    printf("MXCSR status: 0x%x\n",mxcsr());

    printf("(int)3.45 = %d\n"
           "(float)4 = %f\n"
           "(double)9.67 = %f\n"
           "(int)6.88888888888888 = %d\n",
           cvtss2si(3.45),
           cvtsi2ss(4),
           cvtss2sd(9.67),
           cvtsd2si(6.88888888888888));
    
    return 0;
}
