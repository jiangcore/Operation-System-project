/* create.c - create, newpid */

#include <conf.h>
#include <kernel.h>
#include <proc.h>
#include <mem.h>
#include <io.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>

LOCAL newpid();

/*------------------------------------------------------------------------
 *  create  -  create a process to start running a procedure
 *------------------------------------------------------------------------
 */
SYSCALL create(void (*procaddr)(),
	//int	*procaddr,		/* procedure address		*/
	int	ssize,			/* stack size in words		*/
	int	priority,		/* process priority > 0		*/
	char	*name,			/* name (for debugging)		*/
	int	nargs,			/* number of args that follow	*/
	int first_arg,
	...)
	
	//int	args;			/* arguments (treated like an	*/
					/* array in the code)		*/
{
	int	pid;			/* stores new process id	*/
	struct	pentry	*pptr;		/* pointer to proc. table entry */
	int	i, a2, a3, a4, a5;
	int	*a;			/* points to list of args	*/
	void	*saddr;			/* stack address		*/
	sigset_t	ps;			/* saved processor status	*/
	int	INITRET();
	disable(ps);
	ssize = roundew(ssize);
	if ( ssize < MINSTK || (((long)(saddr=getstk(ssize))) == SYSERR ) ||
		(pid=newpid()) == SYSERR || nargs > MAXARGCNT ||
		priority < 1 ) {
		restore(ps);
		return(SYSERR);
	}
	numproc++;
	pptr = &proctab[pid];
	pptr->pstate = PRSUSP;
	for (i=0 ; i<PNMLEN && (pptr->pname[i]=name[i])!=0 ; i++)
		;
	pptr->pprio = priority;
	pptr->pbase = (long)saddr;
	pptr->pstklen = ssize;
	pptr->psem = 0;
	pptr->phasmsg = FALSE;
	pptr->plimit = ((long)(saddr) - ssize + 1);
	pptr->pargs = nargs;
	
	pptr->posix_ctxt = posix_ctxt_init;
	
	pptr->posix_ctxt.uc_stack.ss_sp 	= (void *)pptr->plimit;
	pptr->posix_ctxt.uc_stack.ss_size 	= ssize;
	pptr->posix_ctxt.uc_stack.ss_flags 	= 0;
	pptr->posix_ctxt.uc_link			= &end_game_ctxt;
	

    va_list ap;
    va_start(ap, first_arg);
	switch(nargs){
		case 0:		makecontext(&(pptr->posix_ctxt), procaddr, nargs);
					break;
		case 1: 	makecontext(&(pptr->posix_ctxt), procaddr, nargs, first_arg);
					break;
		case 2:		a2 = va_arg(ap, int);
					makecontext(&(pptr->posix_ctxt), procaddr, nargs, first_arg, a2);
					break;
		case 3: 	a2 = va_arg(ap, int);
					a3 = va_arg(ap, int);
					makecontext(&(pptr->posix_ctxt), procaddr, nargs, first_arg, a2, a3);
					break;
		case 4:		a2 = va_arg(ap, int);
					a3 = va_arg(ap, int);
					a4 = va_arg(ap, int);
					makecontext(&(pptr->posix_ctxt), procaddr, nargs, first_arg, a2, a3, a4);
					break;
		case 5: 	a2 = va_arg(ap, int);
					a3 = va_arg(ap, int);
					a4 = va_arg(ap, int);
					a5 = va_arg(ap, int);
					makecontext(&(pptr->posix_ctxt), procaddr, nargs, first_arg, a2, a3, a4, a5);
					break;					
		
	}

	//printf("\n\n nargs=%d, first_arg=%d\n", nargs, first_arg);
	//printf("arguments are int,value: %d, %d, %d, %d\n", a2, a3, a4);

    va_end(ap);

	//for (i=0 ; i<PNREGS ; i++)
	//	pptr->pregs[i]=INITREG;
	//pptr->pregs[PC] = pptr->paddr = (int)procaddr;
	//pptr->pregs[PS] = INITPS;
	//a = (&args) + (nargs-1);	/* point to last argument	*/
	//for ( ; nargs > 0 ; nargs--)	/* machine dependent; copy args	*/
	//	*saddr-- = *a--;	/* onto created process' stack	*/
	//*saddr = (int)INITRET;		/* push on return address	*/
	//pptr->pregs[SP] = (int)saddr;
	restore(ps);
	return(pid);
}

/*------------------------------------------------------------------------
 * newpid  --  obtain a new (free) process id
 *------------------------------------------------------------------------
 */
LOCAL	newpid()
{
	int	pid;			/* process id to return		*/
	int	i;

	for (i=0 ; i<NPROC ; i++) {	/* check all NPROC slots	*/
		if ( (pid=nextproc--) <= 0)
			nextproc = NPROC-1;
		if (proctab[pid].pstate == PRFREE)
			return(pid);
	}
	return(SYSERR);
}
