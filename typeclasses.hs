
-- Typeclasses
-- (+) :: Num a => a -> a -> a
-- Num is a typeclass and "a" has to have instance of typeclass Num


--Copied from :info Num 
-- All types in this typeclass have these functions available
class Num a where
  (+) :: a -> a -> a    --All numbers can be added etc.
  (-) :: a -> a -> a
  (*) :: a -> a -> a
  negate :: a -> a
  abs :: a -> a
  signum :: a -> a

--Important typeclass
--Copied from :info show
--Being in this typeclass allows to get printed to console

{-
class Show a where
  showsPrec :: Int -> a -> ShowS
  show :: a -> String
  showList :: [a] -> ShowS
--  {-# MINIMAL showsPrec | show #-} -> We either have to implement just showsPrec or show
-- Other functions are implied!!
-- We either have to have show on our type and its ok to print it
-}

--The minimal constraint is important!!
--More examples of it:
{-
class Eq2 a where   --ORIGINALLY EQ, changed due to Ord bellow
  (==) :: a -> a -> Bool
  (/=) :: a -> a -> Bool
--  {-# MINIMAL (==) | (/=) #-} This is quite logical
-- We either implement equals and not equals is simply its negation
-- Or we implement not equals and we just negate it as well
-}

--Ordered typeclass
class Eq a => Ord a where --Instance needs to be in Eq in order to be also Ord (another constraint)
  compare :: a -> a -> Ordering
  (<) :: a -> a -> Bool
  (<=) :: a -> a -> Bool
  (>) :: a -> a -> Bool
  (>=) :: a -> a -> Bool
  max :: a -> a -> a
  min :: a -> a -> a
--  {-# MINIMAL compare | (<=) #-} --Either compare xor <= makes sense
-- We can logically derive the rest from them

--Instances

--Data type of a point, BUT we want to PRINT IT -> We need implementation of Show
data Point = Point {x::Int, y::Int}

-- Point is instance of Show by having appropriate show function
instance Show Point where
    show :: Point -> String
    show (Point x y) = "[" ++ show x ++ ", " ++ show y ++ "]" 

--Point is also instance of Eq
instance Eq Point where 
    (==) :: Point -> Point -> Bool
    (==) (Point x1 y1) (Point x2 y2) = (x1 == x2) && (y1 == y2 ) 


-- Deriving keyword
-- Does auto implementation for typeclasses 

data Rectangle = Rectangle Int Int Int Int
  deriving (Show, Eq) --We force Haskell to auto implement it
                      --Derived equivalence may not be implemented correctly

-- !! DERIVED EQUIVALENCE COMPARES THE CONSTRUCTORS !!

main::IO()
main = do
    let point = Point 40 2
    let point2 = Point 50 30  --We can normally print point
    print(point)       
    print (point == point)   --Thanks to Point being instance of Eq typeclass, we can normally compare equality
    print (point2 == point)
    
