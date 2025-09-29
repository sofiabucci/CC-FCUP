module Main where

import Interpreter
import Data.List (sort, nub)

-- alguns programas sequênciais para testes

-- a = 5+3; b = a-2;
example1 :: Stm
example1 =
  CompoundStm
  (AssignStm "a"
    (OpExp (NumExp 5) Plus (NumExp 3))
  )
  (AssignStm "b"
    (OpExp (IdExp "a") Minus (NumExp 2))
  )

  
-- a = 5+3; a++; b = a*2;
example2 :: Stm
example2 =
  CompoundStm
  (AssignStm "a" (OpExp (NumExp 5) Plus (NumExp 3)))
  (CompoundStm
   (IncrStm "a")
   (AssignStm "b" (OpExp (IdExp "a") Times (NumExp 2)))
  )

-- a = 2; a++; b = a+1; c = b+1;
example3 :: Stm
example3 =
  CompoundStm
  (AssignStm "a" (NumExp 2))
  (CompoundStm
   (IncrStm "a")
   (CompoundStm
    (AssignStm "b" (OpExp (IdExp "a") Plus (NumExp 1)))
    (AssignStm "c" (OpExp (IdExp "b") Plus (NumExp 1)))))

main :: IO ()
main = do
  idsStm1 <- return $ nub $ sort $ idsStm example1
  putStrLn $ "   idsStm example1: " ++ (validate idsStm1 ["a", "b"])
  idsStm2 <- return $ nub $ sort $ idsStm example2
  putStrLn $ "   idsStm example2: " ++ (validate idsStm2 ["a", "b"])
  idsStm3 <- return $ nub $ sort $ idsStm example3
  putStrLn $ "   idsStm example3: " ++ (validate idsStm3 ["a", "b", "c"])
  interpStm1 <- return $ sort $ interpStm example1 []
  putStrLn $ "interpStm example1: " ++
             (validate interpStm1 [("a", 8), ("b", 6)])
  interpStm2 <- return $ sort $ interpStm example2 []
  putStrLn $ "interpStm example2: " ++
             (validate interpStm2 [("a", 9), ("b", 18)])
  interpStm3 <- return $ sort $ interpStm example3 []
  putStrLn $ "interpStm example3: " ++
             (validate interpStm3 [("a", 3), ("b", 4), ("c", 5)])
 where
  validate a b =
   if a == b
    then "ok"
    else "KO: " ++ (show a) ++ " != " ++ (show b)
