
import Prelude
import Data.List
import Data.Char


paragraphs :: String -> [String]
paragraphs "" = [""]
paragraphs ('\n':'\n':xs) = "" : paragraphs xs
paragraphs (x:xs) | null str = [[x]]
                  | otherwise = (x:head str) : tail str
                   where str = paragraphs xs


wordsThatFit :: Int -> [String] -> Int
wordsThatFit _ [] = 0
wordsThatFit n (x:xs) = if word <= n then 1 + wordsThatFit (n-word-1) xs
                        else 0
                        where word = length x 


fillWords :: Int -> [String] -> [[String]]
fillWords _ [] = []
fillWords n (x:xs) = take nfit (x:xs) : fillWords n (drop nfit (x:xs))
                     where nfit = wordsThatFit n (x:xs) 


formatw :: [[String]] -> [String]
formatw [] = []
formatw str = map unwords str


allstr :: [String]-> String
allstr [] = []
allstr (x:xs) = let lw = words x
                    lp = fillWords 70 lw 
                    lpw = formatw lp
                in unlines lpw ++ "\n" ++ allstr xs


main :: IO()
main = do
    str <- getContents
    let strp = paragraphs str
        strs = allstr strp
    putStr strs 
