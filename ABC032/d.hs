import Control.Monad
import qualified Data.Map as Map

main = do
  (n, maxWeight) <- readInts
  items <- replicateM n readInts
  let ww = weights n maxWeight
  putStrLn $ show $ ww

weights :: Int -> Int -> Map.Map (Int, Int) Int
weights n maxWeight = Map.fromList [((i, w), 0) | i <- [1..n], w <- [1..maxWeight]]

readInts :: IO (Int, Int)
readInts = fmap (toTupple . (map read) . words) getLine

toTupple :: [Int] -> (Int, Int)
toTupple xs = (head xs, last xs)
