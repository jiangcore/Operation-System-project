/* clkint.c - clkint, clock interrupt service routine */

#include <conf.h>
#include <kernel.h>
#include <proc.h>
#include <mem.h>
#include <sleep.h>

ISR clkint(int signum){
	write(1, ".", 1);
    if (++count6%6) {
        return;
    }
	if(defclk > 0){
		++clkdiff;
		return;
	}
	if(slnempty == TRUE){
		write(1,"!",1);
		if(--(*sltop) == 0)wakeup();
	}
	if(--preempt == 0){
		resched();
	}
	return;
}
