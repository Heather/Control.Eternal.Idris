@echo off

::build & install
make -f Makefile.windows clean
make -f Makefile.windows CC=gcc & make install & make clean

pause
