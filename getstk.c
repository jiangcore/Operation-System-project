/* getstk.c - getstk */

#include <conf.h>
#include <kernel.h>
#include <mem.h>

/*------------------------------------------------------------------------
 * getstk  --  allocate stack memory, returning address of topmost int
 *------------------------------------------------------------------------
 */
VSYSCALL *getstk( unsigned int nbytes)
{
	sigset_t ps;
	struct	mblock	*p, *q;	  /* q follows p along memlis  */
	struct	mblock	*fits, *fitsq;
	unsigned len;

	disable(ps);
	if (nbytes == 0) {
		restore(ps);
		return( (void *)SYSERR );
	}
	nbytes = (unsigned)roundew(nbytes);
	fits = NULL;
	q = &memlist;
	for (p = q->mnext ; p != NULL ; q = p,p = p->mnext)
		if ( p->mlen >= nbytes) {
			fitsq = q;
			fits = p;
		}
	if (fits == NULL) {
		restore(ps);
		return( (void *)SYSERR );
	}
	if (nbytes == (len = fits->mlen) ) {
		fitsq->mnext = fits->mnext;
	} else {
		fits->mlen -= nbytes;
	}
	fits = (struct mblock *)(((unsigned long)fits) + (unsigned long)(len) - 1L);
	*((unsigned long*) fits) = nbytes; /* put size at base */
	restore(ps);
	return( (void *)fits );
}
