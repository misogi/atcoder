import Control.Monad

main = do
  [n, k] <- readInts
  nums <- replicateM n readInt
  let a = multAll nums [] 0 k
  putStrLn $ show $ maxLength a

maxLength :: [[Int]] -> Int
maxLength [] = 0
maxLength a = maximum $ map length a

multAll :: [Int] -> [Int] -> Int -> Int -> [[Int]]
multAll [] _ _ _ = []
multAll (x:xs) a maxLength k
  | k < x     = multAll xs [] maxLength k
  | xam < k   = xa : multAll xs xa maxl k
  | otherwise = a : multAll (x:xs) (pop a) maxLength k
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
