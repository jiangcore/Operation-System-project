/* initialize.c - nulluser, sysinit */

#include <conf.h>
#include <kernel.h>
#include <proc.h>
#include <sem.h>
#include <sleep.h>
#include <mem.h>
#include <tty.h>
#include <q.h>
#include <io.h>
// #include <disk.h>
// #include <network.h>
#include <string.h>

extern	void	main_fun();	/* address of user's main prog	*/
extern	void	end_game();	/* end context, kill -> resched	*/
extern	void	procRCV();	/* process created by main_fun	*/
extern	void	procWTR(int);	/* process created by main_fun	*/
extern	void	procSLP(int);	/* process created by main_fun	*/
extern	void	procA(int);	/* process created by main_fun	*/
extern	void	procB(int, int);	/* process created by main_fun	*/
extern	void	procC(int, int);	/* process created by main_fun	*/
//extern  void    show_options();
extern  int    cli_main();
extern int yylex(void);
extern char * yytext;

#define     SHOW    1
#define     SUSPEND 2
#define     RESUME  3
#define     KILL    4
#define     CREATE  5
#define     PROC    6
#define     RDY     7
#define     SLP     8
#define     WTR     9
#define     RCV     10
#define     LOOP    11
#define     PROMPT  15
#define     INTEG   25
#define     JUNK    26
#define     LABEL   27
#define     STR     29
#define     EXIT    30

void    procRCV(void); //process created by CLI
void    procSLP(int); // process created ny CLI
void    procWTR(int); // process created ny CLI
void    procLOOP(void); // process created ny CLI

extern void term_mgr(int);

extern size_t strlen(const char *s);

#define lprintf0(buf, fmt)  sprintf(buf, fmt); \
write(0, buf, strlen(buf))

#define lprintf1(buf, fmt, a1)  sprintf(buf, fmt, a1); \
write(0, buf, strlen(buf))

#define lprintf2(buf, fmt, a1, a2)  sprintf(buf, fmt, a1, a2); \
write(0, buf, strlen(buf))

typedef struct{
    int state;
    void *getmem_adr;
    int size;
}MEMALLOC;

//extern MEMALLOC     memarray[500];
//extern int          memarray_max;
MEMALLOC     memarray[500];
int          memarray_max;

int iglobal = 0;


/* Declarations of major kernel variables */

struct  pentry  proctab[NPROC]; /* process table            */
int nextproc;       /* next process slot to use in create   */
struct  sentry  semaph[NSEM];   /* semaphore table          */
int nextsem;        /* next semaphore slot to use in screate*/
struct  qent    q[NQENT];   /* q table (see queue.c)        */
int nextqueue;      /* next slot in q structure to use  */
void    *maxaddr;       /* max memory address (set by sizmem)   */
#ifdef  NDEVS
struct  intmap  intmap[NDEVS];  /* interrupt dispatch table     */
#endif
struct  mblock  memlist;    /* list of free memory blocks       */
#ifdef  Ntty
struct  tty     tty[Ntty];    /* SLU buffers and mode control     */
#endif


sigset_t full_block, full_unblock;
ucontext_t posix_ctxt_init, end_game_ctxt;

/* active system status */

int	numproc;		/* number of live user processes	*/
int	currpid;		/* id of currently running process	*/
int	reboot = 0;		/* non-zero after first boot		*/

#ifdef   RTCLOCK
extern int	clkruns;
// short   *sltop = NULL;
// int   slnempty = FALSE;
#endif

int	rdyhead,rdytail;	/* head/tail of ready list (q indexes)	*/
char	vers[] = VERSION;	/* Xinu version printed at startup	*/

/************************************************************************/
/***				NOTE:				      ***/
/***								      ***/
/***   This is where the system begins after the C environment has    ***/
/***   been established.  Interrupts are initially DISABLED, and      ***/
/***   must eventually be enabled explicitly.  This routine turns     ***/
/***   itself into the null process after initialization.  Because    ***/
/***   the null process must always remain ready to run, it cannot    ***/
/***   execute code that might cause it to be suspended, wait for a   ***/
/***   semaphore, or put to sleep, or exit.  In particular, it must   ***/
/***   not do I/O unless it uses kprintf for polled output.           ***/
/***								      ***/
/************************************************************************/

/*------------------------------------------------------------------------
 *  nulluser  -- initialize system and become the null process (id==0)
 *------------------------------------------------------------------------
 */

int up=0;

LOCAL   sysinit();
void idle_thread();
void main_fun(int);

// void nulluser()		/* babysit CPU when no one home */
int main(int argc, char *argv[])
{
    int	userpid, main_fun_cnt;
    sigset_t ps;

    main_fun_cnt = 1; //atoi(argv[1]);

    sigfillset(&full_block);
    sigemptyset(&full_unblock);

    //	disable(ps);

    /*****************************************************************
     kprintf("\n\nXinu Version %s", vers);
     if (reboot++ < 1)
     kprintf("\n");
     else
     kprintf("   (reboot %d)\n", reboot);
     *****************************************************************/

    if(getcontext(&posix_ctxt_init) == -1){
        perror("getcontext failed in initialize.c ");
        exit(5);
    }

    sysinit();			/* initialize all of Xinu */

    end_game_ctxt = posix_ctxt_init;
    end_game_ctxt.uc_stack.ss_sp    = (void *)((long)getstk(MINSTK)-MINSTK+1);
    end_game_ctxt.uc_stack.ss_size  = MINSTK;
    end_game_ctxt.uc_stack.ss_flags = 0;
    makecontext(&end_game_ctxt, end_game,0);


    /******************************************************************
     kprintf("%u real mem\n",(unsigned)maxaddr+(unsigned)sizeof(int));
     kprintf("%u avail mem\n",
     (unsigned)maxaddr-(unsigned)(&end)+(unsigned)sizeof(int));
     kprintf("clock %sabled\n\n", clkruns==1?"en":"dis");
     *******************************************************************/


    /* create a process to execute the user's main program */

    up = userpid = create(main_fun,INITSTK,INITPRIO,INITNAME,INITARGC,main_fun_cnt);


    //	resume( userpid );

    setcontext (&(proctab[NULLPROC].posix_ctxt));

    write(1,"\nBAD THINGS ARE HAPPENING\n",26 );
    return;				/* unreachable			*/
}

/*------------------------------------------------------------------------
 *  sysinit  --  initialize all Xinu data structures and devices
 *------------------------------------------------------------------------
 */
LOCAL	sysinit()
{
    int	i;
    struct	pentry	*pptr;
    struct	sentry	*sptr;
    struct	mblock	*mptr;

    numproc  = 0;			/* initialize system variables */
    nextproc = NPROC-1;
    nextsem  = NSEM-1;
    nextqueue= NPROC;		/* q[0..NPROC-1] are processes */

    memlist.mnext = mptr =		/* initialize free memory list */
    (struct mblock *) malloc(FREE_SIZE);
    if(mptr == NULL){
        perror("malloc failed ");
        exit(3);
    }
    mptr->mnext = (struct mblock *)NULL;
    //	mptr->mlen = truncew((unsigned)maxaddr-NULLSTK-(unsigned)&end);
    mptr->mlen = truncew((FREE_SIZE)-(NULLSTK));

    for (i=0 ; i<NPROC ; i++)	/* initialize process table */
        proctab[i].pstate = PRFREE;

    pptr = &proctab[NULLPROC];	/* initialize null process entry */
    pptr->pstate = PRCURR;
    pptr->pprio = 0;
    for(i=0; i<7 ; ++i){
        pptr->pname[i] = *("prnull" + i);
    }
    //	strcpy(pptr->pname, "prnull");
    pptr->plimit = ( (long)mptr + (FREE_SIZE) - (NULLSTK) - 1);
    pptr->pbase = (long)mptr + (FREE_SIZE) - 1;
    *( (int *)pptr->pbase - 3 ) = MAGIC;
    pptr->paddr = idle_thread;
    pptr->phasmsg = FALSE;
    pptr->pargs = 0;
    pptr->posix_ctxt = posix_ctxt_init;

    pptr->posix_ctxt.uc_stack.ss_sp    = (void *)pptr->plimit;
    pptr->posix_ctxt.uc_stack.ss_size  = NULLSTK;
    pptr->posix_ctxt.uc_stack.ss_flags = 0;
    pptr->posix_ctxt.uc_link           = &end_game_ctxt;

    makecontext(&(pptr->posix_ctxt), idle_thread, 0);
    currpid = NULLPROC;

    for (i=0 ; i<NSEM ; i++) {	/* initialize semaphores */
        (sptr = &semaph[i])->sstate = SFREE;
        sptr->sqtail = 1 + (sptr->sqhead = newqueue());
    }

    rdytail = 1 + (rdyhead=newqueue());/* initialize ready list */

#ifdef	MEMMARK
    _mkinit();			/* initialize memory marking */
#endif
#ifdef	RTCLOCK
    clkinit();			/* initialize r.t.clock	*/
#endif
#ifdef	Ndsk
    dskdbp= mkpool(DBUFSIZ,NDBUFF);	/* initialize disk buffers */
    dskrbp= mkpool(DREQSIZ,NDREQ);
#endif

    //	for ( i=0 ; i<NDEVS ; i++ )	/* initialize devices */
    //		init(i);
    return(OK);
}

void idle_thread(){
    int i = 1, j;
    enable();			/* enable interrupts */
    while(1){
        //	write(1, "#", 1);
        if(i){
            resume(up);
            i=0;
        }
        resched();
        for(j=0; j<100000000; ++j);
    }
}

void main_fun(int arg){

    int i, j=0, k, gig_count, lcount;
    char *name = "tproc";
    int  sem1, pidA, pidB, pidC, mypid, pidCLI;

    mypid = getpid();
    write(1, "\nMAIN: main function is alive\n", 30);

    if((sem1 = screate(0)) == SYSERR){
        write(1, "\nsem create failed\n", 19);
    }

    if((pidA = create(procA, MINSTK, 20, name, 1, sem1)) == SYSERR){
        write(1, "\ncreate A failed\n", 17);
    }

    if((pidB = create(procB, MINSTK, 20, name, 2, sem1, pidA)) == SYSERR){
        write(1, "\ncreate B failed\n", 17);
    }

    if((pidC = create(procC, MINSTK, 20, name, 2, mypid, 5)) == SYSERR){
        write(1, "\ncreate C failed\n", 17);
    }

    if((pidCLI = create(cli_main, MINSTK, 20, name, 0)) == SYSERR){
        write(1, "\ncreate C failed\n", 17);
    }


    write(1, "\nMAIN: main function has created procs A B and C\n", 49);
    write(1, "\nMAIN: main function about to suspend self\n", 43);

    if(resume(pidA) == SYSERR ||
       resume(pidB) == SYSERR ||
       resume(pidC) == SYSERR){
        write(1, "\nmain resume of A B and C failed\n", 33);
    }

    /******************************************************************************
     while(arg){

     write(1, "*", 1);

     resume(create(proc, MINSTK, (23-arg), name, 1, arg));
     for(i=0; i<500000000; ++i);
     write(1, "%", 1);
     --arg;
     }
     *******************************************************************************/
    if(suspend(mypid) == SYSERR){
        write(1, "\nmain suspend failed\n", 21);
    }

    write(1, "\nMAIN: main function resumed, now sleep 30 seconds\n", 51);

    if(sleep(10) == SYSERR){
        write(1, "\nin main sleep failed\n", 20);
    }
    if (resume(pidCLI) == SYSERR){
        write(1, "\nmain resume of CLI failed\n", 27);
    }

    write(1, "\nMAIN: main function finished, goodbye\n", 39);
}


int cli_main()
{
    int tok, i, j, k, ele, secs, sem, acc_key = 0;
    unsigned short temp;
    char outbuf[150];
    char *pstr = NULL;

    lprintf0(outbuf, "\nCOMMAND INTERPRETER READY\n\n");
    lprintf0(outbuf, "enter cmd> ");

    while(tok=yylex()){
        switch(tok){
            case SHOW:    switch(tok=yylex()){
                case PROC:
                    lprintf0(outbuf, "\n IN SHOW PROC\n");
                    for(j=0; j<NPROC; ++j){
                        switch(proctab[j].pstate){
                            case PRCURR: pstr = "CURRENT";
                                break;
                            case PRFREE: pstr = "FREE";
                                break;
                            case PRREADY: pstr = "READY";
                                break;
                            case PRRECV: pstr = "RECVWAITING";
                                break;
                            case PRSLEEP: pstr = "SLEEPING";
                                break;
                            case PRSUSP: pstr = "SUSPENDED";
                                break;
                            case PRWAIT: pstr = "SEMWAITING";
                                break;
                        }

                        lprintf2(outbuf, "\nPROC %d STATE %s\n",j, pstr);
                    }
                    lprintf0(outbuf, "enter cmd> ");
                    break;
                case RDY:
                    lprintf0(outbuf, "\n IN SHOW RDY\n");
                    ele = q[rdytail].qprev;

                    for(j=0; j<NPROC; ++j){
                        if(ele < NPROC){
                            lprintf2(outbuf,"\nPROC %d PRIORITY %d\n",ele, q[ele].qkey);
                            ele=q[ele].qprev;
                        }else break;
                    }
                    lprintf0(outbuf, "enter cmd> ");
                    break;
                case SLP:
                    lprintf0(outbuf, "\n IN SHOW SLP\n");
                    ele = q[clockq].qnext;
                    acc_key = 0;
                    for(j=0; j<NPROC; ++j){
                        if(ele < NPROC){
                            acc_key += q[ele].qkey;
                            lprintf2(outbuf,"\nPROC %d WAIT TICKS %d\n", ele, acc_key);
                            ele = q[ele].qnext;
                        }else break;
                    }

                    lprintf0(outbuf, "enter cmd> ");
                    break;
                default:
                    lprintf1(outbuf, "\nBad operand after SHOW is %s\n", yytext);
                    lprintf0(outbuf, "ERROR-Try Again, or exit to quit\n");
                    lprintf0(outbuf, "enter cmd> ");
                    break;
            }
                break;



            case CREATE: switch(tok=yylex()){
                case RCV:
                    lprintf0(outbuf, "");
                    if ((k = create(procRCV, MINSTK, INITPRIO, "RCV", 0)) == SYSERR)
                        lprintf0(outbuf, "\n In CREATE WITH RCV FAILED\n");
                    lprintf0(outbuf, "\n In CREATE WITH RCV\n");
                    lprintf0(outbuf, "enter cmd> ");
                    break;
                case WTR:
                    lprintf0(outbuf, "");
                    if ((k = create(procWTR, MINSTK, INITPRIO, "WTR", 1, screate(0))) == SYSERR)
                        lprintf0(outbuf, "\n In CREATE WITH RCV FAILED\n");
                    lprintf0(outbuf, "\n In CREATE WITH WTR\n");
                    lprintf0(outbuf, "enter cmd> ");
                    break;
                case SLP:
                    lprintf0(outbuf, "");
                    if ((k = create(procSLP, MINSTK, INITPRIO, "SLP", 2, rand()%30)) == SYSERR)
                        lprintf0(outbuf, "\n In CREATE WITH RCV FAILED\n");
                    lprintf0(outbuf, "\n In CREATE WITH SLP\n");
                    lprintf0(outbuf, "\nenter cmd> ");
                    break;
                default:
                    lprintf1(outbuf, "\nBad operand after CREATE is %s\n", yytext);
                    lprintf0(outbuf, "ERROR- Try Again, or exit to quit\n");
                    lprintf0(outbuf, "enter cmd> ");
                    break;
            }
                break;

            case SUSPEND:   switch(tok=yylex()){
                case INTEG:
                    lprintf1(outbuf, "\n IN SUSPEND WITH pid %s\n", yytext);
                    if(suspend(atoi(yytext))==SYSERR){
                        lprintf1(outbuf, "\nsuspend failed for pid %s\n", yytext);
                    }
                    lprintf0(outbuf, "enter cmd> ");
                    break;
                default:
                    lprintf1(outbuf, "\nBad operand after SUSPEND is %s\n", yytext);
                    lprintf0(outbuf, "ERROR- Try Again, or exit to quit\n");
                    lprintf0(outbuf, "enter cmd> ");
                    break;
            }
                break;

            case RESUME:    switch(tok=yylex()){
                case INTEG:
                    lprintf1(outbuf, "\n IN RESUME with pid %s\n", yytext);
                    k = atoi(yytext);
                    if(resume(k) == SYSERR){
                        lprintf1(outbuf, "\nresume failed for pid %s\n", yytext);
                    }
                    lprintf0(outbuf, "enter cmd> ");
                    break;
                default:
                    lprintf1(outbuf, "\nBad operand after RESUME is %s\n", yytext);
                    lprintf0(outbuf, "ERROR- Try Again, or exit to quit\n");
                    lprintf0(outbuf, "enter cmd> ");
                    break;
            }
                break;

            case KILL: switch(tok=yylex()){
                case INTEG:
                    lprintf1(outbuf, "\n IN KILL WITH pid %s\n", yytext);
                    if(kill(atoi(yytext)) == SYSERR){
                        lprintf1(outbuf, "\nkill failed fo pid %s\n", yytext);
                    }
                    lprintf0(outbuf, "enter cmd> ");
                    break;
                default:
                    lprintf1(outbuf, "\nBad operand after KILL is %s\n", yytext);
                    lprintf0(outbuf, "ERROR- Try Again, or exit to quit\n");
                    lprintf0(outbuf, "enter cmd> ");
                    break;
            }break;

            case EXIT:
                lprintf0(outbuf, "COMMOND LINE INTERPRETER IS DONE, GOODBYE\n");
                for (j = 0; j < NPROC; ++j) {
                    if (proctab[j].pstate != PRFREE && j != currpid)
                        kill(j);
                }
                return;

            default:
                lprintf1(outbuf, "\nBad operand %s\n", yytext);
                lprintf0(outbuf, "ERROR-Try Again, or exit to quit\n");
                lprintf0(outbuf, "enter cmd> ");
                break;
        }
    }
}

void procRCV(void){
    char outbuf[150];
    int pid;
    pid = getpid();

    lprintf1(outbuf, "\nRCV is alive with pid %d\n", pid);
    if(receive() == SYSERR){
        lprintf0(outbuf, "\n in RCV receive failed\n");
    }

    lprintf0(outbuf, "\n  rvc has receive a msg, is now done, goodbye\n");
}

void procSLP(int sec){
    char outbuf[150];
    lprintf1(outbuf, "\nSLP is alive with pid %d\n", getpid());
    lprintf1(outbuf, "SLP will now sleep for %d seconds\n", sec);

    if(sleep(sec) == SYSERR){
        lprintf1(outbuf, "\nreveive error in SLP process with pid %d\n", getpid());
    }

    lprintf1(outbuf, "\nawake: SLP process with pid %d is over.\n", getpid());
}

void procWTR(int sem){
    char outbuf[150];
    lprintf1(outbuf, "\nWTR is alive with pid %d\n", getpid());
    if(wait(sem) == SYSERR){
        lprintf1(outbuf, "\nwait error in WTR process with pid %d\n", getpid());
    }

    lprintf1(outbuf, "\nwaiting finished: WTR process with pid %d is over.\n", getpid());

}

void procLOOP(void){
    struct mblock *p;
    char outbuf[150];
    int j, i;
    lprintf1(outbuf, "\n LOOP process is alive with pid %d\n", getpid());
    lprintf0(outbuf, "\n LOOP will print the free list and then spin\n");
    for(p = memlist.mnext; p!=NULL; p = p->mnext){
        lprintf1(outbuf, "\nFreeblock is %d\n", p->mlen);
    }
    lprintf1(outbuf, "\nFLEX memarray_max is %d\n", memarray_max);
    for(i = 0; i< memarray_max+1; ++i){
        lprintf2(outbuf, "\nFLEXx block is %d Bytes %s\n", memarray[i].size, memarray[i].state?"in_use":"free");
    }
    sleep10(5);
    while(1){
        resched();
        for(j=0; j<100000000; ++j){};
    }
}

void end_game(){
    write(1,"<>",2);
    kill(getpid());
}


void procA(int arg){
    write(1, "\nA: process A is alive\n", 22);
    write(1, "\nA: process A is about to wait on a sem\n", 39);

    if(wait(arg) == SYSERR){
        write(1, "\nin A wait failed\n", 18);
    }

    write(1, "\nA: process A is awake from sem, will wait for msg\n", 51);

    if(receive() == SYSERR){
        write(1, "\nin A receive failed\n", 21);
    }

    write(1, "\nA: process A has received a msg\n", 33);
    write(1, "\nA: process A is done, goodbye\n", 31);
}

void procB(int arg1, int arg2){
    write(1, "\nB: process B is alive\n", 22);
    write(1, "\nB: process B is about to sleep for 2 seconds\n", 45);

    if(sleep(2) == SYSERR){
        write(1, "\nin B sleep failed\n", 19);
    }

    write(1, "\nB: process B is awake from sleep, will signal sem\n", 51);

    if(signal(arg1) == SYSERR){
        write(1, "\nin B signal failed\n", 20);
    }

    write(1, "\nB: process B is again to sleep for 2 seconds\n", 45);

    if(sleep(2) == SYSERR){
        write(1, "\nin B sleep2 failed\n", 20);
    }

    write(1, "\nB: process B is awake from sleep, will send msg to A\n", 54);

    if(send(arg2, 111) == SYSERR){
        write(1, "\nin B msg send failed\n", 22);
    }

    write(1, "\nB: process B is about to sleep for 40 seconds\n", 45);

    if(sleep(40) == SYSERR){
        write(1, "\nin B sleep3 failed\n", 20);
    }

    //write(1, "\nB: process B is awake from sleep, goodbye\n", 43);
}

void procC(int arg1, int arg2){
    write(1, "\nC: process C is alive\n", 22);
    write(1, "\nC: process C is about to sleep for arg2 seconds\n", 48);

    if(sleep(arg2) == SYSERR){
        write(1, "\nin C sleep failed\n", 19);
    }

    write(1, "\nC: process C is awake from sleep, main is suspended\n", 52);

    if(resume(arg1) == SYSERR){
        write(1, "\nin C resume failed\n", 20);
    }

    write(1, "\nC: process C is starting the CLI\n", 35);
}
