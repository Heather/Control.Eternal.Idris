module Control.Eternal.Operators.String

splitOn : Char -> String -> List String
splitOn a = split (== a)

-- TODO: Prelude.String.isPrefixOf with String -> String -> Bool
startsWith : String -> String -> Bool
startsWith a b = isPrefixOf (unpack a) (unpack b)
