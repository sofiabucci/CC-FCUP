import Prelude
import Data.Char

vigenere :: String -> String -> String
vigenere key msg = code (zipWith (+) ks msgs)
                    where ks = map (\c -> ord c - ord 'A')(take (length msg) (cycle key)) 
                          msgs = map (\c -> ord c - ord 'A') msg
                          code x = map (\c -> chr ((mod c 26) + ord 'A')) x

