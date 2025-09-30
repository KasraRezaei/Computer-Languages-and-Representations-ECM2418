


This Haskell program finds the first number between **512 and 624** whose base-5 and base-8 
digit representations contain exactly the same set of digits (ignoring order). 
It then prints that number.

---


### Base Conversion Functions haskell

base5 :: Int -> [Int]
base5 n
    | n < 5     = [n]
    | otherwise = base5 (n `div` 5) ++ [n `mod` 5]

Declares base5 as a function that takes an integer and returns its base-5 digits as a list.
If n < 5, return [n] (a single digit).
Otherwise, divide n by 5 recursively to peel off higher digits and append n mod 5 as the current digit.

base8 :: Int -> [Int]
base8 n
    | n < 8     = [n]
    | otherwise = base8 (n `div` 8) ++ [n `mod` 8]

Same as base5, but works for base-8 (octal).

#Generator
generator :: [Int]
generator = [512..624]
Defines a list of numbers from 512 to 624 that will be checked.

#Selector
selector :: Int -> Bool
selector n = equalset (base5 n) (base8 n)
For a given number n, computes base5 n and base8 n.
Then checks if the two lists of digits are equal when treated as sets (ignoring order).

#Comparing Digit Sets
equalset :: [Int] -> [Int] -> Bool
equalset as bs = isort as == isort bs
Takes two lists, sorts them, then compares.
This ensures only the digits matter, not their order.
Insertion Sort
insert :: Int -> [Int] -> [Int]
insert e [] = [e]
insert e (x:xs)
    | e < x     = e : x : xs
    | otherwise = x : insert e xs

isort :: [Int] -> [Int]
isort [] = []
isort (x:xs) = insert x (isort xs)
insert puts an element in the correct position of a sorted list.
isort applies insert repeatedly to build a sorted list from scratch.
Used here to sort digit lists.

#Main Program
main :: IO ()
main = print (head (filter selector generator))
filter selector generator: keeps only numbers from 512–624 whose base-5 and base-8 digits match as sets.
head: takes the first such number.
print: outputs it.
Example (n = 512)
base5 512 = [4,0,2,2]
base8 512 = [1,0,0,0]
Sorted:
Base-5 → [0,2,2,4]
Base-8 → [0,0,0,1]
Not equal → so 512 is not selected.
The program continues until it finds the first match.