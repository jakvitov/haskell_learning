import Control.Exception (assert)

--Implementation of Linked List to practise data classes
data LinkedList a = End | Node a (LinkedList a)

empty :: LinkedList a
empty = End

from_list:: [a] -> LinkedList a
from_list [] = End
from_list (x:xs) = Node x $ from_list xs

to_list:: LinkedList a -> [a]
to_list End = []
to_list (Node x rest) = x:to_list(rest)

length_ll:: LinkedList a -> Int
length_ll End = 0
length_ll (Node x xs) = 1 + length_ll(xs)

print_ll:: Show a => LinkedList a -> IO()
print_ll = print . to_list

prepend:: a -> LinkedList a -> LinkedList a
prepend x lst = Node x lst

test_length_ll::IO()
test_length_ll = do
    let lst1 = Node "a" $ Node "b" $ Node "c" $ End
    print("Running length_ll tests.")
    assert (length_ll lst1 == 3) (print("First passed"))
    assert (length_ll End == 0) (print("Second passed"))
    assert (length_ll (Node "a" $ End) == 1) (print("Third passed"))


test_from_list::IO()
test_from_list = do 
    let empty_list = from_list []
    print()

main::IO()
main = do
    test_length_ll
