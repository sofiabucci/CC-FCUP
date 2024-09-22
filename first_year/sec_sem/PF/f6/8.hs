import System.IO

-- Função para verificar se o jogo acabou
gameOver :: [Int] -> Bool
gameOver = all (== 0)

-- Função para imprimir o estado atual do tabuleiro
printBoard :: [Int] -> IO ()
printBoard piles = do
  putStrLn "Estado atual do tabuleiro:"
  mapM_ (\(i, stars) -> putStrLn $ show i ++ ": " ++ replicate stars '*') $ zip [1..] piles

-- Função para atualizar o tabuleiro após a jogada de um jogador
updateBoard :: [Int] -> Int -> Int -> [Int]
updateBoard piles pileIndex starsToRemove = 
  take (pileIndex - 1) piles ++ [max (piles !! (pileIndex - 1) - starsToRemove) 0] ++ drop pileIndex piles

-- Função principal para jogar o Nim
playNim :: [Int] -> IO ()
playNim piles = do
  printBoard piles
  if gameOver piles
    then putStrLn "Fim do jogo. O jogador anterior venceu."
    else do
      putStrLn "Digite o número da fila e o número de estrelas a remover (separados por espaço):"
      input <- getLine
      let [pileIndex, starsToRemove] = map read $ words input
      if pileIndex < 1 || pileIndex > length piles || starsToRemove <= 0 || starsToRemove > piles !! (pileIndex - 1)
        then do
          putStrLn "Jogada inválida. Tente novamente."
          playNim piles
        else playNim (updateBoard piles pileIndex starsToRemove)

-- Função principal
main :: IO ()
main = playNim [5, 4, 3, 2, 1]
