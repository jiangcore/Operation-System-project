CC = gcc
CFLAGS = -g -c -I. -I/usr/lib/gcc/x86_64-redhat-linux/4.8.2/include
CXX_CFLAGS = -I.
LDFLAGS=
SOURCES = chprio.c clkinit.c clkint.c create.c ctxsw.c freemem.c getitem.c getmem.c \
getpid.c getprio.c getstk.c initialize.c insert.c insertd.c kill.c newqueue.c queue.c \
ready.c receive.c recvclr.c resched.c resume.c screate.c sdelete.c send.c signal.c \
sleep10.c sleep.c ssclock.c suspend.c userret.c wait.c wakeup.c lex.yy.c
OBJECTS = $(SOURCES:.c=.o)
EXECUTABLE = xinu.exe


all: $(SOURCES) $(EXECUTABLE)


$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.c.o:
	$(CC) $(CFLAGS) $< -o $@ $(CXX_CFLAGS)
clean:
	rm -f *.o $(EXECUTABLE)

depend:
	makedepend --$(CFLAGS) --$(SOURCES)
# DO NOT DELETE

clkinit.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
clkinit.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
clkinit.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
clkinit.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
clkinit.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
clkinit.o: /usr/include/time.h /usr/include/bits/siginfo.h
clkinit.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
clkinit.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
clkinit.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
clkinit.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
clkinit.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
clkinit.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
clkinit.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
clkinit.o: /usr/include/sys/time.h /usr/include/bits/time.h
clkinit.o: /usr/include/sys/select.h /usr/include/bits/select.h
clkinit.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
clkinit.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
clkinit.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
clkinit.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
clkinit.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
clkinit.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
clkinit.o: /usr/include/sys/ucontext.h ./sleep.h
clkint.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
clkint.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
clkint.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
clkint.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
clkint.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
clkint.o: /usr/include/time.h /usr/include/bits/siginfo.h
clkint.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
clkint.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
clkint.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
clkint.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
clkint.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
clkint.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
clkint.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
clkint.o: /usr/include/sys/time.h /usr/include/bits/time.h
clkint.o: /usr/include/sys/select.h /usr/include/bits/select.h
clkint.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
clkint.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
clkint.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
clkint.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
clkint.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
clkint.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
clkint.o: /usr/include/sys/ucontext.h ./proc.h ./mem.h ./sleep.h
create.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h ./conf.h
create.o: ./kernel.h ./signal.h /usr/include/features.h
create.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
create.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
create.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
create.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
create.o: /usr/include/time.h /usr/include/bits/siginfo.h
create.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
create.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
create.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
create.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
create.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
create.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
create.o: /usr/include/sys/time.h /usr/include/bits/time.h
create.o: /usr/include/sys/select.h /usr/include/bits/select.h
create.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
create.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
create.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
create.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
create.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
create.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
create.o: /usr/include/sys/ucontext.h ./proc.h ./mem.h ./io.h
ctxsw.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
ctxsw.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
ctxsw.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
ctxsw.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
ctxsw.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
ctxsw.o: /usr/include/time.h /usr/include/bits/siginfo.h
ctxsw.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
ctxsw.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
ctxsw.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
ctxsw.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
ctxsw.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
ctxsw.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
ctxsw.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ctxsw.o: /usr/include/sys/time.h /usr/include/bits/time.h
ctxsw.o: /usr/include/sys/select.h /usr/include/bits/select.h
ctxsw.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
ctxsw.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
ctxsw.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ctxsw.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
ctxsw.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
ctxsw.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
ctxsw.o: /usr/include/sys/ucontext.h ./proc.h ./mem.h ./io.h
freemem.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
freemem.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
freemem.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
freemem.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
freemem.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
freemem.o: /usr/include/time.h /usr/include/bits/siginfo.h
freemem.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
freemem.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
freemem.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
freemem.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
freemem.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
freemem.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
freemem.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
freemem.o: /usr/include/sys/time.h /usr/include/bits/time.h
freemem.o: /usr/include/sys/select.h /usr/include/bits/select.h
freemem.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
freemem.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
freemem.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
freemem.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
freemem.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
freemem.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
freemem.o: /usr/include/sys/ucontext.h ./mem.h
getitem.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
getitem.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
getitem.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
getitem.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
getitem.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
getitem.o: /usr/include/time.h /usr/include/bits/siginfo.h
getitem.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
getitem.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
getitem.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
getitem.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
getitem.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
getitem.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
getitem.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
getitem.o: /usr/include/sys/time.h /usr/include/bits/time.h
getitem.o: /usr/include/sys/select.h /usr/include/bits/select.h
getitem.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
getitem.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
getitem.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
getitem.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
getitem.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
getitem.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
getitem.o: /usr/include/sys/ucontext.h ./q.h
getmem.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
getmem.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
getmem.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
getmem.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
getmem.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
getmem.o: /usr/include/time.h /usr/include/bits/siginfo.h
getmem.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
getmem.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
getmem.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
getmem.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
getmem.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
getmem.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
getmem.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
getmem.o: /usr/include/sys/time.h /usr/include/bits/time.h
getmem.o: /usr/include/sys/select.h /usr/include/bits/select.h
getmem.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
getmem.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
getmem.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
getmem.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
getmem.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
getmem.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
getmem.o: /usr/include/sys/ucontext.h ./mem.h
getpid.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
getpid.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
getpid.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
getpid.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
getpid.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
getpid.o: /usr/include/time.h /usr/include/bits/siginfo.h
getpid.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
getpid.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
getpid.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
getpid.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
getpid.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
getpid.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
getpid.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
getpid.o: /usr/include/sys/time.h /usr/include/bits/time.h
getpid.o: /usr/include/sys/select.h /usr/include/bits/select.h
getpid.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
getpid.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
getpid.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
getpid.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
getpid.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
getpid.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
getpid.o: /usr/include/sys/ucontext.h ./proc.h
getprio.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
getprio.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
getprio.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
getprio.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
getprio.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
getprio.o: /usr/include/time.h /usr/include/bits/siginfo.h
getprio.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
getprio.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
getprio.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
getprio.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
getprio.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
getprio.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
getprio.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
getprio.o: /usr/include/sys/time.h /usr/include/bits/time.h
getprio.o: /usr/include/sys/select.h /usr/include/bits/select.h
getprio.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
getprio.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
getprio.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
getprio.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
getprio.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
getprio.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
getprio.o: /usr/include/sys/ucontext.h ./proc.h
getstk.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
getstk.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
getstk.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
getstk.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
getstk.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
getstk.o: /usr/include/time.h /usr/include/bits/siginfo.h
getstk.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
getstk.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
getstk.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
getstk.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
getstk.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
getstk.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
getstk.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
getstk.o: /usr/include/sys/time.h /usr/include/bits/time.h
getstk.o: /usr/include/sys/select.h /usr/include/bits/select.h
getstk.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
getstk.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
getstk.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
getstk.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
getstk.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
getstk.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
getstk.o: /usr/include/sys/ucontext.h ./mem.h
initialize.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
initialize.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
initialize.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
initialize.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
initialize.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
initialize.o: /usr/include/time.h /usr/include/bits/siginfo.h
initialize.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
initialize.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
initialize.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
initialize.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
initialize.o: /usr/include/libio.h /usr/include/_G_config.h
initialize.o: /usr/include/wchar.h
initialize.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
initialize.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
initialize.o: /usr/include/sys/time.h /usr/include/bits/time.h
initialize.o: /usr/include/sys/select.h /usr/include/bits/select.h
initialize.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
initialize.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
initialize.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
initialize.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
initialize.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
initialize.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
initialize.o: /usr/include/sys/ucontext.h ./proc.h ./sem.h ./sleep.h ./mem.h
initialize.o: ./q.h ./io.h
insert.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
insert.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
insert.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
insert.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
insert.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
insert.o: /usr/include/time.h /usr/include/bits/siginfo.h
insert.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
insert.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
insert.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
insert.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
insert.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
insert.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
insert.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
insert.o: /usr/include/sys/time.h /usr/include/bits/time.h
insert.o: /usr/include/sys/select.h /usr/include/bits/select.h
insert.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
insert.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
insert.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
insert.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
insert.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
insert.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
insert.o: /usr/include/sys/ucontext.h ./q.h
insertd.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
insertd.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
insertd.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
insertd.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
insertd.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
insertd.o: /usr/include/time.h /usr/include/bits/siginfo.h
insertd.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
insertd.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
insertd.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
insertd.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
insertd.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
insertd.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
insertd.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
insertd.o: /usr/include/sys/time.h /usr/include/bits/time.h
insertd.o: /usr/include/sys/select.h /usr/include/bits/select.h
insertd.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
insertd.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
insertd.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
insertd.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
insertd.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
insertd.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
insertd.o: /usr/include/sys/ucontext.h ./q.h
kill.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
kill.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
kill.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
kill.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
kill.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
kill.o: /usr/include/time.h /usr/include/bits/siginfo.h
kill.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
kill.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
kill.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
kill.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
kill.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
kill.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
kill.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
kill.o: /usr/include/sys/time.h /usr/include/bits/time.h
kill.o: /usr/include/sys/select.h /usr/include/bits/select.h
kill.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
kill.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
kill.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
kill.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
kill.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
kill.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
kill.o: /usr/include/sys/ucontext.h ./proc.h ./sem.h ./mem.h ./io.h
newqueue.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
newqueue.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
newqueue.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
newqueue.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
newqueue.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
newqueue.o: /usr/include/time.h /usr/include/bits/siginfo.h
newqueue.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
newqueue.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
newqueue.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
newqueue.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
newqueue.o: /usr/include/libio.h /usr/include/_G_config.h
newqueue.o: /usr/include/wchar.h
newqueue.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
newqueue.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
newqueue.o: /usr/include/sys/time.h /usr/include/bits/time.h
newqueue.o: /usr/include/sys/select.h /usr/include/bits/select.h
newqueue.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
newqueue.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
newqueue.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
newqueue.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
newqueue.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
newqueue.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
newqueue.o: /usr/include/sys/ucontext.h ./q.h
queue.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
queue.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
queue.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
queue.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
queue.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
queue.o: /usr/include/time.h /usr/include/bits/siginfo.h
queue.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
queue.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
queue.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
queue.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
queue.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
queue.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
queue.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
queue.o: /usr/include/sys/time.h /usr/include/bits/time.h
queue.o: /usr/include/sys/select.h /usr/include/bits/select.h
queue.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
queue.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
queue.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
queue.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
queue.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
queue.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
queue.o: /usr/include/sys/ucontext.h ./q.h
ready.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
ready.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
ready.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
ready.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
ready.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
ready.o: /usr/include/time.h /usr/include/bits/siginfo.h
ready.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
ready.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
ready.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
ready.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
ready.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
ready.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
ready.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ready.o: /usr/include/sys/time.h /usr/include/bits/time.h
ready.o: /usr/include/sys/select.h /usr/include/bits/select.h
ready.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
ready.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
ready.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ready.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
ready.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
ready.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
ready.o: /usr/include/sys/ucontext.h ./proc.h ./q.h
receive.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
receive.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
receive.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
receive.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
receive.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
receive.o: /usr/include/time.h /usr/include/bits/siginfo.h
receive.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
receive.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
receive.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
receive.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
receive.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
receive.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
receive.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
receive.o: /usr/include/sys/time.h /usr/include/bits/time.h
receive.o: /usr/include/sys/select.h /usr/include/bits/select.h
receive.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
receive.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
receive.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
receive.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
receive.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
receive.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
receive.o: /usr/include/sys/ucontext.h ./proc.h
recvclr.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
recvclr.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
recvclr.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
recvclr.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
recvclr.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
recvclr.o: /usr/include/time.h /usr/include/bits/siginfo.h
recvclr.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
recvclr.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
recvclr.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
recvclr.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
recvclr.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
recvclr.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
recvclr.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
recvclr.o: /usr/include/sys/time.h /usr/include/bits/time.h
recvclr.o: /usr/include/sys/select.h /usr/include/bits/select.h
recvclr.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
recvclr.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
recvclr.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
recvclr.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
recvclr.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
recvclr.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
recvclr.o: /usr/include/sys/ucontext.h ./proc.h
resched.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
resched.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
resched.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
resched.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
resched.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
resched.o: /usr/include/time.h /usr/include/bits/siginfo.h
resched.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
resched.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
resched.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
resched.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
resched.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
resched.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
resched.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
resched.o: /usr/include/sys/time.h /usr/include/bits/time.h
resched.o: /usr/include/sys/select.h /usr/include/bits/select.h
resched.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
resched.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
resched.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
resched.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
resched.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
resched.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
resched.o: /usr/include/sys/ucontext.h ./proc.h ./q.h
resume.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
resume.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
resume.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
resume.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
resume.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
resume.o: /usr/include/time.h /usr/include/bits/siginfo.h
resume.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
resume.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
resume.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
resume.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
resume.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
resume.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
resume.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
resume.o: /usr/include/sys/time.h /usr/include/bits/time.h
resume.o: /usr/include/sys/select.h /usr/include/bits/select.h
resume.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
resume.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
resume.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
resume.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
resume.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
resume.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
resume.o: /usr/include/sys/ucontext.h ./proc.h
screate.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
screate.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
screate.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
screate.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
screate.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
screate.o: /usr/include/time.h /usr/include/bits/siginfo.h
screate.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
screate.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
screate.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
screate.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
screate.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
screate.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
screate.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
screate.o: /usr/include/sys/time.h /usr/include/bits/time.h
screate.o: /usr/include/sys/select.h /usr/include/bits/select.h
screate.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
screate.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
screate.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
screate.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
screate.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
screate.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
screate.o: /usr/include/sys/ucontext.h ./proc.h ./q.h ./sem.h
sdelete.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
sdelete.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
sdelete.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
sdelete.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
sdelete.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
sdelete.o: /usr/include/time.h /usr/include/bits/siginfo.h
sdelete.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
sdelete.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
sdelete.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
sdelete.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
sdelete.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
sdelete.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
sdelete.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
sdelete.o: /usr/include/sys/time.h /usr/include/bits/time.h
sdelete.o: /usr/include/sys/select.h /usr/include/bits/select.h
sdelete.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
sdelete.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
sdelete.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
sdelete.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
sdelete.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
sdelete.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
sdelete.o: /usr/include/sys/ucontext.h ./proc.h ./q.h ./sem.h
send.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
send.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
send.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
send.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
send.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
send.o: /usr/include/time.h /usr/include/bits/siginfo.h
send.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
send.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
send.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
send.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
send.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
send.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
send.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
send.o: /usr/include/sys/time.h /usr/include/bits/time.h
send.o: /usr/include/sys/select.h /usr/include/bits/select.h
send.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
send.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
send.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
send.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
send.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
send.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
send.o: /usr/include/sys/ucontext.h ./proc.h
signal.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
signal.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
signal.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
signal.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
signal.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
signal.o: /usr/include/time.h /usr/include/bits/siginfo.h
signal.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
signal.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
signal.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
signal.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
signal.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
signal.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
signal.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
signal.o: /usr/include/sys/time.h /usr/include/bits/time.h
signal.o: /usr/include/sys/select.h /usr/include/bits/select.h
signal.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
signal.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
signal.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
signal.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
signal.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
signal.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
signal.o: /usr/include/sys/ucontext.h ./proc.h ./q.h ./sem.h
sleep10.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
sleep10.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
sleep10.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
sleep10.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
sleep10.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
sleep10.o: /usr/include/time.h /usr/include/bits/siginfo.h
sleep10.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
sleep10.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
sleep10.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
sleep10.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
sleep10.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
sleep10.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
sleep10.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
sleep10.o: /usr/include/sys/time.h /usr/include/bits/time.h
sleep10.o: /usr/include/sys/select.h /usr/include/bits/select.h
sleep10.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
sleep10.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
sleep10.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
sleep10.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
sleep10.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
sleep10.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
sleep10.o: /usr/include/sys/ucontext.h ./proc.h ./q.h ./sleep.h
sleep.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
sleep.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
sleep.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
sleep.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
sleep.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
sleep.o: /usr/include/time.h /usr/include/bits/siginfo.h
sleep.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
sleep.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
sleep.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
sleep.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
sleep.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
sleep.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
sleep.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
sleep.o: /usr/include/sys/time.h /usr/include/bits/time.h
sleep.o: /usr/include/sys/select.h /usr/include/bits/select.h
sleep.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
sleep.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
sleep.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
sleep.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
sleep.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
sleep.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
sleep.o: /usr/include/sys/ucontext.h ./proc.h ./q.h ./sleep.h
ssclock.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
ssclock.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
ssclock.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
ssclock.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
ssclock.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
ssclock.o: /usr/include/time.h /usr/include/bits/siginfo.h
ssclock.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
ssclock.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
ssclock.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
ssclock.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
ssclock.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
ssclock.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
ssclock.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ssclock.o: /usr/include/sys/time.h /usr/include/bits/time.h
ssclock.o: /usr/include/sys/select.h /usr/include/bits/select.h
ssclock.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
ssclock.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
ssclock.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ssclock.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
ssclock.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
ssclock.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
ssclock.o: /usr/include/sys/ucontext.h ./proc.h ./q.h ./sleep.h
suspend.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
suspend.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
suspend.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
suspend.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
suspend.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
suspend.o: /usr/include/time.h /usr/include/bits/siginfo.h
suspend.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
suspend.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
suspend.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
suspend.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
suspend.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
suspend.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
suspend.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
suspend.o: /usr/include/sys/time.h /usr/include/bits/time.h
suspend.o: /usr/include/sys/select.h /usr/include/bits/select.h
suspend.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
suspend.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
suspend.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
suspend.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
suspend.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
suspend.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
suspend.o: /usr/include/sys/ucontext.h ./proc.h
userret.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
userret.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
userret.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
userret.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
userret.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
userret.o: /usr/include/time.h /usr/include/bits/siginfo.h
userret.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
userret.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
userret.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
userret.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
userret.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
userret.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
userret.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
userret.o: /usr/include/sys/time.h /usr/include/bits/time.h
userret.o: /usr/include/sys/select.h /usr/include/bits/select.h
userret.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
userret.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
userret.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
userret.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
userret.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
userret.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
userret.o: /usr/include/sys/ucontext.h
wait.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
wait.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
wait.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
wait.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
wait.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
wait.o: /usr/include/time.h /usr/include/bits/siginfo.h
wait.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
wait.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
wait.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
wait.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
wait.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
wait.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
wait.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
wait.o: /usr/include/sys/time.h /usr/include/bits/time.h
wait.o: /usr/include/sys/select.h /usr/include/bits/select.h
wait.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
wait.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
wait.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
wait.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
wait.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
wait.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
wait.o: /usr/include/sys/ucontext.h ./proc.h ./q.h ./sem.h
wakeup.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
wakeup.o: /usr/include/stdc-predef.h /usr/include/sys/cdefs.h
wakeup.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
wakeup.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
wakeup.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
wakeup.o: /usr/include/time.h /usr/include/bits/siginfo.h
wakeup.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
wakeup.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
wakeup.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
wakeup.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
wakeup.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
wakeup.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
wakeup.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
wakeup.o: /usr/include/sys/time.h /usr/include/bits/time.h
wakeup.o: /usr/include/sys/select.h /usr/include/bits/select.h
wakeup.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
wakeup.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
wakeup.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
wakeup.o: /usr/include/bits/byteswap-16.h /usr/include/sys/types.h
wakeup.o: /usr/include/sys/sysmacros.h /usr/include/alloca.h
wakeup.o: /usr/include/bits/stdlib-float.h /usr/include/ucontext.h
wakeup.o: /usr/include/sys/ucontext.h ./proc.h ./q.h ./sleep.h
ttyiin.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
ttyiin.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
ttyiin.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
ttyiin.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
ttyiin.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
ttyiin.o: /usr/include/time.h /usr/include/bits/siginfo.h
ttyiin.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
ttyiin.o: /usr/include/asm/sigcontext.h /usr/include/linux/types.h
ttyiin.o: /usr/include/asm/types.h /usr/include/asm-generic/types.h
ttyiin.o: /usr/include/asm-generic/int-ll64.h /usr/include/asm/bitsperlong.h
ttyiin.o: /usr/include/asm-generic/bitsperlong.h
ttyiin.o: /usr/include/linux/posix_types.h /usr/include/linux/stddef.h
ttyiin.o: /usr/include/asm/posix_types.h /usr/include/asm/posix_types_32.h
ttyiin.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
ttyiin.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
ttyiin.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
ttyiin.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
ttyiin.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
ttyiin.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ttyiin.o: /usr/include/sys/time.h /usr/include/bits/time.h
ttyiin.o: /usr/include/sys/select.h /usr/include/bits/select.h
ttyiin.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
ttyiin.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
ttyiin.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ttyiin.o: /usr/include/sys/types.h /usr/include/sys/sysmacros.h
ttyiin.o: /usr/include/alloca.h /usr/include/ucontext.h
ttyiin.o: /usr/include/sys/ucontext.h ./tty.h ./io.h ./slu.h
ttyoin.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
ttyoin.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
ttyoin.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
ttyoin.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
ttyoin.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
ttyoin.o: /usr/include/time.h /usr/include/bits/siginfo.h
ttyoin.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
ttyoin.o: /usr/include/asm/sigcontext.h /usr/include/linux/types.h
ttyoin.o: /usr/include/asm/types.h /usr/include/asm-generic/types.h
ttyoin.o: /usr/include/asm-generic/int-ll64.h /usr/include/asm/bitsperlong.h
ttyoin.o: /usr/include/asm-generic/bitsperlong.h
ttyoin.o: /usr/include/linux/posix_types.h /usr/include/linux/stddef.h
ttyoin.o: /usr/include/asm/posix_types.h /usr/include/asm/posix_types_32.h
ttyoin.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
ttyoin.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
ttyoin.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
ttyoin.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
ttyoin.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
ttyoin.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ttyoin.o: /usr/include/sys/time.h /usr/include/bits/time.h
ttyoin.o: /usr/include/sys/select.h /usr/include/bits/select.h
ttyoin.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
ttyoin.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
ttyoin.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ttyoin.o: /usr/include/sys/types.h /usr/include/sys/sysmacros.h
ttyoin.o: /usr/include/alloca.h /usr/include/ucontext.h
ttyoin.o: /usr/include/sys/ucontext.h ./tty.h ./io.h ./slu.h
ttyinit.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
ttyinit.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
ttyinit.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
ttyinit.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
ttyinit.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
ttyinit.o: /usr/include/time.h /usr/include/bits/siginfo.h
ttyinit.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
ttyinit.o: /usr/include/asm/sigcontext.h /usr/include/linux/types.h
ttyinit.o: /usr/include/asm/types.h /usr/include/asm-generic/types.h
ttyinit.o: /usr/include/asm-generic/int-ll64.h /usr/include/asm/bitsperlong.h
ttyinit.o: /usr/include/asm-generic/bitsperlong.h
ttyinit.o: /usr/include/linux/posix_types.h /usr/include/linux/stddef.h
ttyinit.o: /usr/include/asm/posix_types.h /usr/include/asm/posix_types_32.h
ttyinit.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
ttyinit.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
ttyinit.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
ttyinit.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
ttyinit.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
ttyinit.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ttyinit.o: /usr/include/sys/time.h /usr/include/bits/time.h
ttyinit.o: /usr/include/sys/select.h /usr/include/bits/select.h
ttyinit.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
ttyinit.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
ttyinit.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ttyinit.o: /usr/include/sys/types.h /usr/include/sys/sysmacros.h
ttyinit.o: /usr/include/alloca.h /usr/include/ucontext.h
ttyinit.o: /usr/include/sys/ucontext.h ./proc.h ./tty.h ./io.h ./slu.h
ttyopen.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
ttyopen.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
ttyopen.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
ttyopen.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
ttyopen.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
ttyopen.o: /usr/include/time.h /usr/include/bits/siginfo.h
ttyopen.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
ttyopen.o: /usr/include/asm/sigcontext.h /usr/include/linux/types.h
ttyopen.o: /usr/include/asm/types.h /usr/include/asm-generic/types.h
ttyopen.o: /usr/include/asm-generic/int-ll64.h /usr/include/asm/bitsperlong.h
ttyopen.o: /usr/include/asm-generic/bitsperlong.h
ttyopen.o: /usr/include/linux/posix_types.h /usr/include/linux/stddef.h
ttyopen.o: /usr/include/asm/posix_types.h /usr/include/asm/posix_types_32.h
ttyopen.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
ttyopen.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
ttyopen.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
ttyopen.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
ttyopen.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
ttyopen.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ttyopen.o: /usr/include/sys/time.h /usr/include/bits/time.h
ttyopen.o: /usr/include/sys/select.h /usr/include/bits/select.h
ttyopen.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
ttyopen.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
ttyopen.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ttyopen.o: /usr/include/sys/types.h /usr/include/sys/sysmacros.h
ttyopen.o: /usr/include/alloca.h /usr/include/ucontext.h
ttyopen.o: /usr/include/sys/ucontext.h
ttyputc.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
ttyputc.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
ttyputc.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
ttyputc.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
ttyputc.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
ttyputc.o: /usr/include/time.h /usr/include/bits/siginfo.h
ttyputc.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
ttyputc.o: /usr/include/asm/sigcontext.h /usr/include/linux/types.h
ttyputc.o: /usr/include/asm/types.h /usr/include/asm-generic/types.h
ttyputc.o: /usr/include/asm-generic/int-ll64.h /usr/include/asm/bitsperlong.h
ttyputc.o: /usr/include/asm-generic/bitsperlong.h
ttyputc.o: /usr/include/linux/posix_types.h /usr/include/linux/stddef.h
ttyputc.o: /usr/include/asm/posix_types.h /usr/include/asm/posix_types_32.h
ttyputc.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
ttyputc.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
ttyputc.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
ttyputc.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
ttyputc.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
ttyputc.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ttyputc.o: /usr/include/sys/time.h /usr/include/bits/time.h
ttyputc.o: /usr/include/sys/select.h /usr/include/bits/select.h
ttyputc.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
ttyputc.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
ttyputc.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ttyputc.o: /usr/include/sys/types.h /usr/include/sys/sysmacros.h
ttyputc.o: /usr/include/alloca.h /usr/include/ucontext.h
ttyputc.o: /usr/include/sys/ucontext.h ./tty.h ./io.h ./slu.h
ttyread.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
ttyread.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
ttyread.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
ttyread.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
ttyread.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
ttyread.o: /usr/include/time.h /usr/include/bits/siginfo.h
ttyread.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
ttyread.o: /usr/include/asm/sigcontext.h /usr/include/linux/types.h
ttyread.o: /usr/include/asm/types.h /usr/include/asm-generic/types.h
ttyread.o: /usr/include/asm-generic/int-ll64.h /usr/include/asm/bitsperlong.h
ttyread.o: /usr/include/asm-generic/bitsperlong.h
ttyread.o: /usr/include/linux/posix_types.h /usr/include/linux/stddef.h
ttyread.o: /usr/include/asm/posix_types.h /usr/include/asm/posix_types_32.h
ttyread.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
ttyread.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
ttyread.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
ttyread.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
ttyread.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
ttyread.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ttyread.o: /usr/include/sys/time.h /usr/include/bits/time.h
ttyread.o: /usr/include/sys/select.h /usr/include/bits/select.h
ttyread.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
ttyread.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
ttyread.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ttyread.o: /usr/include/sys/types.h /usr/include/sys/sysmacros.h
ttyread.o: /usr/include/alloca.h /usr/include/ucontext.h
ttyread.o: /usr/include/sys/ucontext.h ./tty.h ./io.h
ttywrite.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
ttywrite.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
ttywrite.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
ttywrite.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
ttywrite.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
ttywrite.o: /usr/include/time.h /usr/include/bits/siginfo.h
ttywrite.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
ttywrite.o: /usr/include/asm/sigcontext.h /usr/include/linux/types.h
ttywrite.o: /usr/include/asm/types.h /usr/include/asm-generic/types.h
ttywrite.o: /usr/include/asm-generic/int-ll64.h
ttywrite.o: /usr/include/asm/bitsperlong.h
ttywrite.o: /usr/include/asm-generic/bitsperlong.h
ttywrite.o: /usr/include/linux/posix_types.h /usr/include/linux/stddef.h
ttywrite.o: /usr/include/asm/posix_types.h /usr/include/asm/posix_types_32.h
ttywrite.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
ttywrite.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
ttywrite.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
ttywrite.o: /usr/include/libio.h /usr/include/_G_config.h
ttywrite.o: /usr/include/wchar.h
ttywrite.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
ttywrite.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ttywrite.o: /usr/include/sys/time.h /usr/include/bits/time.h
ttywrite.o: /usr/include/sys/select.h /usr/include/bits/select.h
ttywrite.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
ttywrite.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
ttywrite.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ttywrite.o: /usr/include/sys/types.h /usr/include/sys/sysmacros.h
ttywrite.o: /usr/include/alloca.h /usr/include/ucontext.h
ttywrite.o: /usr/include/sys/ucontext.h ./tty.h ./io.h ./slu.h
ttycntl.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
ttycntl.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
ttycntl.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
ttycntl.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
ttycntl.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
ttycntl.o: /usr/include/time.h /usr/include/bits/siginfo.h
ttycntl.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
ttycntl.o: /usr/include/asm/sigcontext.h /usr/include/linux/types.h
ttycntl.o: /usr/include/asm/types.h /usr/include/asm-generic/types.h
ttycntl.o: /usr/include/asm-generic/int-ll64.h /usr/include/asm/bitsperlong.h
ttycntl.o: /usr/include/asm-generic/bitsperlong.h
ttycntl.o: /usr/include/linux/posix_types.h /usr/include/linux/stddef.h
ttycntl.o: /usr/include/asm/posix_types.h /usr/include/asm/posix_types_32.h
ttycntl.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
ttycntl.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
ttycntl.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
ttycntl.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
ttycntl.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
ttycntl.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ttycntl.o: /usr/include/sys/time.h /usr/include/bits/time.h
ttycntl.o: /usr/include/sys/select.h /usr/include/bits/select.h
ttycntl.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
ttycntl.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
ttycntl.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ttycntl.o: /usr/include/sys/types.h /usr/include/sys/sysmacros.h
ttycntl.o: /usr/include/alloca.h /usr/include/ucontext.h
ttycntl.o: /usr/include/sys/ucontext.h ./tty.h ./io.h ./slu.h
ttygetc.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
ttygetc.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
ttygetc.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
ttygetc.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
ttygetc.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
ttygetc.o: /usr/include/time.h /usr/include/bits/siginfo.h
ttygetc.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
ttygetc.o: /usr/include/asm/sigcontext.h /usr/include/linux/types.h
ttygetc.o: /usr/include/asm/types.h /usr/include/asm-generic/types.h
ttygetc.o: /usr/include/asm-generic/int-ll64.h /usr/include/asm/bitsperlong.h
ttygetc.o: /usr/include/asm-generic/bitsperlong.h
ttygetc.o: /usr/include/linux/posix_types.h /usr/include/linux/stddef.h
ttygetc.o: /usr/include/asm/posix_types.h /usr/include/asm/posix_types_32.h
ttygetc.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
ttygetc.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
ttygetc.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
ttygetc.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
ttygetc.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
ttygetc.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ttygetc.o: /usr/include/sys/time.h /usr/include/bits/time.h
ttygetc.o: /usr/include/sys/select.h /usr/include/bits/select.h
ttygetc.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
ttygetc.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
ttygetc.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ttygetc.o: /usr/include/sys/types.h /usr/include/sys/sysmacros.h
ttygetc.o: /usr/include/alloca.h /usr/include/ucontext.h
ttygetc.o: /usr/include/sys/ucontext.h ./tty.h ./io.h
ioinit.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
ioinit.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
ioinit.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
ioinit.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
ioinit.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
ioinit.o: /usr/include/time.h /usr/include/bits/siginfo.h
ioinit.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
ioinit.o: /usr/include/asm/sigcontext.h /usr/include/linux/types.h
ioinit.o: /usr/include/asm/types.h /usr/include/asm-generic/types.h
ioinit.o: /usr/include/asm-generic/int-ll64.h /usr/include/asm/bitsperlong.h
ioinit.o: /usr/include/asm-generic/bitsperlong.h
ioinit.o: /usr/include/linux/posix_types.h /usr/include/linux/stddef.h
ioinit.o: /usr/include/asm/posix_types.h /usr/include/asm/posix_types_32.h
ioinit.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
ioinit.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
ioinit.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
ioinit.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
ioinit.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
ioinit.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ioinit.o: /usr/include/sys/time.h /usr/include/bits/time.h
ioinit.o: /usr/include/sys/select.h /usr/include/bits/select.h
ioinit.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
ioinit.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
ioinit.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ioinit.o: /usr/include/sys/types.h /usr/include/sys/sysmacros.h
ioinit.o: /usr/include/alloca.h /usr/include/ucontext.h
ioinit.o: /usr/include/sys/ucontext.h ./io.h
ioint.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
ioint.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
ioint.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
ioint.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
ioint.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
ioint.o: /usr/include/time.h /usr/include/bits/siginfo.h
ioint.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
ioint.o: /usr/include/asm/sigcontext.h /usr/include/linux/types.h
ioint.o: /usr/include/asm/types.h /usr/include/asm-generic/types.h
ioint.o: /usr/include/asm-generic/int-ll64.h /usr/include/asm/bitsperlong.h
ioint.o: /usr/include/asm-generic/bitsperlong.h
ioint.o: /usr/include/linux/posix_types.h /usr/include/linux/stddef.h
ioint.o: /usr/include/asm/posix_types.h /usr/include/asm/posix_types_32.h
ioint.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
ioint.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
ioint.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
ioint.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
ioint.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
ioint.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ioint.o: /usr/include/sys/time.h /usr/include/bits/time.h
ioint.o: /usr/include/sys/select.h /usr/include/bits/select.h
ioint.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
ioint.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
ioint.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ioint.o: /usr/include/sys/types.h /usr/include/sys/sysmacros.h
ioint.o: /usr/include/alloca.h /usr/include/ucontext.h
ioint.o: /usr/include/sys/ucontext.h ./io.h
conf.o: ./conf.h ./signal.h /usr/include/features.h /usr/include/sys/cdefs.h
conf.o: /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h
conf.o: /usr/include/gnu/stubs-32.h /usr/include/bits/sigset.h
conf.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
conf.o: /usr/include/bits/signum.h /usr/include/time.h
conf.o: /usr/include/bits/siginfo.h /usr/include/bits/sigaction.h
conf.o: /usr/include/bits/sigcontext.h /usr/include/asm/sigcontext.h
conf.o: /usr/include/linux/types.h /usr/include/asm/types.h
conf.o: /usr/include/asm-generic/types.h /usr/include/asm-generic/int-ll64.h
conf.o: /usr/include/asm/bitsperlong.h /usr/include/asm-generic/bitsperlong.h
conf.o: /usr/include/linux/posix_types.h /usr/include/linux/stddef.h
conf.o: /usr/include/asm/posix_types.h /usr/include/asm/posix_types_32.h
conf.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
conf.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
conf.o: /usr/include/bits/sigthread.h
close.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
close.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
close.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
close.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
close.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
close.o: /usr/include/time.h /usr/include/bits/siginfo.h
close.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
close.o: /usr/include/asm/sigcontext.h /usr/include/linux/types.h
close.o: /usr/include/asm/types.h /usr/include/asm-generic/types.h
close.o: /usr/include/asm-generic/int-ll64.h /usr/include/asm/bitsperlong.h
close.o: /usr/include/asm-generic/bitsperlong.h
close.o: /usr/include/linux/posix_types.h /usr/include/linux/stddef.h
close.o: /usr/include/asm/posix_types.h /usr/include/asm/posix_types_32.h
close.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
close.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
close.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
close.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
close.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
close.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
close.o: /usr/include/sys/time.h /usr/include/bits/time.h
close.o: /usr/include/sys/select.h /usr/include/bits/select.h
close.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
close.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
close.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
close.o: /usr/include/sys/types.h /usr/include/sys/sysmacros.h
close.o: /usr/include/alloca.h /usr/include/ucontext.h
close.o: /usr/include/sys/ucontext.h ./io.h
ioerr.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
ioerr.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
ioerr.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
ioerr.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
ioerr.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
ioerr.o: /usr/include/time.h /usr/include/bits/siginfo.h
ioerr.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
ioerr.o: /usr/include/asm/sigcontext.h /usr/include/linux/types.h
ioerr.o: /usr/include/asm/types.h /usr/include/asm-generic/types.h
ioerr.o: /usr/include/asm-generic/int-ll64.h /usr/include/asm/bitsperlong.h
ioerr.o: /usr/include/asm-generic/bitsperlong.h
ioerr.o: /usr/include/linux/posix_types.h /usr/include/linux/stddef.h
ioerr.o: /usr/include/asm/posix_types.h /usr/include/asm/posix_types_32.h
ioerr.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
ioerr.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
ioerr.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
ioerr.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
ioerr.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
ioerr.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ioerr.o: /usr/include/sys/time.h /usr/include/bits/time.h
ioerr.o: /usr/include/sys/select.h /usr/include/bits/select.h
ioerr.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
ioerr.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
ioerr.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ioerr.o: /usr/include/sys/types.h /usr/include/sys/sysmacros.h
ioerr.o: /usr/include/alloca.h /usr/include/ucontext.h
ioerr.o: /usr/include/sys/ucontext.h
ionull.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
ionull.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
ionull.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
ionull.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
ionull.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
ionull.o: /usr/include/time.h /usr/include/bits/siginfo.h
ionull.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
ionull.o: /usr/include/asm/sigcontext.h /usr/include/linux/types.h
ionull.o: /usr/include/asm/types.h /usr/include/asm-generic/types.h
ionull.o: /usr/include/asm-generic/int-ll64.h /usr/include/asm/bitsperlong.h
ionull.o: /usr/include/asm-generic/bitsperlong.h
ionull.o: /usr/include/linux/posix_types.h /usr/include/linux/stddef.h
ionull.o: /usr/include/asm/posix_types.h /usr/include/asm/posix_types_32.h
ionull.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
ionull.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
ionull.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
ionull.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
ionull.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
ionull.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
ionull.o: /usr/include/sys/time.h /usr/include/bits/time.h
ionull.o: /usr/include/sys/select.h /usr/include/bits/select.h
ionull.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
ionull.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
ionull.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
ionull.o: /usr/include/sys/types.h /usr/include/sys/sysmacros.h
ionull.o: /usr/include/alloca.h /usr/include/ucontext.h
ionull.o: /usr/include/sys/ucontext.h
open.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
open.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
open.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
open.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
open.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
open.o: /usr/include/time.h /usr/include/bits/siginfo.h
open.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
open.o: /usr/include/asm/sigcontext.h /usr/include/linux/types.h
open.o: /usr/include/asm/types.h /usr/include/asm-generic/types.h
open.o: /usr/include/asm-generic/int-ll64.h /usr/include/asm/bitsperlong.h
open.o: /usr/include/asm-generic/bitsperlong.h
open.o: /usr/include/linux/posix_types.h /usr/include/linux/stddef.h
open.o: /usr/include/asm/posix_types.h /usr/include/asm/posix_types_32.h
open.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
open.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
open.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
open.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
open.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
open.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
open.o: /usr/include/sys/time.h /usr/include/bits/time.h
open.o: /usr/include/sys/select.h /usr/include/bits/select.h
open.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
open.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
open.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
open.o: /usr/include/sys/types.h /usr/include/sys/sysmacros.h
open.o: /usr/include/alloca.h /usr/include/ucontext.h
open.o: /usr/include/sys/ucontext.h ./io.h
signaln.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
signaln.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
signaln.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
signaln.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
signaln.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
signaln.o: /usr/include/time.h /usr/include/bits/siginfo.h
signaln.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
signaln.o: /usr/include/asm/sigcontext.h /usr/include/linux/types.h
signaln.o: /usr/include/asm/types.h /usr/include/asm-generic/types.h
signaln.o: /usr/include/asm-generic/int-ll64.h /usr/include/asm/bitsperlong.h
signaln.o: /usr/include/asm-generic/bitsperlong.h
signaln.o: /usr/include/linux/posix_types.h /usr/include/linux/stddef.h
signaln.o: /usr/include/asm/posix_types.h /usr/include/asm/posix_types_32.h
signaln.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
signaln.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
signaln.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
signaln.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
signaln.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
signaln.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
signaln.o: /usr/include/sys/time.h /usr/include/bits/time.h
signaln.o: /usr/include/sys/select.h /usr/include/bits/select.h
signaln.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
signaln.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
signaln.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
signaln.o: /usr/include/sys/types.h /usr/include/sys/sysmacros.h
signaln.o: /usr/include/alloca.h /usr/include/ucontext.h
signaln.o: /usr/include/sys/ucontext.h ./proc.h ./q.h ./sem.h
scount.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
scount.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
scount.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
scount.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
scount.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
scount.o: /usr/include/time.h /usr/include/bits/siginfo.h
scount.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
scount.o: /usr/include/asm/sigcontext.h /usr/include/linux/types.h
scount.o: /usr/include/asm/types.h /usr/include/asm-generic/types.h
scount.o: /usr/include/asm-generic/int-ll64.h /usr/include/asm/bitsperlong.h
scount.o: /usr/include/asm-generic/bitsperlong.h
scount.o: /usr/include/linux/posix_types.h /usr/include/linux/stddef.h
scount.o: /usr/include/asm/posix_types.h /usr/include/asm/posix_types_32.h
scount.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
scount.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
scount.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
scount.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
scount.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
scount.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
scount.o: /usr/include/sys/time.h /usr/include/bits/time.h
scount.o: /usr/include/sys/select.h /usr/include/bits/select.h
scount.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
scount.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
scount.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
scount.o: /usr/include/sys/types.h /usr/include/sys/sysmacros.h
scount.o: /usr/include/alloca.h /usr/include/ucontext.h
scount.o: /usr/include/sys/ucontext.h ./sem.h
sreset.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
sreset.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
sreset.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
sreset.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
sreset.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
sreset.o: /usr/include/time.h /usr/include/bits/siginfo.h
sreset.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
sreset.o: /usr/include/asm/sigcontext.h /usr/include/linux/types.h
sreset.o: /usr/include/asm/types.h /usr/include/asm-generic/types.h
sreset.o: /usr/include/asm-generic/int-ll64.h /usr/include/asm/bitsperlong.h
sreset.o: /usr/include/asm-generic/bitsperlong.h
sreset.o: /usr/include/linux/posix_types.h /usr/include/linux/stddef.h
sreset.o: /usr/include/asm/posix_types.h /usr/include/asm/posix_types_32.h
sreset.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
sreset.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
sreset.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
sreset.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
sreset.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
sreset.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
sreset.o: /usr/include/sys/time.h /usr/include/bits/time.h
sreset.o: /usr/include/sys/select.h /usr/include/bits/select.h
sreset.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
sreset.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
sreset.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
sreset.o: /usr/include/sys/types.h /usr/include/sys/sysmacros.h
sreset.o: /usr/include/alloca.h /usr/include/ucontext.h
sreset.o: /usr/include/sys/ucontext.h ./proc.h ./q.h ./sem.h
init.o: ./conf.h ./kernel.h ./signal.h /usr/include/features.h
init.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
init.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
init.o: /usr/include/bits/sigset.h /usr/include/bits/types.h
init.o: /usr/include/bits/typesizes.h /usr/include/bits/signum.h
init.o: /usr/include/time.h /usr/include/bits/siginfo.h
init.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
init.o: /usr/include/asm/sigcontext.h /usr/include/linux/types.h
init.o: /usr/include/asm/types.h /usr/include/asm-generic/types.h
init.o: /usr/include/asm-generic/int-ll64.h /usr/include/asm/bitsperlong.h
init.o: /usr/include/asm-generic/bitsperlong.h
init.o: /usr/include/linux/posix_types.h /usr/include/linux/stddef.h
init.o: /usr/include/asm/posix_types.h /usr/include/asm/posix_types_32.h
init.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
init.o: /usr/include/bits/sigstack.h /usr/include/bits/pthreadtypes.h
init.o: /usr/include/bits/sigthread.h /usr/include/stdio.h
init.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
init.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
init.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
init.o: /usr/include/sys/time.h /usr/include/bits/time.h
init.o: /usr/include/sys/select.h /usr/include/bits/select.h
init.o: /usr/include/stdlib.h /usr/include/bits/waitflags.h
init.o: /usr/include/bits/waitstatus.h /usr/include/endian.h
init.o: /usr/include/bits/endian.h /usr/include/bits/byteswap.h
init.o: /usr/include/sys/types.h /usr/include/sys/sysmacros.h
init.o: /usr/include/alloca.h /usr/include/ucontext.h
init.o: /usr/include/sys/ucontext.h ./io.h
lex.yy.o: /usr/include/stdio.h /usr/include/features.h
lex.yy.o: /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h
lex.yy.o: /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h
lex.yy.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stddef.h
lex.yy.o: /usr/include/bits/types.h /usr/include/bits/typesizes.h
lex.yy.o: /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h
lex.yy.o: /usr/lib/gcc/x86_64-redhat-linux/4.8.2/include/stdarg.h
lex.yy.o: /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h
lex.yy.o: /usr/include/string.h /usr/include/xlocale.h /usr/include/errno.h
lex.yy.o: /usr/include/bits/errno.h /usr/include/linux/errno.h
lex.yy.o: /usr/include/asm/errno.h /usr/include/asm-generic/errno.h
lex.yy.o: /usr/include/asm-generic/errno-base.h /usr/include/stdlib.h
lex.yy.o: /usr/include/bits/waitflags.h /usr/include/bits/waitstatus.h
lex.yy.o: /usr/include/endian.h /usr/include/bits/endian.h
lex.yy.o: /usr/include/bits/byteswap.h /usr/include/sys/types.h
lex.yy.o: /usr/include/time.h /usr/include/sys/select.h
lex.yy.o: /usr/include/bits/select.h /usr/include/bits/sigset.h
lex.yy.o: /usr/include/bits/time.h /usr/include/sys/sysmacros.h
lex.yy.o: /usr/include/bits/pthreadtypes.h /usr/include/alloca.h
lex.yy.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
lex.yy.o: /usr/include/bits/environments.h /usr/include/bits/confname.h
lex.yy.o: /usr/include/getopt.h





