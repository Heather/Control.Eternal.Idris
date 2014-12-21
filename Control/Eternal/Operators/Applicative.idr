module Control.Eternal.Operators.Applicative

infixl 2 <@>

(<@>) : Functor f => (a -> b) -> f a -> f b
f <@> x = map f x
