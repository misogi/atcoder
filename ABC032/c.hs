import Control.Monad
import qualified Data.Sequence as Seq

main = do
  [n, k] <- readInts
  nums <- replicateM n readInt
  putStrLn $ show $ solve nums k

solve :: [Int] -> Int -> Int
solve xs k
  | 0 `elem` xs = length xs
  | otherwise = calcMaxLen xs Seq.empty 0 1 k

calcMaxLen :: [Int] -> Seq.Seq Int -> Int -> Int -> Int -> Int
calcMaxLen [] _ maxLength _ _ = maxLength
calcMaxLen (x:xs) a maxLength multiVal k
  | k < x     = calcMaxLen xs Seq.empty maxLength 1 k
  | xam <= k  = max xaLen $ calcMaxLen xs xa maxl xam k
  | otherwise =
    let aHead Seq.:< aTail = Seq.viewl a
    in calcMaxLen (x:xs) aTail maxLength (multiVal `div` aHead) k
  where xa = (a Seq.|> x)
        xaLen = Seq.length xa
        maxl = max maxLength xaLen
        xam = multiVal * x

readInt :: IO Int
readInt = readLn

readInts :: IO [Int]
readInts = fmap ((map read) . words) getLine
