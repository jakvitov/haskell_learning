import Control.Exception (assert)
import GHC.Types (RuntimeRep(Int16Rep))
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

-- Third exercise Lagrange
-- Given set of coordinates [(x_i, y_i)] return a lagrange polynomial interpolation L(x)
--L(x) = \sum_{j=0}^{k}(y_j) l_j(x)

get_indexed:: [(Float, Float)] -> [(Int, (Float, Float))]
get_indexed lst = zip [1..length(lst)] lst

--Lagrange polynomial interpolation
lagrange::[(Float, Float)] -> Float -> Float
lagrange coords x = foldl (\acc (i, (xi, yi)) -> acc + (yi * (lagr_basis_polynomial i x xi coords))) 0.0 (get_indexed coords)
--lagrange coords x  = foldl (\acc (j, (xj,yj)) -> yj*lagr_basis_polynomial(j,x,xj, coords)) 0 get_indexed(coords)

-- Lagrange basis polynomial
lagr_basis_polynomial:: Int -> Float -> Float -> [(Float, Float)] -> Float
lagr_basis_polynomial j x xj coords= foldl (\acc (index, (cx, _)) -> if index /= j then acc * ((x-cx) / (xj-cx)) else acc
     ) 1.0 (get_indexed coords)

--Can be simplifed by where instead of new function call to lagr_basis_polynomial as in solutions
-- This function call is quite unpleasant but gives opportunity to reuse the basis polynomial calculations

test_lagrange::IO()
test_lagrange = do
    let inpt = [(x, sqrt(x)) | x <- [1..10]]
    let inpt2 = [(1.0, 1.0), (2.0, 4.0), (3.0, 9.0)]
    assert (lagrange inpt 2 /= 1) (print("Passed first test"))
    assert (lagrange inpt2 5 == 25.0) print("Passed second test")
    print("Passed all lagrange tests.")

main::IO()
main = do
    test_rev
    test_revl
    test_prefixes
    test_lagrange
