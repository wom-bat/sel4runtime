/*
 * Copyright 2018, Data61
 * Commonwealth Scientific and Industrial Research Organisation (CSIRO)
 * ABN 41 687 119 230.
 *
 * This software may be distributed and modified according to the terms of
 * the BSD 2-Clause license. Note that NO WARRANTY is provided.
 * See "LICENSE_BSD2.txt" for details.
 *
 * @TAG(DATA61_BSD)
 */
#include "autoconf.h"

.section .text
.global _sel4_start
_sel4_start:
	ldr x19, =__thread_base
	add sp, x19, #0
	bl __sel4_start_root
	/* should not return */
1:
	b 1b

.section .bss
__thread_base:
	.align 16
	.space CONFIG_SEL4RUNTIME_ROOT_STACK
__thread_top: