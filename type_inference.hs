--Type inference
-- Infering THE MOST GENERAL type for an expression

--Algorithm
-- 1 Assign every variable unique typevariable
-- 2 Every function is assigned its types with unique typevariables (1)
-- 3 For each subexpression of the expression, gnerate equations of types (what types do equal)
-- Resolve equations, until no further simplifications can be done. If we find conflict, type error


--Simple example
add x y z = (x + y) : z

-- 1. x = a , y = b , z = c ; a,b,c are uniqe type variables

--2. Assign functions unique type variables:
-- (+) :: Num d => d -> d -> d
-- (:) :: e -> [e] -> [e]
-- We assigned functions unique type variables (Num d, e)

-- 3. For each subexpression, generate type equations
-- (x + y) -> a = d, b = d
-- (x + y) : z -> z = [e], d = e

-- 4. Resolve equations
-- x::d, y::d, z::[e]
-- z::[d] (d=e)
-- --> Num d => d -> d -> [d] -> [d]

-- From language server inference a -> a -> [a] -> [a] substitution (d = a) and we are correct!

-- Type inference of partial function application

--Sort list and revert it
f = reverse . sort

-- 1., 2.
-- Reverse:: [a] -> [a]
-- Sort:: Ord e => [e] -> [e]
-- (.) :: (c -> d) -> (b -> c) -> b -> d

--3. (.) --> c = [a], d = [a], b = [e], c = [e] (All from the function composition)

--4. Simplify c = [a] && c = [e] => [a] = [e] => a = e

-- f:: Ord => [a] -> [a]

-- Type inference with type error
g x = x:x

-- x = a
-- (:) :: b -> [b] -> [b] -> x = [b]

-- Simplify 
-- From (x:x) a = [b]
-- [b] = a, a = b CONFLICT!! -> b = [b] Infinite recursion type inference error 


main::IO()
main = print()