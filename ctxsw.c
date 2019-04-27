#include <conf.h>
#include <kernel.h>
#include <proc.h>
#include <mem.h>
#include <io.h>

void ctxsw(ucontext_t *old_ctxt, ucontext_t *new_ctxt){

		swapcontext(old_ctxt, new_ctxt);
		return;
}