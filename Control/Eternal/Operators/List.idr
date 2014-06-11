module Control.Eternal.Operators.List

for : List a -> (a -> IO ()) -> IO ()
for [] f = return ()
for (x :: xs) f = do f x

infixl 2 #

(#) : List a -> Nat -> Maybe a
a # n = index' n a
