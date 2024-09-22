

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

parseMessage :: String -> LogEntry
parseMessage msg = case words msg of
                        ("I":t:str) -> LogMessage Info (read t :: Int) (unwords str)
                        ("W":t:str) -> LogMessage Warning (read t :: Int) (unwords str)
                        ("E":n:t:str) -> LogMessage (Error (read n :: Int)) (read t :: Int) (unwords str)
                        _ -> Unknown msg

insert :: LogEntry -> MessageTree -> MessageTree
insert (Unknown str) msgTree = msgTree 
insert logentry Empty = Node logentry Empty Empty
insert (LogMessage msgtypex tx strx) (Node (LogMessage msgtypey ty stry) esq dir) 
        | tx < ty = Node (LogMessage msgtypey ty stry) (insert (LogMessage msgtypex tx strx) esq) dir
        | tx >= ty = Node (LogMessage msgtypey ty stry) esq (insert (LogMessage msgtypex tx strx) dir)



build :: [LogEntry] -> MessageTree    -- construir uma árvore ordenada
build [] = Empty
build (x:xs) = insert x (build xs)


inOrder :: MessageTree -> [LogEntry]  -- listar mensagens por ordem
inOrder Empty = []
inOrder (Node x esq dir) = inOrder esq ++ [x] ++ inOrder dir

                                                         