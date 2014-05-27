@echo off

make

idris --clean Control.Eternal.ipkg
idris --install Control.Eternal.ipkg
pause
echo wow...