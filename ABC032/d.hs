import Control.Monad
import qualified Data.Map as Map

main = do
  (n, maxWeight) <- readInts
  items <- replicateM n readInts
  putStrLn $ show $

patterns :: [(Int, Int)] -> 

readInts :: IO (Int, Int)
readInts = fmap (toTupple . (map read) . words) getLine

toTupple :: [Int] -> (Int, Int)
toTupple xs = (head xs, last xs)
