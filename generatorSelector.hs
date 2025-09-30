-- Sunday Times Teaser 3274 of 22nd June 2025, Anarithm by Colin Vout, was as follows.
-- If you rearrange the letters of a word to form another word, it’s called an anagram.
-- So I think that if you rearrange the digits of a number to form another number, it
-- could be called an anarithm.
-- Some decimal numbers when expressed in two number bases have representations
-- that are anarithms of each other. For instance, the decimal number 66 is 123 in
-- base 7 and 231 in base 5.
-- I’ve recently been looking at numbers in base 8 and base 5 and found that it is
-- possible to have a decimal number whose representations in base 8 and base 5 are
-- anarithms of each other.
-- In decimal notation, what is the largest such number?





base5 :: Int -> [Int]
base5 n
    | n<5 = [n]
    | otherwise = base5(n `div` 5) ++ [n `mod` 5]

base8 :: Int -> [Int]
base8 n
    | n < 8 = [n]
    | otherwise = base8(n `div` 8) ++ [n `mod` 8]

generator :: [Int]
generator = [512..624]
selector :: Int -> Bool
selector n = equalset (base5 n) (base8 n)

equalset :: [Int] -> [Int] -> Bool
equalset as bs
    = isort as == isort bs

-- insertion sort(custome made)
-- insert elements into an orderd list
insert :: Int -> [Int] -> [Int]
insert e []
    = [e]
insert e (x:xs)
    | e < x = e : x : xs
    | otherwise = x : insert e xs

isort :: [Int] -> [Int]
isort [] = []
isort (x : xs) = insert x (isort xs)

main :: IO()
main = print(head(filter selector generator))