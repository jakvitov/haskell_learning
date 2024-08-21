module Main where

--Folding
--One of the most important operations!!!
--foldr:: (a -> b -> b) -> b -> [a] -> b 
--Wtf is that signature??
--One binary operation, starting value and list, returns starting value
--b is different type 

--Applies given function on all elements of a and b and returns them as one b 
--(result of chaining argument function) 

--Usage of foldr
--foldr (\elem acc -> <term>) <start_acc> <list>

sum2::Int -> Int
sum2 n = foldr (+) 0 [0..n] 

countTrues :: (Foldable t, Num b) => t Bool -> b
countTrues inputList = foldr(\elem acc -> if elem == True then (acc+1) else acc) 0 inputList

--foldl 
--folds left, switch arguments in signature


main::IO()
main = print(sum2 10)