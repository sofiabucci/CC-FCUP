import Prelude

scanls :: (f -> z -> f) -> f -> [z] -> [f]
scanls _ x [] = [x]
scanls f z (x:xs) =
    let y = f z x
    in  y : scanls f y xs