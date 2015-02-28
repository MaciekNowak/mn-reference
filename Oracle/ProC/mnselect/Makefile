LIBHOME=$(ORACLE_HOME)/lib/
LDLIBFLAG=-l
LIBCLNTSHNAME=clntsh
LLIBCLNTSH=$(LDLIBFLAG)$(LIBCLNTSHNAME)
PROLDLIBS=$(LLIBCLNTSH)
GFLAG=-g
WFLAG= -Wall
CC=gcc
PROC=proc
OBJS=mnselect.o
EXE=mnselect
INCLUDE=-I. -I$(ORACLE_HOME)/precomp/public
CFLAGS=$(GFLAG) $(WFLAG) $(PFLAGS)\
	$(SHARED_CFLAG) $(USRFLAGS)
PFLAGS=$(INCLUDE) $(SPFLAGS) $(LPFLAGS)

all: build

build: 
	$(PROC) iname=mnselect.pc
	$(CC) $(CFLAGS) -c mnselect.c
	$(CC) -o $(EXE) $(OBJS) $(INCLUDE) -L$(LIBHOME) \
	$(PROLDLIBS) -lnsl

clean:
	rm $(EXE) $(OBJS) mnselect.c
