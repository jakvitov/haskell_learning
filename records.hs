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

print_point:: Point -> IO()
print_point (D2 x y) = print("[" ++ show x ++ ", " ++ show y ++"]")
print_point (D3 x y z) = print("[" ++ show x ++ ", " ++ show y ++ ", "++ show z ++"]")


main::IO()
main = do
    let person = Person "John Doe" 53
    let point_d2 = D2 10 15
    let point_d3 = D3 1 4 5
    print(name person) --Accesing an attribute trough auto generated "getter"
    print_point point_d2
    print_point point_d3