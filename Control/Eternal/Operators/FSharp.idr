module Control.Eternal.Operators.FSharp

%access public export

infixl 2 <|, |>

(<|) : (a -> b) -> a -> b
f <| a = f a

(|>) : a -> (a -> b) -> b
a |> f = f a

infixl 10 <<|, |>>

(<<|) : (a -> b) -> a -> b
f <<| a = f a

(|>>) : a -> (a -> b) -> b
a |>> f = f a
