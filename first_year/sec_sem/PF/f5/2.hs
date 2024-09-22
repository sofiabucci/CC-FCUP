import Prelude

primo :: Integer ->  Bool
primo n = n>1 && all (\d ->  mod n d /= 0)[2..floor (sqrt (fromIntegral n))]