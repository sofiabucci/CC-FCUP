
import Data.Char

main :: IO ()
main = do
    content <- getContents
    putStrLn $ map rot content

rot :: Char -> Char
rot c | isLower c = chr $ ((ord c - ord 'a' + 13) `mod` 26) + ord 'a'
      | isUpper c = chr $ ((ord c - ord 'A' + 13) `mod` 26) + ord 'A'
      | otherwise = c