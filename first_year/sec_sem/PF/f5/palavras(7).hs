import Prelude
import Data.Char

palavras :: String -> [String]
palavras "" = []
palavras w = if pal=="" then palavras resto else pal : palavras resto
             where pal = takeWhile  (not . isSpace)w
                   resto = dropWhile isSpace (dropWhile (not . isSpace) w)

