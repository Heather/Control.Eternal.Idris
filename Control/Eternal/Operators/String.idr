module Control.Eternal.Operators.String

splitOn : Char -> String -> List String
splitOn a = split (== a)

splitLines : String -> List String
splitLines s = splitOn '\n' s

-- TODO: Prelude.String.isPrefixOf with String -> String -> Bool
startsWith : String -> String -> Bool
startsWith a b = isPrefixOf (unpack a) (unpack b)
