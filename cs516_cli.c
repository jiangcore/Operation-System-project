// XINU cli
//
//
#include <stdio.h>
#include <stdlib.h>
#include <conf.h>
#include <kernel.h>
#include <proc.h>
#include <sem.h>
#include <sleep.h>
#include <men.h>
#include <slu.h>
#include <tty.h>
#include <q.h>
#include <io.h>

// same defines as in the flex scanner file
// should put these in an include file and
// include them in both flex file and here

#define     SHOW    1
#define     SUSPEND 2
#define     RESUME  3
#define     KILL    4
#define     CREATE  5
#define     proc    6
#define     RDY     7
#define     SLP     8
#define     WTR     9
#define     RCV     10
#define     LOOP    11
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

// some simle printing macros for use in xinu
//
#define lprintf0(buf, fmt)  sprintf(buf, fmt); \
                            write(0, buf, strlen(buf))

#define lprintf1(buf, fmt, a1)  sprintf(buf, fmt, a1); \
                                write(0, buf, strlen(buf))

#define lprintf2(buf, fmt, a1, a2)  sprintf(buf, fmt, a1, a2); \
                                    write(0, buf, strlen(buf))

// imported from the lex.yy.c code
extern int yylex(void);
extern char * yytext;

// a memory management interface to replace mallow within
// flex generate code ising memarry to keep track of XINU
// getmen() allocations
typedef struct{
    int state;
    void *getmem_adr;
    int size;
}MEMALLOC;

extern MEMALLOC     memarray[500];
extern int          memarray_max;

int iglobal = 0;

// XINU function to run the CLI
int cli_main()
{
    int tok, i, j, k, secs, sem, delta = 0;
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
                           }// switch
                           lprintf2(outbuf, "\nPROC %d STATE %s\n",j, pstr);
                        }// for
//                      lprintf0(outbuf, "enter cmd> ");
                      break;
                      case RDY:
                        lprintf0(outbuf, "\n IN SHOW RDY\n");
                        k = q[rdytail].qprev;
                        for(j=0; j<NPROC; ++j){
                            if(k< NPROC){
                            lprintf2(outbuf,"\nPROC %d PRIORITY %d\n",k, q[k].qkey);
                            k=q[k].qprev;
                            }else break;
                        }
            //          lprintf0(outbuf, "enter cmd> ");
                      break;
                      case SLP:
                        lprintf0(outbuf, "\n IN SHOW SLP\n");
                        k = q[clockq].qnext;
                        for(j=0; j<NPROC; ++j){
                           if(k<PROC){
                            lprintf2(outbuf,"\nPROC %d WAIT TICKS %d\n", k, q[k].qkey);
                            k = q[k].qnext;
                            }else break;
                        }

            //            lprintf0(outbuf, "enter cmd> ");
                      break;
                      default:
                        lprintf1(outbuf, "\nBad operand after SHOW is %s\n", yytext);
                        lprintf0(outbuf, "ERROR-Try Again, or exit to quit\n");
            //          lprintf0(outbuf, "enter cmd> ");
                      break;
                   }
      break;

      case SUSPEND:   switch(tok=yylex()){
                      case INTEG:
                         lprintf1(outbuf, "\n IN SUSPEND WITH pid %s\n", yytext);
                         if(suspend(atoi(yytext))==SYSERR){
                           lprintf1(outbuf, "\nsuspend failed for pid %s\n", yytext);
                         }
                //         lprintf0(outbuf, "enter cmd> ");
                      break;
                      default:
                         lprintf1(outbuf, "\nBad operand after SUSPEND is %s\n", yytext);
                         lprintf0(outbuf, "ERROR- Try Again, or exit to quit\n");
                //       lprintf0(outbuf, "enter cmd> ");
                      break;
                      }
      break;

      case RESUME:    switch(tok=yylex()){
                      case INTEG:
                         lprintf1(outbuf, "\n IN RESUME with pid %s\n", yytext);
                         if(resume(atoi(yytext)) == SYSERR){
                         lprintf1(outbuf, "\nresume failed for pid %s\n", yytext);
                         }
            //        lprintf0(outbuf, "enter cmd> ");
                       break;
                      default:
                          lprintf1(outbuf, "\nBad operand after RESUME is %s\n", yytext);
                          lprintf0(outbuf, "ERROR- Try Again, or exit to quit\n");
              //          lprintf0(outbuf, "enter cmd> ");
                      break;
                    }
      break;

      case KILL:      switch(tok=yylex()){
                      case INTEG:
                          lprintf1(outbuf, "\n IN KILL WITH pid %s\n", yytext);
                          if(kill(atoi(yytext)) == SYSERR){
                            lprintf1(outbuf, "\nkill failed fo pid %s\n", yytext);
                          }
                //        lprintf0(outbuf, "enter cmd> ");
                      break;
                      default:
                          lprintf1(outbuf, "\nBad operand after KILL is %s\n", yytext);
                          lprintf0(outbuf, "ERROR- Try Again, or exit to quit\n");
                //        lprintf0(outbuf, "enter cmd> ");
                      break;
                  }
      break;

      case  CREATE:    switch(tok=yylex()){ //1:12:40
                        case RCV:
                          lprintf0(outbuf, "\n IN CREATE WITH RCV\n");
                          if(create(procRCV, MINSTK, 15, "RCV", 0) == SYSERR){
                              lprintf0(outbuf, "\n create procRCV failed\n");
                          }
                //        lprintf0(outbuf, "enter cmd>");
                        break;
                        case SLP:
                          lprintf0(outbuf, "\n IN CREATE WITH SLP\n");
                          secs = 120;
                          if(create(procRCV, MINSTK, 15, "SLP", 1, secs) == SYSERR){
                              lprintf0(outbuf, "\n create procSLP failed\n");
                          }
                //        lprintf0(outbuf, "enter cmd>");
                        break;
                        case WTR:
                          lprintf0(outbuf, "\n IN CREATE WITH WTR\n");
                          if((sem = screate(0)) == SYSERR){
                              lprintf0(outbuf, "\n sem create failed\n");
                          }
                          if(create(procWTR, MINSTK, 15, "WTR", 1, sem) == SYSERR){
                              lprintf0(outbuf, "\n create procSLP failed\n");
                          }
                //        lprintf0(outbuf, "enter cmd>");
                        break;
                        case LOOP:
                          lprintf0(outbuf, "\n IN CREATE WITH LOOP\n");
                          if(create(procLOOP, MINSTK, 15, "LOOP", 0) == SYSERR){
                              lprintf0(outbuf, "\n create procLOOP failed\n");
                          }
                //        lprintf0(outbuf, "enter cmd>");
                        break;
                        default:
                          lprintf1(outbuf, "\nBad operand after CREATE is %s\n", yytext);
                          lprintf0(outbuf, "ERROR- Try Again, or exit to quit\n");
                //        lprintf0(outbuf, "enter cmd> ");
                        break;
                    }
      break;

      case EXIT: lprintf0(outbuf, "COMMOND LINE INTERPRETER IS DONE, GOODBYE\n");
            term_mgr(-1);
      case PROMOT: lprintf0(outbuf, "\n entercmd>");
            break;
      case JUNK:
          lprintf1(outbuf, "\n CLI HAS JUNK: %s\n", yytext);
          lprintf0(outbuf, "ERROR- Try Again, or exit to quit\n");
//        lprintf0(outbuf, "enter cmd> ");
          break;
      } // end main switch
    } // end whille more tokens
} //functions for the CLI

void procRCV(void){
    char outbuf[150];
    int pid；
    pid = getpid();

    lprintf1(outbuf, "\nRCV is alive with pid %d\n", pid);
    if(receive() == SYSERR){
        lprintf0(outbuf, "\n in RCV receive failed\n");
    }

    lprintf0(outbuf, "\n  rvc has receive a msg, is now done, goodbye\n");
}

void procSLP(int sleep_time){
    int k;
    void *heap1;
    char outbuf[150];
    lprintf1(outbuf, "\nSLP is alive with pid %d\n", getpid());
    lprintf1(outbuf, "SLP will now sleep for %d seconds\n", sleep_time);

    if((int)(heap1 = getmen(100)) == SYSERR){
        lprintf0(outbuf, "\n in SLP getmem(100) call failed\n");
    }
    lprintf1(outbuf, "\n SLP got 1-- bytes of memory at %x\n", (int)heap1);
    if(sleep(sleep_time) == SYSERR){
        lprintf0(outbuf, "\n in SLP  sleep call failed\n");
    }
    lprintf1(outbuf, "\n SLP has awakened, will free 100 bytes to %x and quit, goodbye\n", (int)heap1);
    if(freeemem((struct mblock *)heap1, 100) == SYSERR){
        lprintf0(outbuf, "\n in SLP  freeemem call failed\n");
    }
}

void procWTR(int sem){
    char outbuf[150];
    lprintf1(outbuf, "\nWTR is alive with pid %d\n", getpid());
    lprintf1(outbuf, "\n WTR will now wait on sem %d\n", sem);
    if(wait(sem) == SYSERR){
        lprintf0(outbuf, "\n in WTR wait sem call failed\n";)
    }

    lprintf0(outbuf, "\n WTR has been signalled, is now done, goodbye\n");
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
        for(j=0; j<100000000; ++j);
    }
}