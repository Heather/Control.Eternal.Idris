module Control.Eternal.Operators.String

splitOn : Char -> String -> List String
splitOn a = split (== a)

startsWith : String -> String -> Bool
startsWith a b = isPrefixOf (unpack a) (unpack b)
