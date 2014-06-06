module Control.Eternal.Operators.Nat

natToFloat : Nat -> Float
natToFloat O = 0.0
natToFloat (S n) = 1.0 + (natToFloat n)

{-
round : Float -> Int
round f = do
    let sf = show f
    let splitsf = splitOn '.' $ unpack sf
    let Just first = splitsf # 0
    let fpack = pack first
    let major = case parseInt fpack of
                    Just i => i
                    _      => 0
    let second = splitsf # 1
    let minor : Float = case second of
                            Just s => do let lenmi = length s
                                         let packs = pack s
                                         let parseAsInt : Float = case parseInt packs of
                                                                    Just mi => let flenmi = natToFloat lenmi
                                                                               in (mi / (10.0 * flenmi))
                                                                    _       => 0.0
                                         0.0 + parseAsInt
                            _      => 0.0
    let caseminor = if (0.5 - minor) > 0 then 0
                                         else 1
    major + caseminor
-}