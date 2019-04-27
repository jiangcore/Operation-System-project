/* ttyputc.c - ttyputc */

#include <conf.h>
#include <kernel.h>
#include <tty.h>
#include <io.h>
#include <slu.h>

/*------------------------------------------------------------------------
 *  ttyputc - write one character to a tty device
 *------------------------------------------------------------------------
 */

// int ttyputc(struct devsw *, char);

int  ttyputc(struct devsw *devptr, char ch)
{
	struct	tty   *iptr;
	sigset_t ps;

	iptr = &tty[devptr->dvminor];
        if ( ch==NEWLINE && iptr->ocrlf )
                ttyputc(devptr,RETURN);
	wait(iptr->osem);		/* wait	for space in queue	*/
	disable(ps);
	iptr->obuff[iptr->ohead++] = ch;
	if (iptr->ohead	>= OBUFLEN)
		iptr->ohead = 0;
	(iptr->ioaddr)->ctstat = SLUENABLE;
	restore(ps);
	return OK;
}
