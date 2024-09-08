import Control.Exception (assert)
import GHC.Base (IO(IO))

--Implementation of Linked List to practise data types
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

append:: a -> LinkedList a -> LinkedList a
append el End = Node el $ End 
append el (Node x lst) = Node x $ append el lst

test_length_ll::IO()
test_length_ll = do
    let lst1 = Node "a" $ Node "b" $ Node "c" $ End
    print("Running length_ll tests.")
    assert (length_ll lst1 == 3) (print("First passed"))
    assert (length_ll End == 0) (print("Second passed"))
    assert (length_ll (Node "a" $ End) == 1) (print("Third passed"))


test_from_list::IO()
test_from_list = do 
    let empty_llist = from_list []
    let llist2 = from_list [1..100]
    print("Running test from_list.")
    assert(length_ll empty_llist == 0) (print("First passed"))
    assert(length_ll llist2 == 100) (print("Second passed"))

test_to_list::IO()
test_to_list = do
    let empty_list = from_list []
    let llist2 = from_list [1..100]
    print("Running test to_list")
    assert(length (to_list empty_list) == 0)(print("First passed"))
    assert(length (to_list empty_list) == 100)(print("Second passed"))
    
test_append::IO()
test_append = do
    let llst = from_list [1..10]
    print("Running test append")
    assert (length_ll llst == 10) (print_ll llst)
    let llst2 = append 11 llst
    assert (length_ll llst2 == 11) (print_ll llst2)


main::IO()
main = do
    test_length_ll
    test_from_list
    test_append


