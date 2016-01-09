import Control.Monad

main = do
  [n, k] <- readInts
  nums <- replicateM n readInt
  let ans = solve nums
  putStrLn $ show $ final ans (filterAnswer k)

lengthOfAns :: [[Int]] -> Int
lengthOfAns [] = 0
lengthOfAns xs = length $ head xs

final :: [[Int]] -> ([Int] -> Bool) -> Int
final ans f = lengthOfAns $ filter f ans

filterAnswer :: Int -> [Int] -> Bool
filterAnswer _ [] = False
filterAnswer k d = foldl1 (*) d <= k

solve :: [Int] -> [[Int]]
solve nums = [take len (drop start nums) | len <- [(length nums) + 1,(length nums)..1], start <- [0..((length nums) - len)]]

readInt :: IO Int
readInt = readLn

readInts :: IO [Int]
readInts = fmap ((map read) . words) getLine
