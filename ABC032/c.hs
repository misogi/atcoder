import Control.Monad
import qualified Data.Sequence as Seq

main = do
  [n, k] <- readInts
  nums <- replicateM n readInt
  putStrLn $ show $ solve nums k

solve :: [Int] -> Int -> Int
solve xs k
  | 0 `elem` xs = length xs
  | otherwise = calcMaxLen xs Seq.empty 0 k

calcMaxLen :: [Int] -> Seq.Seq Int -> Int -> Int -> Int
calcMaxLen [] _ _ _ = 0
calcMaxLen (x:xs) a maxLength k
  | k < x     = calcMaxLen xs Seq.empty maxLength k
  | xam <= k  = max xaLen $ calcMaxLen xs xa maxl k
  | otherwise =
    let aHead Seq.:< aTail = Seq.viewl a
    in calcMaxLen (x:xs) aTail maxLength k
  where xa = (x Seq.<| a)
        xaLen = Seq.length xa
        maxl = max maxLength xaLen
        xam = foldl1 (*) xa

readInt :: IO Int
readInt = readLn

readInts :: IO [Int]
readInts = fmap ((map read) . words) getLine
