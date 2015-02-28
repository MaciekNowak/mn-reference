LIBHOME=$(ORACLE_HOME)/lib/
LDLIBFLAG=-l
LIBCLNTSHNAME=clntsh
LLIBCLNTSH=$(LDLIBFLAG)$(LIBCLNTSHNAME)
PROLDLIBS=$(LLIBCLNTSH)
GFLAG=-g
WFLAG= -Wall
CC=gcc
PROC=proc
OBJS=mnschema.o
EXE=mnschema
INCLUDE=-I. -I$(ORACLE_HOME)/precomp/public
CFLAGS=$(GFLAG) $(WFLAG) $(PFLAGS)\
	$(SHARED_CFLAG) $(USRFLAGS)
PFLAGS=$(INCLUDE) $(SPFLAGS) $(LPFLAGS)

all: build

build: 
	$(PROC) iname=mnschema.pc
	$(CC) $(CFLAGS) -c mnschema.c
	$(CC) -o $(EXE) $(OBJS) $(INCLUDE) -L$(LIBHOME) \
	$(PROLDLIBS) -lnsl

clean:
	rm $(EXE) $(OBJS) mnschema.c
