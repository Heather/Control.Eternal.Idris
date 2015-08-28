@echo off

::build & install
make clean
make CC=gcc & make install & make clean

pause
