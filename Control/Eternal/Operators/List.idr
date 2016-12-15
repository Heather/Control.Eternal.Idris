module Control.Eternal.Operators.List

%access public export

for : List a -> (a -> IO ()) -> IO ()
for [] f = pure ()
for (x :: xs) f = do f x
                     for xs f

infixl 2 #

(#) : List a -> Nat -> Maybe a
a # n = index' n a
