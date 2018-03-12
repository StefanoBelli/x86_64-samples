#ifndef X87_FPU_CONTROL_MACROS_H
#define X87_FPU_CONTROL_MACROS_H

//prefix: x87_ctl_
#define x87_ctl_init() __asm__("finit;")
#define x87_ctl_init_nwpme() __asm__("fninit;")
#define x87_ctl_nop() __asm__("fnop;")
#define x87_ctl_wait() __asm__("fwait;")
#define x87_ctl_free_reg(fpu_reg) __asm__("ffree " #fpu_reg ";")
#define x87_ctl_inc_regstackptr() __asm__("fincstp;")
#define x87_ctl_dec_regstackptr() __asm__("fdecstp;")
#define x87_ctl_clear_excpflags() __asm__("fclex;")
#define x87_ctl_clear_excpflags_nwpme() __asm__("fnclex;")
#define x87_ctl_store_statusword(m2) \
	__asm__("fstsw %0;" : "=m"(m2))
#define x87_ctl_store_statusword_nwpme(m2) \
	__asm__("fnstsw %0;" : "=m"(m2))
#define x87_ctl_store_controlword(m2) \
	__asm__("fstcw %0;" : "=m"(m2))
#define x87_ctl_store_controlword_nwpme(m2) \
	__asm__("fnstcw %0;" : "=m"(m2))
#define x87_ctl_load_env(m) \
	__asm__("fldenv %0;" :: "m"(m))

#endif //X87_FPU_CONTROL_MACROS_H
