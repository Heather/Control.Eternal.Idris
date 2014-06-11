@echo off

::build & install c
make & make install & make clean

::build & install idris
idris --clean Control.Eternal.ipkg
idris -i "%HOME%/.Idris" --install Control.Eternal.ipkg
pause
echo wow...