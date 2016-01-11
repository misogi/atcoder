import Control.Monad

main = do
  [n, k] <- readInts
  nums <- replicateM n readInt
  putStrLn $ show $ solve nums k

solve :: [Int] -> Int -> Int
solve xs k
  | 0 `elem` xs = length xs
  | otherwise = maximum $ multAll xs [] 0 k

multAll :: [Int] -> [Int] -> Int -> Int -> [Int]
multAll [] _ _ _ = []
multAll (x:xs) a maxLength k
  | k < x     = multAll xs [] maxLength k
  | xam <= k   = length xa : multAll xs xa maxl k
  | otherwise = length a : multAll (x:xs) (pop a) maxLength k
  where xa = (x:a)
        maxl = max maxLength (length xa)
        xam = multi xa

pop :: [Int] -> [Int]
pop xs = reverse $ tail $ reverse xs

multi :: [Int] -> Int
multi = foldl1 (*)

readInt :: IO Int
readInt = readLn

readInts :: IO [Int]
readInts = fmap ((map read) . words) getLine
