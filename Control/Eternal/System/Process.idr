module Control.Eternal.System.Process

%include C "readProcess.h"
%link C "readProcess.o"

-- Cannot load './readProcess.so' at compile time because Idris was compiled without libffi support.
-- %dynamic "./readProcess.so"

%language TypeProviders

readProcess : String -> IO String
readProcess cmd = mkForeign (FFun "readProcess" [FString] FString) cmd

-- allow silent readProcess
readProcess' : String -> Bool -> IO String
readProcess' cmd sh =
    let fchar : Char = if sh then '1'
                             else '0'
    in mkForeign (FFun "readProcessQ" [FString, FChar] FString) cmd fchar

system : String -> IO()
system cmd = mkForeign (FFun "system" [FString] FUnit) cmd