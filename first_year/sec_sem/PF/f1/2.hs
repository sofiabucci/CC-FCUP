import Prelude

leftHalf ::  [a] -> [a]
leftHalf exp = take ((length exp) `div` 2) exp

rightHalf ::  [a] -> [a]
rightHalf exp = drop ((length exp) `div` 2) exp

