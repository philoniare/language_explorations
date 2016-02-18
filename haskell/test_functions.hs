-- call a function N times

printS :: Show a => a -> IO ()
printS s = print s

applyNtimes :: (Num n, Ord n) => n -> (a -> a) -> a -> a
applyNtimes 1 f x = f x
applyNtimes n f x = f (applyNtimes (n-1) f x)

-- Finding fibonacci numbers
fib :: (Integral a) => a -> a
fib 1 = 0
fib 2 = 1
fib n = fib(n-1) + fib(n-2)

bmiTell :: (RealFloat a) => a -> String
bmiTell bmi
  | bmi <= 18.5 = "You are underweight"
  | bmi <= 25.0 = "You are within the normal weight range"
  | bmi <= 30.0 = "You are a bit overweight"
  | otherwise   = "You are quite overweight"

myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
  | a > b     = GT
  | a == b    = EQ
  | otherwise = LT

initials :: String -> String -> String
initials first last = [f] ++ "." ++ [l] ++ "."
  where (f:_) = first
        (l:_) = last
