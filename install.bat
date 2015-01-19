@echo off

::build & install
make clean
make CC=clang & make install & make clean

pause
