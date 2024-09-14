import Data.Maybe
-- Mabye datatype 
-- Maybe a = Just a | Notning
-- Way of representing if value is not present

divide:: (Integral a) => a -> a -> Maybe a
divide _ 0 = Nothing
divide a b = Just $ div a b

--fromJust:: Just a -> a
--fromJust expects value to be Just a, if it finds nothing, exception is thrown

--fromMaybe:: a -> Maybe a -> a
-- safer than fromJust, because we provide default value from the first argument
-- if just is present, it unpacks it, else it returns default value

main::IO()
main = do
    print(divide 10 0)
    print(divide 10 2)

    let b = fromJust $ divide 10 2
    let c = fromJust $ divide 10 0
    let d = fromMaybe 20 (divide 10 0)

    print(b)
    -- print(c) -> Exception, since we did fromJust on Maybe Nothing
    print(d) --Prints default value of 20
    