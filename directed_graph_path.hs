module Main where

import Data.List
import Data.Set
import Control.Exception (assert)



--Exercise
--Create function hasPath that: Given directed graph (list of tuples of connected nodes) determines
--wether path exists from the first node to the second

hasPath:: [(Int, Int)] -> Int -> Int -> Bool
hasPath [] _ _ = False

hasPath arr start end = findPath arr arr start end start Data.Set.empty
    where 
        findPath:: [(Int, Int)] -> [(Int, Int)] -> Int -> Int -> Int -> Data.Set.Set Int -> Bool
        findPath [] _ _ _ _ _ = False
        findPath ((x,y):xs) original start end searching visited --Searching is the start point in the beginning
            | searching == y && end == y = True     --We found the path
            | start == x && end == y = True
            | searching == x && (member y visited) = False     --We cycled
            | searching == x = (findPath xs original start end y (Data.Set.insert x visited)) || (findPath original original start end y (Data.Set.insert x visited)) 
            --Either find next from the start or in the rest of the current one or find next occurence of x, one must be true to find the path
            | otherwise = findPath xs original start end searching visited




test_has_path::IO()
test_has_path = do 
    let first = hasPath [(1,2), (2,3), (3,4), (4,2)] 4 2
    let second = hasPath [(1,2), (3,4), (2,4)] 1 4
    let third = hasPath [(1,2), (2,3), (3,4), (4,2), (5,4)] 1 5
    let fourth = hasPath [(1,2), (2,3)] 1 3
    let fifth = hasPath [(1,2), (2,3), (3,4), (4,2)] 4 3


    assert (first == True) (print("First test passed"))
    assert (second == True) (print("Second test passed"))
    assert (third == False) (print("Third test passed"))
    assert (fourth == True) (print("Fourth test passed"))
    assert (fifth == True) (print("Fifth test passed"))
    print("All passed")

main::IO()
main = test_has_path