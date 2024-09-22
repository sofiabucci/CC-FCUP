import Prelude

elefantes :: Int -> IO ()
elefantes n = elefantesAux n 2

elefantesAux :: Int -> Int -> IO()
elefantesAux n i | n <= i = return ()
                 | otherwise = do
    putStrLn $ "Se " ++ show i ++ " elefantes incomodam muita gente, "
    putStrLn $ show (i+1) ++ " elefantes incomodam muito mais! \n"
    elefantesAux n (i+1)
             
