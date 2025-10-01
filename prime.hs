
primenumber :: Int -> Bool
primenumber n 
    | n < 2 = False
    | otherwise = not (factorisable n 2)
        where 
            factorisable n f 
                | n <= f = False
                | otherwise = mod n f == 0
                    || factorisable n(f+1)

main :: IO ()
main = print(primenumber 314159)