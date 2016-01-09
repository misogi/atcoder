
readInt :: IO Int
readInt = readLn

readInts :: IO [Int]
readInts = fmap ((map read) . words) getLine

atVal :: Int -> Int -> Int -> Int
atVal 0 a c = 1
atVal t a c = (a * atVal (div t 2) a c) `mod` c

btVal :: Int -> Int -> Int -> Int -> Int
btVal 0 a b c = 0
btVal t a b c = (a * (btVal (div t 2) a b c) + b) `mod` c

oneSum :: Int -> Int -> Int -> Int -> Int
oneSum x at bt c = ( at * x + bt ) `mod` c;

allSum :: Int -> Int -> Int -> Int -> Int -> [Int]
allSum x at bt c 0 = []
allSum x at bt c n =
  let one = oneSum x at bt c
  in x : allSum one at bt c (n-1)

main = do
  n <- readInt
  [x, t, a, b, c] <- readInts
  let at = atVal t a c
  let bt = btVal t a b c
  putStrLn $ show $ sum $ allSum x at bt c n
