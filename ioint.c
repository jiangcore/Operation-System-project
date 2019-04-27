/* ioint.c - ioint */

#include <conf.h>
#include <kernel.h>
#include <io.h>

/*------------------------------------------------------------------------
 *  ioint --  standard interrupt dispatch management .. signals come here
 *------------------------------------------------------------------------
 */

void ioint(int sig_num){
	int     descrp = CONSOLE;
//      struct  devsw   *devptr;
        struct  intmap  *map;
	
	map = &intmap[descrp];

	switch(sig_num){
	  case SIGUSR1:	map->iin(map->icode);
			break;
	  case SIGUSR2: map->iout(map->ocode);
			break;
	}
}
