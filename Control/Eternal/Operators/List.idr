module Control.Eternal.Operators.List

for : List a -> (a -> IO ()) -> IO ()
for [] f = return ()
for (x :: xs) f = do f x

{-
infixl 2 !!

(!!) : List a -> Nat -> Maybe a
a !! n = index' n a
-}

-- below code doesn't work because of parser bug
-- or maybe ! is just reserved

infixl 2 #

(#) : List a -> Nat -> Maybe a
a # n = index' n a

splitOn : Eq a => a -> List a -> List (List a)
splitOn a = split (== a)

replaceOn : Eq a => a -> a -> List a -> List a
replaceOn a b l = map (\c => if c == a then b else c) l
