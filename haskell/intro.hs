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
