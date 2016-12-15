module Control.Eternal.Operators.String

%access public export

breakOn : Char -> String -> (String, String)
breakOn a = break (== a)

splitOn : Char -> String -> List String
splitOn a = split (== a)
