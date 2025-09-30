base5 :: Int -> [Int]
base5 n
    | n<5 = [n]
    | otherwise = base5(n `div` 5) ++ [n `mod` 5]

main :: IO ()

main
    =print(base5 540)