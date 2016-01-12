import Control.Monad

main = do
  [n, k] <- readInts
  nums <- replicateM n readInt
  putStrLn $ show $ solve nums k

solve :: [Int] -> Int -> Int
solve xs k
  | 0 `elem` xs = length xs
  | otherwise = calcMaxLen xs [] 0 k

calcMaxLen :: [Int] -> [Int] -> Int -> Int -> Int
calcMaxLen [] _ _ _ = 0
calcMaxLen (x:xs) a maxLength k
  | k < x     = calcMaxLen xs [] maxLength k
  | xam <= k  = max (length xa) $ calcMaxLen xs xa maxl k
  | otherwise = calcMaxLen (x:xs) (init a) maxLength k
  where xa = (x:a)
        maxl = max maxLength (length xa)
        xam = multi xa

multi :: [Int] -> Int
multi = foldl1 (*)

readInt :: IO Int
readInt = readLn

readInts :: IO [Int]
readInts = fmap ((map read) . words) getLine
