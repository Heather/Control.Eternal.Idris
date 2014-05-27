module Control.Eternal.System.Process

%include C "readProcess.h"
%link C "readProcess.o"

-- Cannot load './readProcess.so' at compile time because Idris was compiled without libffi support.
-- %dynamic "./readProcess.so"

%language TypeProviders

readProcess : String -> IO String
readProcess cmd = mkForeign (FFun "readProcess" [FString] FString) cmd

system : String -> IO()
system cmd = mkForeign (FFun "system" [FString] FUnit) cmd