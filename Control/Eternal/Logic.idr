module Control.Eternal.Logic

ifSo : IO () -> Bool -> IO ()
ifSo = flip when
