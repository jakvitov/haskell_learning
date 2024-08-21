module Main where

--Composition 
--We compose with the . operator
-- (.) :: (b->c) -> (a->b) -> a -> c
--Classical function composition from disrete math

add:: Int -> Int
add x = x+1  

double:: Int -> Int
double x = 2 * x

--Hell of a name 
double_add:: Int -> Int
double_add = double . add --add than double
--No argument, it is composition of functions, not function calls

--Dollar sign
--($) :: (a -> b) -> a -> b 
--Nice way of applying function, more readability

double_add2:: Int -> Int
double_add2 x = add $ double x  --Dollar helps to reduce ()

main:: IO ()
main = print(double_add2 1)