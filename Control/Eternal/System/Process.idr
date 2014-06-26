module Control.Eternal.System.Process

-- because I can't use Environment variables here :(
-- for Linux it should be somewhere else, for sure.
%include C "C:/Idris/readProcess.h"
%link    C "C:/Idris/readProcess.o"

readProcess : String -> IO String
readProcess cmd = mkForeign (FFun "readProcess" [FString] FString) cmd

-- allow silent readProcess
readProcess' : String -> Bool -> IO String
readProcess' cmd sh =
    let fchar = chr $ if sh then 1
                            else 0
    in mkForeign (FFun "readProcessQ" [FString, FChar] FString) cmd fchar

system : String -> IO()
system cmd = mkForeign (FFun "system" [FString] FUnit) cmd