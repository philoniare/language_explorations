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
