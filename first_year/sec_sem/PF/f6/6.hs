import System.IO
import Data.List
import Data.Char
import Control.Concurrent.STM (check)
import System.Posix (directoryMode)

readDict :: IO [String]
readDict = do 
    txt <- readFile "/usr/share/dict/words"
    return (lines txt)

checkWord :: String -> [String] -> Bool
checkWord word dict = elem (map toLower word) (map (map toLower) dict)

printWord :: String -> [String] -> IO()
printWord word dict | checkWord word dict = putStrLn word
                    | otherwise = putStrLn ("\x1b[31m" ++ word ++ "\x1b[0m")

main :: IO()
main = do
    text <- getContents
    dict <- readDict
    mapM_ (\word -> printWord word dict) (words text)