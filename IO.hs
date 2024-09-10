import GHC.IO (unsafePerformIO)

--IO input output (finallyyyyy yayyy)

--putStrLn print to the output 
result :: IO () --Function to print to std has result
result = putStrLn "yayyy"       --Result of IO operation is empty tuple 
                                --The () signalizes empty tuple, that holds nothing

-- IO
-- The result is of type IO
-- It has no usable return type (), but it interacts with the environment
-- It cannot have return type other than (), because of purity of functions

-- getLine:: IO String

get_input::IO()    --This is not function application BUT IO() ACTION
get_input = do     
    putStrLn "Type your name"
    name <- getLine -- <- operator works only in IO actions and helps us to unwrap the String from the IO monad
    let greet = "Hello "    --Let bindings are still lazily evaluated in do blocks
    putStrLn (greet ++ name)
    --Awwwwwww, it feels like magic 


-- Is there a function to unwrap the IO as a function
-- unsafePerformIO::IO a -> a

get_input_string::String
get_input_string = unsafePerformIO getLine --NEVER DO THIS :D UNLESS UNAVOIDABLE

main::IO()  --Main is also a IO action just as putStrLn
main = do 
    putStrLn("Input one char!")
    input <- getLine
    if length input > 1 then main else return () --Return statement from a do block
    --We return () because we are in IO() action

