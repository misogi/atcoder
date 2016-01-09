main = do
  a <- readInt
  b <- readInt
  n <- readInt
  let ans = solve a b n
  putStrLn $ show ans

solve :: Int -> Int -> Int -> Int
solve a b n = head [se | se <- [n..], mod se a == 0, mod se b == 0]

readInt :: IO Int
readInt = readLn
