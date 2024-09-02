import Control.Exception (assert)
-- Rev function
-- Create a rev function that reverses a list using folding

--Variant with foldr
rev::[Int] -> [Int]
rev list = foldr (\x acc -> acc ++ [x]) [] list

--Variant with foldl
revl::[Int] -> [Int]
revl list = foldl(\acc x -> x:acc) [] list
--Or

--Solution
--revl list = foldl(flip(:)) []
--Flip flips arguments 

--We can omit the list and it is still a valid function
--revl::[Int] -> [Int]
--revl = foldl(\acc x -> x:acc) []


test_rev::IO()
test_rev = do
    print("Testing reverse")
    assert((rev [1,2,3,4,5]) == [5,4,3,2,1]) (print("First passed."))
    assert((rev [1]) == [1]) (print("Second passed."))
    assert(null (rev [])) (print("Third passed. passed."))

test_revl::IO()
test_revl = do
    print("Testing reverse with left folding")
    assert((revl [1,2,3,4,5]) == [5,4,3,2,1]) (print("First passed."))
    assert((revl [1]) == [1]) (print("Second passed."))
    assert(null (revl [])) (print("Third passed. passed."))


--Exercise 2
-- Create a function prefixes::[x] -> [[x]] which returns all prefixes of a given list
-- [1,2,3] -> [[1],[1,2], [1,2,3]]
prefixes::[t] -> [[t]]
prefixes list = foldr (\_ acc -> take (length(list) - length(acc)) list : acc ) [] list

test_prefixes::IO()
test_prefixes = do
    print("Testing prefixed")
    assert(prefixes [1,2,3] == [[1],[1,2], [1,2,3]]) (print("First passed!"))
    assert(prefixes [1] == [[1]])  (print("Second passed."))
    assert(null $ prefixes []) (print("Third passed."))
    assert(prefixes [1..4] == [[1],[1,2],[1,2,3],[1,2,3,4]]) (print("Fourth passed."))


main::IO()
main = do  
    test_rev
    test_revl
    test_prefixes
    