@echo off

::build & install
idris --clean Control.Eternal.ipkg
make & make install & make clean

pause
