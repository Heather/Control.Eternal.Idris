module Control.Eternal.Parse

charToInt : Char -> Maybe Int
charToInt c = let i = cast {to=Int} c
                  zero = cast {to=Int} '0'
                  nine = cast {to=Int} '9'
              in if i < zero || i > nine
                    then Nothing
                    else Just (i - zero)

total
parse' : Int -> List Int -> Maybe Int
parse' _   []      = Nothing
parse' acc [d]     = Just (10 * acc + d)
parse' acc (d::ds) = parse' (10 * acc + d) ds

total parseInt : String -> Maybe Int
parseInt str = (sequence (map charToInt (unpack str))) >>= parse' 0
