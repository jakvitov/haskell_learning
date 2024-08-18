module Main where
import qualified Data.List as Data

import Data.List
import Data.Char

--Higher order function:
--Function, that does take another function as an argument
--In signature ::(a -> b), means a function that takes a and returns b
--Example hof::(Int -> Int) -> Int -> Int

--Takes function a->b and a, returns b
--Just simple apply
my_apply::(a -> b) -> a -> b
my_apply f a = f a

twice::Int -> Int
twice a = 2*a

--Anonymous functions
--Function without a name (just like lambdas?)
--(\args -> expression)

a = (\x -> 2*x) --Function does not have a name 
--Saved in a variable a, besides that, it does not exist

--Map function
--Higher order function
--Maps list of one type to another by applying input function
-- map::(a -> b) [a] [b]

lint_to_lchar:: [Int] -> [Char]
lint_to_lchar = map (\x -> chr x)

--Fileter function
--filter:: (a -> Bool) [a] -> [a]
--Filters a according to !Predicate! - (a -> Bool)

filter_even::[Int] -> [Int]
--Anonymous predicate (\x -> (mod x 2) == 0)
filter_even a = filter (\x -> (mod x 2) == 0) a

main::IO()
main = do
    print(my_apply twice 10)
    print(a 2)
    print((\x y -> x + y) 10 20)

    let a = [10, 20,30,40,50,60]
    let b = map (\x -> chr x) a
    print(b)

    print(filter_even [2,4,5,7,0,11,16,22])

