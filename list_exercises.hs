module Main where
import Data.List
import Control.Exception (assert)
-- Exersise 1
-- Implement a function contains, that returns wether given list 
-- contains given element

--My solution
--Function is tail recursive
contains::(Eq a) => a -> [a] -> Bool
contains val [] = False
contains val (x:xs)
    | (x == val) = True
    | otherwise = contains val xs

--Example solution
contains_ex::(Eq a) => a -> [a] -> Bool
contains_ex _ [] = False
contains_ex e (x:xs) = x == e || contains_ex e xs  --Boolean, either x == e which is true or evaluate rest of the list

--Exercise 2
-- Given a list of (Eq a), remove all duplicates from the gievn list

--My solution using auxilary function and accumulator result
rmd::(Eq a) => [a] -> [a]
rmd list = aux list []
    where
        aux (x:xs) acc
            | null xs = if contains x acc then acc else(acc ++ [x])
            | contains x acc = aux xs acc
            | otherwise = aux xs (acc ++ [x])

--Example solution does not keep order of the doubled items
--My solution does
--This was also my first approach to solution
rmd_solution::(Eq a) => [a] -> [a]
rmd_solution [] = []
rmd_solution (x:xs)
    | contains x xs = rmd_solution xs
    | otherwise = x: rmd_solution xs

test_contains:: IO()
test_contains = do 
    let first = contains 10 [1,2,3,4,5,10]
    let second = contains 0 [1,2,3,4,5,10]
    let third = contains 10 []
    let fourth = contains 10 [10]

    assert (first == True) (print("First test passed"))
    assert (second == False) (print("Second test passed"))
    assert (third == False) (print("Third test passed"))
    assert (fourth == True) (print("Fourth test passed"))
    print("All passed")

test_rmd:: IO()
test_rmd = do
    let first = rmd [1,2,3,4,5,3]
    let second = rmd [1,2,3]
    let third = rmd [1,1,1,1]

    assert (first == [1,2,3,4,5]) (print("First test passed"))
    --assert (second == [1,2,3]) (print("Second test passed"))
    --assert (first == [1]) (print("Third test passed"))
    print("All passed")



main::IO()
main = print(rmd_solution [1,2,3,4,5,3])
    
