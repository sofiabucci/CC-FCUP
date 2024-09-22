import Data.List
import System.IO

adivinhaAux :: String -> String -> IO Int
adivinhaAux palavra tentativas = do
  putStrLn "?" 
  letra <- getChar
  let tentatua = letra : tentativas 
      palaatua = map (\c -> if elem c tentatua then c else '-') palavra
  putStrLn palaatua
  if all (`elem` tentatua) palavra then return(length tentatua)
  else adivinhaAux palavra tentatua

adivinha :: String -> IO()
adivinha palavra = do 
  putStrLn $ replicate (length palavra) '-'
  tentativa <- adivinhaAux palavra []
  putStrLn $ "Adivinhou em " ++ show tentativa ++ " tentativas"



