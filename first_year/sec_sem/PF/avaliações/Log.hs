
module Log where

-- tipos de mensagem
data MessageType = Info
                 | Warning
                 | Error Int
  deriving (Show, Eq)

-- instante de tempo 
type TimeStamp = Int

-- entrada no ficheiro de log
data LogEntry = LogMessage MessageType TimeStamp String
              | Unknown String
  deriving (Show, Eq)

-- árvore binária para mensagens
data MessageTree = Empty
                 | Node LogEntry MessageTree MessageTree
  deriving (Show, Eq)
