import Control.Exception (assert)
-- Rev function
-- Create a rev function that reverses a list using folding

--Variant with foldr
rev::[Int] -> [Int]
rev list = foldr (\x acc -> acc ++ [x]) [] list

--Variant with foldl
revl::[Int] -> [Int]
revl list = foldl(\acc x -> x:acc) [] list

test_rev::IO()
test_rev = do
    assert((rev [1,2,3,4,5]) == [5,4,3,2,1]) (print("First passed."))
    assert((rev [1]) == [1]) (print("Second passed."))
    assert(null (rev [])) (print("Third passed. passed."))

test_revl::IO()
test_revl = do
    assert((revl [1,2,3,4,5]) == [5,4,3,2,1]) (print("First passed."))
    assert((revl [1]) == [1]) (print("Second passed."))
    assert(null (revl [])) (print("Third passed. passed."))

main::IO()
main = do 
    test_rev
    test_revl
    