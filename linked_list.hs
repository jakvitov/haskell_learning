
--Implementation of Linked List to practise data classes
data LinkedList a = End | Node a (LinkedList a)

empty :: LinkedList a
empty = End

from_list:: [Int] -> LinkedList
from_list [] = End
from_list (x:xs) = Node x $ from_list xs

to_list:: LinkedList a -> [Int]
to_list End = []
to_list (Node x rest) = x:to_list(rest)

print_ll:: LinkedList a -> IO()
print_ll = print . to_list

prepend:: Int -> LinkedList a -> LinkedList a
prepend x  lst = Node x lst



main::IO()
main = do
    let testLst = [1..10]
    let ll = (from_list testLst)
    print_ll(prepend 33 ll)
