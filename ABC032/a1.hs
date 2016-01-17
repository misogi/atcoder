main = do
  a <- readInt
  b <- readInt
  n <- readInt
  putStrLn . show $ solve a b n

solve :: Int -> Int -> Int -> Int
solve a b n = (n + lcmAb - 1) `div` lcmAb * lcmAb
  where lcmAb = lcm a b

readInt :: IO Int
readInt = readLn
