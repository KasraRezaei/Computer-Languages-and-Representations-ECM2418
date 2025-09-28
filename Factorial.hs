factorial :: Integer -> Integer
factorial n
    | n==1 = 1
    | otherwise = n*factorial(n-1)
main :: IO()
main = print(factorial 7)