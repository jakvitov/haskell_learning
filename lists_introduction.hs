module Main where
import Data.List

--Lists lesson
 -- [] empty list

 --Generate list from m to n
 -- Not tail recursive
gen_asc_list:: Int -> Int -> [Int]
gen_asc_list m n
 | (m > n) = []
 | (m == n) = [m]
 | (m < n) = m : gen_asc_list (m + 1) n


 -- Generate list from m to n 
 -- Tail recursive by accumulation
gen_list_tail :: (Ord a, Num a) => a -> a -> [a]
gen_list_tail m n = aux m n []
    where
        aux val max l
            |  val == max = (val:l)
            |  val >= max = l
            |  val <= max = aux (val) (max-1) (max:l)

--Funcitions on lists
-- Head - gives first element of list
-- Tail - gives all but first element of list
-- Length 
-- init - gives you all but last element

--List comprehension
-- [operation with variable | variable <- list] => new list
--  [(3*x, y) | x <- gen_list_tail 1 10, y <- ["a", "b", "c"]]


--Sum of list non tail recursive
sum_rec:: [Int] -> Int
sum_rec [] = 0
sum_rec (x:xs) = x + sum_rec xs

--Sum of list tail recursive
-- Using accumualtor

sum_t_r:: [Int] -> Int
sum_t_r input = aux input 0
    where 
    aux l acc
        | null(l) = acc  --We match the empty list to avoid tail and head errors
        | otherwise = aux (tail l) (acc+head(l))



--Evens in a list

main:: IO()
main = print(sum_t_r ([]))