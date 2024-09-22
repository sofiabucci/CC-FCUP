import Prelude

main :: IO()
main = do
    frase <- getContents
    mapM_ (putStrLn . reverse) (lines frase)
