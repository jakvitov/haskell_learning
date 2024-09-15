-- WHAT A HECK IS A MONAD?!
-- ... monad is a monoid in the realm of endofunctors... as easy as that :D 
-- In mathematical terms it is actually very descriptive, but my knowledge of the cathegory theory is too poor to analyze it fully 

--class Applicative m => Monad m where
--  (>>=) :: m a -> (a -> m b) -> m b  --Also called bind
--  (>>) :: m a -> m b -> m b
--  return :: a -> m a
--  {-# MINIMAL (>>=) #-}  Okay, so just typeclass, that has instance of >== can be called a Haskell monad?! 
--  	-- Defined in ‘GHC.Internal.Base’

-- Monad bind 
-- (>>=) :: Monad m a -> (a -> m b) -> m b
-- Given a Monad of type a and function, that takes a as argument and returns Monad of type b, bind internal value of Monad a to given function

toStringMaybe:: Maybe Int -> Maybe String 
toStringMaybe intmaybe = intmaybe >>= (\x -> Just $ show x) --We need to return monad of the same type, Maybe must return another Maybe 

maybeAdd:: Num b => b -> Maybe b -> Maybe b
maybeAdd val maybeVal = maybeVal >>= (\x -> Just $ x + val) --Thanks to Mabye >>= implementation, when Maybe b = Nothing, then all expressions evaluate to Nothing

--Just messing around with bind operator
addMaybes:: Num b => Maybe b -> Maybe b -> Maybe b 
addMaybes a b = a >>= (\x -> b >>= (\y -> Just $ x + y))

--Return function 
-- return :: a -> m a
-- Given a value of type a, return a monad of type a with the given value (wrap value in monad)

--Now we can rewrite 
addNumMonads::(Monad m, Num b) => m b -> m b -> m b --Much more general approach, since m is inferred as Monad
addNumMonads a b = a >>= (\x -> b >>= (\y -> return $ x + y))
--We can use this on any monad with internal Num type, so even IO b or Either b
--But as we add arguments, this becomes >>= hell

-- Alternative:

-- m >>= (\x -> ....)

-- do
-- x <- m (unwrapping the monad), faulty state will be propagated trough the do block
-- The .... is rest of the do block
-- Is do just one large >>= operator chain?

--Rewriting to do block
--Equivalence, but more readability and easier chaining of bind operations
addNumMonads2::(Monad m, Num b) => m b -> m b -> m b
addNumMonads2 a b = do
    x <- a
    y <- b
    return $ x + y

-- This way, we can handle side effects in pure functions (held by monads)

-- Fail function
-- Often not implemented
-- fail:: Monad m => String -> m a
-- Dangerous sometimes, since some monads just call Error and end the program

doubleNumOrFail :: Num a => Maybe a -> Maybe a
doubleNumOrFail (Just x) = Just $ 2*x
doubleNumOrFail (Nothing) = fail "Value not present"
--Maybe fail implementation returns nothing

-- Function >> sometimes called anonymous bind
-- (>>) :: m a -> m b -> m b

--Deafult implementation:
-- m >> n = m >>= (\_ -> n)
-- We bind m to lamda, which drops the wrapped value
-- NOTE: If m has implemented bind, that automatically propagates Failiures, then we do not get n but still m
-- Sucesses do not propagate, but failiures do , depends on the implementation of bind operator

anonymousBind:: Maybe a -> Maybe b -> Maybe b
anonymousBind x y = x >> y 

--Monad laws

-- Left identity
-- return a >>= k = k a
-- returning monad with value a and binding it to function k, should be the same as applying function k to a  
-- For example Just 5 >>= (\x -> Just $ x+1)  ==  (\x -> Just $ x+1) 5

-- Right identity
-- m >>= return = m
-- monad, bound to its return function, must return the monadic value 
-- Monad, boudn to encapsulation is the same

-- Associativity
-- Associativity of the bind function
-- m >>= (\x -> k x >>= h)  ==  (m >>= k) >>= h 
-- It is irelevant, where we put the parenthesis for the bind operations

doSth :: Num a => p1 -> p2 -> Maybe a
doSth a = (\x -> Just 5)

main:: IO()
main = do 
    print $ maybeAdd 10 (Nothing)
    print $ maybeAdd 10 (Just 20)
    print $ addMaybes (Just 20) (Just 30)
    print $ addMaybes (Just 5) (Nothing) --Again all binds with Nothing on Maybe monad return Nothing
    print $ addNumMonads (Just 50) (Just 100)
    print $ addNumMonads (Right 100) (Left 500) --Propages the Left value (error), cannot add two rights, since there is no inferrence on type Left b
    print $ doubleNumOrFail (Just 20)
    print $ doubleNumOrFail (Nothing)
    print $ anonymousBind (Nothing) (Just 10) -- Should propagate nothing
    print $ anonymousBind (Just 50) (Just 10) -- Should return Just 10
