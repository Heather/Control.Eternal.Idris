module Control.Eternal.Operators.Nat

import Control.Eternal.Parse

%access public export

natToDouble : Nat -> Double
natToDouble o = 0.0
natToDouble (S n) = 1.0 + (natToDouble n)

round : Double -> Nat
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
                              parseAsInt : Double =
                                case parseInt packs of
                                      Just mi => let flenmi = natToDouble lenmi
                                                     nmi = cast {to=Nat} {from=Int} mi
                                                     fmi = natToDouble nmi
                                                 in (fmi / (10.0 * flenmi))
                                      _       => 0.0
                          in 0.0 + parseAsInt
                _      => 0.0
      caseminor = if (0.5 - minor) > 0 then 0
                                       else 1
  in major + caseminor
