base8 :: Int -> [Int]
base8 n
    | n < 8 = [n]
    | otherwise = base8(n `div` 8) ++ [n `mod` 8]

main :: IO()
main 
    = print(base8 647)

