module Control.Eternal.System.Process

system : String -> IO()
system cmd = mkForeign (FFun "system" [FString] FUnit) cmd