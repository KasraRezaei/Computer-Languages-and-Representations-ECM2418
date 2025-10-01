factorisable :: Int -> Int -> [Int]
factorisable n f
    | n<f = []
    | n `mod` f == 0 = f : factorisable n (f+1)
    | otherwise = factorisable n (f+1)

main :: IO()
main = print(factorisable 314159 1)