import Control.Monad

main = do
  (n, maxWeight) <- readInts
  items <- replicateM n readInts
  putStrLn $ show items

readInts :: IO (Int, Int)
readInts = fmap (toTupple . (map read) . words) getLine

toTupple :: [Int] -> (Int, Int)
toTupple xs = (head xs, last xs)
