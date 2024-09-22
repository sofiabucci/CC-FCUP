#include Prelude

classifica :: Int -> String 

classifica xs | x>=19  = "muito bom com distinção"
              | x>=16 && x<19 = "muito bom"
              | x>=13 && x<16 = "bom"
              | x>=10 && x<13 = "suficiente"
              | otherwise    = "reprovado"