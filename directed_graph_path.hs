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


--Better signature and performance, saves many stack frames in comparison with mine solution
--My solution is visibly functionalized procedural search
--Saves usage of many datastructures
hasPathExampleSolution:: [(Int, Int)] -> Int -> Int -> Bool
hasPathExampleSolution [] x y = x == y --This is more of a philosophical question, empty graph does not have any nodes therefore no path shall exist imho
hasPathExampleSolution xs x y 
    | x == y = True --We moved to the end and found it, there is no fixed start here
    | otherwise =
        let xs' = [(n,m) | (n,m) <- xs, n /= x] in  --Crate xs', which is a list where we remove all starting with current x, to remove possible cycles
        or [hasPathExampleSolution xs' m y | (n,m) <- xs, n == x]   --Now start search on this list with m as starting point, which is shifted from all possible occurences of x
        -- Or is applied to list of all results of possible paths


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