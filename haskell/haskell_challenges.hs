-- call a function multiple times
f _ = putStrLn "hello"
applyN 0 _ x = x
applyN n f x = applyN (n - 1) f (f x)
