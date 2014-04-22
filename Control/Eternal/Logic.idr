module Control.Eternal.Logic

ifSo : IO () -> Bool -> IO ()
ifSo = flip when

unless :  Bool -> IO () -> IO ()
unless a = when $ not a

ifNot : IO () -> Bool -> IO ()
ifNot = flip unless