module Main where

--Recursion lesson
factorial:: Integer -> Integer
factorial n
    | (n <= 1) = 1
    | otherwise = n * factorial(n - 1) -- Recurseive call being multiplied

factorial_tail_rec n = aux n 1
    where 
    aux n acc
        | (n <= 1) = acc -- We accumulate the value here till the recursion ends
        | otherwise = aux (n-1) (n* acc)

-- fac 10 = aux 10 1
-- aux 10 1 = aux (9) (10*1)
-- aux 9 10 = aux (8) (9 * 10)
--Tail recursive - no computation left after recursive call

is_zero 1 = 0
is_zero _ = 1

main :: IO ()
main = print(factorial_tail_rec 20) 