module Control.Eternal.System.Process

{-
home : String
home = case getEnv("HOME") of
        Just home => home
        _         => "."

readProcessh : String
readProcessh = home ++ "/.Idris/readProcess.h"

readProcesso : String
readProcesso = home ++ "/.Idris/readProcess.o"
        
%include C readProcessh
%link    C readProcesso
-}

%include C "readProcess.h"
%link    C "readProcess.o"

%language TypeProviders

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