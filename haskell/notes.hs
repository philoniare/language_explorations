-- Intro to Haskell:
-- Main characteristics:
--    purely functional - variables not modified
--    lazy - computes only when necessary
--    statically typed - unlike python, has explicit data types


-- Baby steps - Starting with building blocks of the language:
--  Logical operators: &&, ||, not
--  Equality operators: ==, /=

--  Function application has highest precedence
-- succ 9 * 10   -- will return 100

--  Function calls: func param1 param2 ...
--  Function definition:
tripleMe x = x + x + x

--  Conditionals:
doubleSmallerThan100 x = (if x > 100 then x else x * 2)


-- Build a Concrete Foundation -- Lists
--  has homogenous lists
--  similar to other languages, strings are just lists of chars

-- List operations ++ (merge lists), has to traverse the whole left side
--  x:[nums] is O(1)
-- element-wise access: [] !! i where i starts at 0
-- lists can be compared element-wise with <, <=, >, >=, ==

-- head   returns first el
-- tail   returns the list except the head (more like body)
-- last   returns last el
-- init   return everything except last
-- length returns len of list
-- null   checks if null, can also use xs == []
-- reverse
-- take i xs  takes first elements from xs
-- drop   reverse of take, returns the rest of the list
-- maximum, minimum, sum, product
-- elem i xs   checks if i is an element of xs

-- Ranges:
--  [1..100] inclusive
--  [2,4..20] specifying ranges, this is a pretty interesting syntax

-- Making infinite lists:
--  because haskell makes use of lazy evaluation, you can specify a list
--  as an infinite list that evaluates what is needed when it is called
cycle([1, 3, 4])
-- would result in an infinite list
take 10 (cycle([1, 3, 4]))
take 10 (repeat 5)
-- a more convenient way to do the same could be:
replicate 3 10

-- List Comprehensions in Haskell:
[x**2 | x <- [1..10]]
-- adding a condition:
[x*2 | x <- [1..10], x*2 >= 12, x*2 < 18]

-- Function, enters "BOOM!" if item is odd and "BANG!" if it is even
boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

-- more complex list generations:
[x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50]
-- goes through all permutations of x and y

-- elegant function for calculating length
length xs = sum [1 | _ <- xs]
-- wow, this is great!
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]
-- list comprehensions could be used to remove unnecessary characters
-- I usually do it with regex, this alternative is very compelling!

-- Working with multidimensional lists:
let xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]
[ [ x | x <- xs, even x ] | xs <- xxs]
-- this is quite powerful, I got the same feeling when I learned
-- metaprogramming in ruby for the first time

-- Tuples
--  have a more rigid structure than lists
fst (7, 10)
-- this is great! I like short function names!
-- but they only work in pairs
snd (7, 10)
-- Compare with first in ruby

zip [1 ..] ["one", "two", "three", "four", "five"]
-- zip can very useful with traversing multiple lists simultaneously

let rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2]

-- Types in haskell
:t 'b'
-- can be used to determine type signature
:t fst
-- function type declarations are optional but are good to have
-- because they act like pre and post condition asserts

-- The declarations can be confusing at first, but simple once you get used to it:
addThree :: Int -> Int -> Int -> Int
-- basically, only the last one is the return value and others are parameters
-- that are passed into the function
-- Comparable data structures are of type Ord. For example:
:t (>)
-- returns (>) :: (Ord a) => a -> a -> Bool
-- similar to comparable interface in Java, you can compare them if they're of type Ord

-- Members of type Show can be represented as strings
show 555
-- will return "555"
read "555" + 5
-- does the opposite operation of extracting a data from a string
-- but the output needs to be explicitly stated or haskell should be
-- able to derive it from the context. Otherwise, it would produce an error
read "55.5" + 5
-- doesn't work because it is ambiguous whether it should parse a float or int
read "55" :: Int
-- explicitly specifies the type, also works with arrays and tuples:
read "[1, 2, 3]" :: [Int]

-- Types also have special characteristics, like being able to use enum in ranges
['a'..'e']
[LT .. GT]
-- Bounded types have minBound and maxBound
minBound :: Int
maxBound :: Char

-- fromIntegral converts an integral to a general number type
fromIntegral(length [1, 2, 3]) + 4.1

-- Syntax for declaring function types
-- haskell allows creating different function implementations for different patterns
-- similar to how you can create multiple constructors in other languages
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n-1)

-- _ can be used to match anything:
head' :: [a] -> a
head' [] = error "Can't call head on empty list"
head' (x:_) = x

-- similarly, length can also be implemented as:
length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

-- binding patterns to names
capital :: String -> String
capital "" = "Empty string passed"
capital all@(x:xs) = "First letter of " ++ all ++ " is " ++ [x]

-- Guards are used to catch all cases
bmiTell :: (RealFloat a) => a -> String
bmiTell bmi
  | bmi <= 18.5 = "You are underweight"
  | bmi <= 25.0 = "You are within the normal weight range"
  | bmi <= 30.0 = "You are a bit overweight"
  | otherwise   = "You are quite overweight"

compare :: (Ord a) => a -> a -> Ordering
a `compare` b
  | a > b     = GT
  | a == b    = EQ
  | otherwise = LT

-- where clause can be added to act as an alias for common operations
--    can also act as temporary variables
bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
  | bmi <= skinny = "You are underweight"
  | bmi <= normal = "You are within the normal weight range"
  | bmi <= fat    = "You are a bit overweight"
  | otherwise     = "You are quite overweight"
    where bmi = weight / height ^ 2
          skinny = 18.5
          normal = 25.0
          fat = 30.0
