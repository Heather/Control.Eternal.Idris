module Control.Eternal.System.Process

-- because I can't use Environment variables here :(
-- for Linux it should be somewhere else, for sure.
-- windows version:
-- %include C "C:/Idris/readProcess.h"
-- %link    C "C:/Idris/readProcess.o"

%include C "/usr/local/idris/readProcess.h"
%link    C "/usr/local/idris/readProcess.o"

%access public export

readProcess : String -> IO String
readProcess cmd = foreign FFI_C "readProcess" (String -> IO String) cmd
-- old idris FF:
-- mkForeign (FFun "readProcess" [FString] FString) cmd

-- allow silent readProcess
readProcess' : String -> Bool -> IO String
readProcess' cmd sh =
    let fchar = chr $ if sh then 1
                            else 0
    in foreign FFI_C "readProcessQ" (String -> Char -> IO String) cmd fchar
-- old idris FF:
-- mkForeign (FFun "readProcessQ" [FString, FChar] FString) cmd fchar
