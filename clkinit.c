/* clkinit.c - clkinit */

#include "conf.h"
#include "kernel.h"
#include "sleep.h"

/* real-time clock variables and sleeping process queue pointers	*/

#ifdef	RTCLOCK
int	count6;			/* counts in 60ths of a second 6-0	*/
int     defclk;			/* non-zero, then deferring clock count */
int     clkdiff;		/* deferred clock ticks			*/
int     slnempty;		/* FALSE if the sleep queue is empty	*/
short     *sltop;			/* address of key part of top entry in	*/
				/* the sleep queue if slnempty==TRUE	*/
int     clockq;			/* head of queue of sleeping processes  */
int	preempt;		/* preemption counter.	Current process */
				/* is preempted when it reaches zero;	*/
				/* set in resched; counts in ticks	*/
int	clkruns = TRUE;		/* set TRUE iff clock exists by setclkr	*/
#else
int	clkruns = FALSE;	/* no clock configured; be sure sleep	*/
#endif				/*   doesn't wait forever		*/

void clkint(int);

/*
 *------------------------------------------------------------------------
 * clkinit - initialize the clock and sleep queue (called at startup)
 *------------------------------------------------------------------------
 */
int clkinit()
{
	
	struct sigaction sigdat;
	struct itimerval quantum;
	sigset_t maskval;




	sigemptyset(&maskval);
	sigdat.sa_handler= clkint;
	sigemptyset(&sigdat.sa_mask);
	sigdat.sa_flags = SA_RESTART;

	if(sigaction(SIGVTALRM, &sigdat, (struct sigaction *)0) == -1){
			perror("signal set error");
			exit(2);
	}


	preempt = QUANTUM;		/* initial time quantum		*/
	count6 = 6;			/* 60ths of a sec. counter	*/
	slnempty = FALSE;		/* initially, no process asleep	*/
	clkdiff = 0;			/* zero deferred ticks		*/
	defclk = 0;			/* clock is not deferred	*/
	clockq = newqueue();		/* allocate clock queue in q	*/

	quantum.it_interval.tv_sec 	= 0;
	quantum.it_interval.tv_usec = 100000;
	quantum.it_value.tv_sec  	= 0;
	quantum.it_value.tv_usec	= 100000;

	if(setitimer(ITIMER_VIRTUAL, &quantum, 
	(struct itimerval *)0) == -1){
			perror("setitimer");
			exit(3);
	}
	return;
}



