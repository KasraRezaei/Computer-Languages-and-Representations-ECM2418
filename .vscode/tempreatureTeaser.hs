--Sunday Times Teaser 3155 of 12th March 2023, Increasing
--Temperature by Victor Bryant was as follows.
--I have written down an above-freezing temperature, a
--whole number of degrees Celsius, in which the digits are
--all different and are in decreasing order. I have then cal-
--culated the Fahrenheit equivalent. It is also a whole num-
--ber whose digits are all different, but here the digits are in
--increasing order.
--If I told you the first digit of the Celsius temperature, then
--you would not be able to calculate the temperature. How-
--ever, bearing that in mind, if I now told you the final digit
--of the Celsius temperature, then it would be possible to
--calculate it.




import Data.List

increasing :: Ord a => [a] -> Bool
increasing (x1:x2:xs)
    | x1 < x2 = increasing (x2:xs)
    | otherwise = False
increasing [x]
    = True

decreasing :: Ord a => [a] -> Bool
--avoid copying by using the previous function
decreasing
    = increasing.reverse

--teaser dosen't say the range of temp
generator :: [Int]
generator
    = [1..10000]

--The second part of our program for this Teaser is a selector,
-- which may be used to filter items that are solutions to the
-- problem. Each filtered item is a tuple of numbers, such that
-- constraints 1, 2 and 3 are satisfied.

selector :: Int -> Bool
selector c
    = exact f
    && different cs && decreasing cs
    && different fs && decreasing fs
    where
    f  = ctof (fromIntegral c)
    cs = digits c
    fs = digits (round f)

--decise if a number is exact, floor of a number
exact :: RealFrac a => a -> Bool
exact x
    = floor x == ceiling x 

ctof :: Float -> Float
ctof c
  = 9/5 * c + 32

digits :: Int -> [Int]
digits n
  | n < 10    = [n]
  | otherwise = digits (n `div` 10) ++ [n `mod` 10]
-- different

different :: Eq a => [a] -> Bool
different [] 
    = True
different (x:xs)
    | x `elem` xs = False
    | otherwise = different xs

-- importing library 
-- remove the dublicate and there is no diffrenet and no recursion needed
different1 :: Eq a => [a] -> Bool
different1 xs
    = xs == nub xs

main :: IO ()
main
  = print ((filter selector generator))