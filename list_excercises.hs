module Main where
import Data.List
import Control.Exception (assert)
-- Excersise 1
-- Implement a function elem, that returns wether given list 
-- contains given element

contains::(Eq a) => a -> [a] -> Bool
contains val [] = False
contains val (x:xs)
    | (x == val) = True
    | null xs = False
    | otherwise = contains val xs


main::IO()
main = do 
    let first = contains 10 [1,2,3,4,5,10]
    let second = contains 0 [1,2,3,4,5,10]
    let third = contains 10 []
    let fourth = contains 10 [10]

    assert (first == True) (print("First test passed"))
    assert (second == False) (print("Second test passed"))
    assert (third == False) (print("Third test passed"))
    assert (fourth == True) (print("Fourth test passed"))
    print("All passed")
