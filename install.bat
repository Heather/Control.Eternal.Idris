@echo off

::build & install
idris --clean Control.Eternal.ipkg
make CC=clang & make install & make clean

pause
