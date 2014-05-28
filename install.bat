@echo off
::install
make
idris --clean Control.Eternal.ipkg
idris -i "%HOME%/.Idris" --install Control.Eternal.ipkg
pause
echo wow...