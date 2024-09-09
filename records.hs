-- data Person = Person String Int  
-- No knowledge, what should come in as the String of this data type
--Solution -> Records

-- Records
-- Contain named parameters and auto generated getters

data Person = Person {
    name::String,   --Now we know, what that String means
    age::Int
}

data Point = D2 {x::Int, y::Int} | D3 {x::Int, y::Int, z::Int}  --Alternative constructors

--Defining a function with record is the same as data type
print_point:: Point -> IO()
print_point (D2 x y) = print("[" ++ show x ++ ", " ++ show y ++"]") -- Accessing values like with normal data types
print_point (D3 a b c) = print("[" ++ show a ++ ", " ++ show b ++ ", "++ show c ++"]")
            --Only order of these elements is relevant, not names

main::IO()
main = do
    let person = Person "John Doe" 53
    let point_d2 = D2 10 15
    let point_d3 = D3 1 4 5
    print(name person) --Accesing an attribute trough auto generated "getter"
    print_point point_d2
    print_point point_d3