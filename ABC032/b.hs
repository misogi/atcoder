import Data.List

main = do
  s <- getLine
  k <- readInt
  let ans = solve s k
  putStrLn $ show $ length (nub ans)

solve :: String -> Int -> [String]
solve s k = [take k (drop start s) | start <- [0..((length s) - k)]]

readInt :: IO Int
readInt = readLn
