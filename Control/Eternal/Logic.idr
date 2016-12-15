module Control.Eternal.Logic

%access public export

ifSo :  Lazy (IO ()) -> Bool -> IO ()
ifSo = flip when

unless :  Bool -> Lazy (IO ()) -> IO ()
unless a = when $ not a

ifNot : Lazy (IO ()) -> Bool -> IO ()
ifNot = flip unless
