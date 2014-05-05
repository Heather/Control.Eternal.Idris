module Control.Eternal.Logic

ifSo :  Lazy (IO ()) -> Bool -> IO ()
ifSo = flip when

unless :  Bool -> Lazy (IO ()) -> IO ()
unless a = when $ not a

ifNot : Lazy (IO ()) -> Bool -> IO ()
ifNot = flip unless