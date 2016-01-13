import Control.Monad
import qualified Data.Sequence as Seq

main = do
  (n, maxWeight) <- readInts
  items <- replicateM n readInts
  putStrLn $ show $ items

readInts :: IO (Int, Int)
readInts = fmap (toTupple . (map read) . words) getLine

toTupple :: [Int] -> (Int, Int)
toTupple a = (head a, last a)
