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
--  [2,4..20] specifying ranges, this is pretty interesting syntax
--  
