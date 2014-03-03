module Logic

ifSo : IO () -> Bool -> IO ()
ifSo = flip when
