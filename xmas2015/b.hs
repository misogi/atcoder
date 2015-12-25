import Control.Monad
import Data.List

main = do
  [n, m] <- readInts
  mm <- replicateM m (fmap sort readInts)
  let answer = search n mm []
  putStrLn $ show answer

readInts :: IO [Int]
readInts = fmap ((map read) . words) getLine

search :: Int -> [[Int]] -> [Int] -> [[Int]]
search 1 mm connected = []
search n mm connected = head [[x, n]
  | x <- ([1..n-1]), [x, n] `notElem` mm]
  : search (n-1) mm
  -- head (filter (\d -> [d, n] `notElem` mm) [1..(n-1)]) :
  -- search (n-1) mm
