module Main where
import Data.Typeable

--Currying - decomposition of function call
-- Before f:: a -> b-> c-> d 
-- After f:: a -> (b -> (c -> d)), always one argument and returning next one argument function

add::Int -> Int -> Int
add x y = x + y

add_currying :: Num a => a -> (a -> a)
add_currying x = (\y -> x+y)

add_currying2:: Num a =>  a -> (a -> a)
add_currying2 = (\x -> (\y -> x+y))

--Calling add_currying2 with only one argument is valid, since it is a function, that takes one argument
--BUT we get another function as a result (\y -> arg + y)
--We call the function only partially

--for example let doubleList map (\x -> 2*x) is partial function, since we do not give it explicit arguments
-- Variable doubleList is anonymous function partially applied to map


main::IO()
main = do
    print(add_currying 10 20)
    print(add_currying2 10 20)
    