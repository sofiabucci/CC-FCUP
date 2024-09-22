import Prelude
import Data.Char

forte :: String -> Bool

forte exp | length(exp) >= 8 && length([u | u  <- exp,  isUpper u]) >= 1 && length([l | l  <- exp,  isLower l]) >= 1 && length([n | n  <- exp,  isDigit n]) >= 1 = True
          | otherwise = False