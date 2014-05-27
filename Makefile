# readPrcoess

CC=gcc
CFLAGS=-O3
CLIBS=readProcess.c
LIBS=readProcess.o
INCLUDES = -I .
INSTALL ?= install
MKDIR ?= $(INSTALL) -d
BINDIR ?= $(PREFIX)/bin
DESTDIR ?=

ctodo: $(CLIBS)
	$(CC) ${INCLUDES} -c -o ${LIBS} $^ $(CFLAGS)

.PHONY: clean

clean:
	@echo " --- Clean binaries --- "
	rm -f ${LIBS}
	@echo " --- Clean temp files --- "
	find . -name '*~' -delete;
	find . -name '#*#' -delete;