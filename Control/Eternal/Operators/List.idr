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