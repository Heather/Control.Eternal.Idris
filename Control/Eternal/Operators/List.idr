module Control.Eternal.Operators.List

infixl 2 !!

(!!) : List a -> Nat -> Maybe a
l !! n = index' n l