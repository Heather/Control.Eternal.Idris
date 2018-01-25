# readPrcoess

CC=gcc
CFLAGS=-O3
CLIBS=src/readProcess.c
LIBS=readProcess.o
HEADERS=src/readProcess.h
INCLUDES = -I src
INSTALL ?= cp -rf
MKDIR ?= mkdir -p
IDRISDIR ?= "/usr/local/idris/"
DESTDIR ?=

readProcess: $(CLIBS)
	$(CC) ${INCLUDES} -c -o ${LIBS} $^ $(CFLAGS)

.PHONY: clean idris

clean:
	idris --clean eternal.ipkg
	rm -f ${LIBS}

idris:
	idris --install eternal.ipkg

install:
	$(MKDIR) $(DESTDIR)$(IDRISDIR)
	$(INSTALL) $(LIBS) $(DESTDIR)$(IDRISDIR)/
	$(INSTALL) $(HEADERS) $(DESTDIR)$(IDRISDIR)/
	idris --install eternal.ipkg
