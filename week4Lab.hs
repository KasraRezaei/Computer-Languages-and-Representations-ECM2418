import Data.List
number :: [Int] -> Int
number xs
    = totalize (reverse xs)
    where
        totalize []
            = 0
        totalize (x:xs)
            = x + 10 * totalize xs

digits :: Int -> [Int]
digits n
    | n < 10 = [n]
    | otherwise = digits d ++ [m]
        where 
            (d,m) = n `divMod` 10

ends3 :: [Int] -> Bool
ends3 xs
    = last xs == 3

starts4 :: [Int] -> Bool
starts4 xs
    = head xs == 4

palindrome :: [Int] -> Bool
palindrome xs
    = xs == reverse xs

splits :: [a] -> [([a], [a])]
splits xs
    = [splitAt n xs | n <- [0..length xs]]

generator :: [([Int], [Int])]
generator 
    = concat [splits ps | ps <- permutations[1..9]]

selector :: ([Int], [Int]) -> Bool
selector(as,bs) 
    = ends3 ms && starts4 ds && palindrome ds && palindrome es
        where -- defines the values for ms, ds, es and pass it above
            a = number as -- convert digits to numbers
            b = number bs
            ms = digits (min a b) -- finds minimum of a number and convert back to digits
            ds = digits (a * b) 
            es = digits (a + b + 100) 


main :: IO()
main = print(filter selector generator)
