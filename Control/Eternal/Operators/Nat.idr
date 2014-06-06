module Control.Eternal.Operators.Nat

natToFloat : Nat -> Float
natToFloat O = 0.0
natToFloat (S n) = 1.0 + (natToFloat n)
