module Control.Eternal.Operators.Nat

import Control.Eternal.Parse

natToFloat : Nat -> Float
natToFloat O = 0.0
natToFloat (S n) = 1.0 + (natToFloat n)

round : Float -> Nat
round f =
    let sf = show f
        splitsf = split (== '.') $ unpack sf
        first = index' 0 splitsf
        fpack = case first of
                        Just f => pack f
                        _      => "0"
        major = case parseInt fpack of
                        Just i => cast {to=Nat} {from=Int} i
                        _      => 0
        second = index' 1 splitsf
        minor = case second of
                    Just s => let lenmi = length s
                                  packs = pack s
                                  parseAsInt : Float = case parseInt packs of
                                                            Just mi => let flenmi = natToFloat lenmi
                                                                           nmi = cast {to=Nat} {from=Int} mi
                                                                           fmi = natToFloat nmi
                                                                       in (fmi / (10.0 * flenmi))
                                                            _       => 0.0
                              in 0.0 + parseAsInt
                    _      => 0.0
        caseminor = if (0.5 - minor) > 0 then 0
                                         else 1
    in major + caseminor
