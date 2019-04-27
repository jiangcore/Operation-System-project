/* kill.c - kill */

#include <conf.h>
#include <kernel.h>
#include <proc.h>
#include <sem.h>
#include <mem.h>
#include <io.h>
#include <q.h>

/*------------------------------------------------------------------------
 * kill  --  kill a process and remove it from the system
 *------------------------------------------------------------------------
 */
SYSCALL kill(int pid)          	 /* process to kill		*/
{
	struct	pentry	*pptr;		/* points to proc. table for pid*/
	sigset_t ps;

	disable(ps);
	if (isbadpid(pid) || (pptr= &proctab[pid])->pstate==PRFREE) {
		restore(ps);
		return(SYSERR);
	}
	//if there is no more process
	if(--numproc == 0){
		write(1, "\nAll PROCS DONE\n", 16);
		exit(0);
	}

	freestk(pptr->pbase, pptr->pstklen);
	switch (pptr->pstate) {

	  case PRCURR:	pptr->pstate = PRFREE;	/* suicide */
			resched();


	  case PRSLEEP: if (q[q[pid].qnext].qkey != MAXINT){
	  					q[q[pid].qnext].qkey += q[pid].qkey;
	  				}
	  				pptr->pstate = PRFREE;
	  				dequeue(pid);
	  				break;

	  case PRWAIT:	semaph[pptr->psem].semcnt++;
						/* fall through */

	  case PRREADY:	dequeue(pid);

	  default:	pptr->pstate = PRFREE;
	}
	restore(ps);
	return(OK);
}
