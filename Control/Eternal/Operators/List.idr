module Control.Eternal.Operators.List

infixl 2 !!

(!!) : List a -> Nat -> Maybe a
a !! n = index' n a