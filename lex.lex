%{
#define	SHOW 1
#define SUSPEND 2
#define RESUME 3
#define KILL 4
#define CREATE 5
#define PROC 6
#define RDY 7
#define SLP 8
#define WTR 9
#define RCV 10
#define LOOP 11
#define INTEG 25
#define JUNK 26
#define LABEL 27
#define STR 29
#define EXIT 30
%}
%%
[sS][hH][oO][wW]		return(SHOW);
[sS][uU][sS][pP][eE][nN][dD]	return(SUSPEND);
[rR][eE][sS][uU][mM][eE]	return(RESUME);
[kK][iI][lL][lL]		return(KILL);
[cC][rR][eE][aA][tT][eE]	return(CREATE);
[pP][rR][oO][cC]		return(PROC);
[rR][dD][yY]	return(RDY);
[sS][lL][pP]	return(SLP);
[wW][tT][rR]	return(WTR);
[rR][cC][vV]	return(RCV);
[lL][oO][oO][pP]	return(LOOP);
[eE][xX][iI][tT]	return(EXIT);
\".+\"		return(STR);
-?[0-9][0-9]*	return(INTEG);
[A-Za-z][0-9A-Za-z]*:	return(LABEL);
;.*\n	;

" "	|
"\t"	|
"\r"	|
"\n"	;

[^ \t\r\n]*		return(JUNK);

%%
int yywrap(){
return;
}
