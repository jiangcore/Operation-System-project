/* getmem.c - getmem */

#include <conf.h>
#include <kernel.h>
#include <mem.h>

/*------------------------------------------------------------------------
 * getmem  --  allocate heap storage, returning lowest integer address
 *------------------------------------------------------------------------
 */
VSYSCALL *getmem(unsigned nbytes)
{
	sigset_t ps;
	struct	mblock	*p, *q, *leftover;

	disable(ps);
	if (nbytes==0 || memlist.mnext==NULL) {
		restore(ps);
		return( (void *)SYSERR);
	}
	nbytes = (unsigned) roundew(nbytes);
	for (q= &memlist,p=memlist.mnext ; p!=NULL ; q=p,p=p->mnext)
		if ( p->mlen == nbytes) {
			q->mnext = p->mnext;
			restore(ps);
			return( (void *)p );
		} else if ( p->mlen > nbytes ) {
			leftover = (struct mblock *)( (unsigned long)p + nbytes );
			q->mnext = leftover;
			leftover->mnext = p->mnext;
			leftover->mlen = p->mlen - nbytes;
			restore(ps);
			return( (void *)p );
		}
	restore(ps);
	return( (void *)SYSERR );
}

// the functions from mem.h

unsigned round_12(unsigned req_size){
unsigned modval;
if((modval = req_size%12) == 0)return req_size;
else
return (req_size + (12 - modval));
}


unsigned trunc_12(unsigned free_space_size){
unsigned modval;

if((modval = free_space_size%12) == 0)return free_space_size;
else
return (free_space_size - modval);
}