main = do
  n <- readInt
  [x, t, a, b, c] <- readInts
  let maxMult = maxMultNum a c
  let s = x:(usaSeq x t a b c maxMult)
  putStrLn $ show maxMult
  putStrLn $ show $ newVal x t a b c maxMult
  putStrLn $ show $ bts a t b c
  putStrLn $ show $ atVal a t x
  putStrLn $ show (take n s)
  putStrLn $ show $ sum (take n s)

readInt :: IO Int
readInt = readLn

readInts :: IO [Int]
readInts = fmap ((map read) . words) getLine

usaSeq :: Int -> Int -> Int -> Int -> Int -> Int -> [Int]
usaSeq x t a b c maxMult =
  let multNums = [(tt * t) | tt <- [1..]]
  in map (\ttt -> newVal x ttt a b c maxMult) multNums

newVal :: Int -> Int -> Int -> Int -> Int -> Int -> Int
newVal x t a b c maxMult =
  let tt = t `mod` maxMult
  in atVal a tt x + last (bts a t b c)

bts :: Int -> Int -> Int -> Int -> [Int]
bts a t b c =
  takeWhile (\sm -> sm < c) $ scanl1 (+) $ map (\tt -> b * (a ^ tt)) [0..(t-1)]

atVal :: Int -> Int -> Int -> Int
atVal a t x = (a ^ t) * x

maxMultNum :: Int -> Int -> Int
maxMultNum a c =
  length $ takeWhile (\tt -> a ^ tt < c) [1..]
