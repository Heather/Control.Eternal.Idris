module Control.Eternal.Operators.List

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
