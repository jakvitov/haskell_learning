
--Datatypes
-- data Name = 
--      Constructor1 <args> | Constructor 2 <args> | ...

data Color = 
    Red | Orange | Green | Blue | Yellow

data Calculation =
    Add Int Int | Sub Int Int

--We pattern match the constructor
calc:: Calculation -> Int
calc (Add x y) = x+y
calc (Sub x y) = x-y

--Recursive datatypes
--Tree is a data type Tree of a`s
data Tree a = Leaf | Node (Tree a) a (Tree a)

--Tree of type int
tree:: Tree Int
tree = Node(Node Leaf 1 Leaf) 2 (Node(Node Leaf 3 Leaf) 4 Leaf)

 
--Simpler recursive type
data PeaNum = Succ PeaNum | Zero

incr:: PeaNum -> PeaNum
incr = Succ

decr:: PeaNum -> PeaNum
decr (Succ n) = n


main::IO()
main = print()