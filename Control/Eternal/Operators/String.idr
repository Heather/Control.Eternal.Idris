module Control.Eternal.Operators.String

splitOn : Char -> String -> List String
splitOn a = split (== a)