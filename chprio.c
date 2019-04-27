/* chprio.c - chprio */

#include <conf.h>
#include <kernel.h>
#include <proc.h>

/*------------------------------------------------------------------------
 * chprio  --  change the scheduling priority of a process
 *------------------------------------------------------------------------
 */
SYSCALL chprio(int pid,int newprio)
		/* newprio > 0			*/
{
	int	oldprio;
	struct	pentry	*pptr;
    sigset_t ps;

	disable(ps);
	if (isbadpid(pid) || newprio<=0 ||
	    (pptr = &proctab[pid])->pstate == PRFREE) {
		restore(ps);
		return(SYSERR);
	}

	//it needs to check the state before the change the priorty

	switch(pptr->pstate){
		case PRREADY:
				insert(dequeue(pid), rdyhead, newprio);
		case PRCURR:
				resched();
	}
	oldprio = pptr->pprio;
	pptr->pprio = newprio;
	restore(ps);
	return(oldprio);
}
