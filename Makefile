# readPrcoess

CC=gcc
CFLAGS=-O3
CLIBS=src/readProcess.c
LIBS=readProcess.o
HEADERS=src/readProcess.h
INCLUDES = -I src
INSTALL ?= install
MKDIR ?= $(INSTALL) -d
IDRISDIR ?= "C:/Idris"
DESTDIR ?=

ctodo: $(CLIBS)
	$(CC) ${INCLUDES} -c -o ${LIBS} $^ $(CFLAGS)

.PHONY: clean

clean:
	rm -f ${LIBS}
    
install:
	$(MKDIR) $(DESTDIR)$(IDRISDIR)
	$(INSTALL) $(LIBS) $(DESTDIR)$(IDRISDIR)/
	$(INSTALL) $(HEADERS) $(DESTDIR)$(IDRISDIR)/
	idris --install Control.Eternal.ipkg
