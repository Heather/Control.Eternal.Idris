module Control.Eternal.Operators.Nat

import Control.Eternal.Parse

natToFloat : Nat -> Float
natToFloat O = 0.0
natToFloat (S n) = 1.0 + (natToFloat n)

round : Float -> Nat
round f = do
    let sf = show f
    let splitsf = split (== '.') $ unpack sf
    let first = index' 0 splitsf
    let fpack : String = case first of
                            Just f => pack f
                            _      => "0"
    let major : Nat = case parseInt fpack of
                        Just i => cast {to=Nat} {from=Int} i
                        _      => 0
    let second = index' 1 splitsf
    let minor : Float = case second of
                            Just s => do let lenmi = length s
                                         let packs = pack s
                                         let parseAsInt : Float = case parseInt packs of
                                                                        Just mi => do let flenmi = natToFloat lenmi
                                                                                      let nmi = cast {to=Nat} {from=Int} mi
                                                                                      let fmi = natToFloat nmi
                                                                                      (fmi / (10.0 * flenmi))
                                                                        _       => 0.0
                                         0.0 + parseAsInt
                            _      => 0.0
    let caseminor : Nat = if (0.5 - minor) > 0 then 0
                                               else 1
    major + caseminor