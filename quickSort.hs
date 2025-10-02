--set a partishener at first then find less than and morthan and add themto two lsit

quicksort :: [Int] -> [Int]
quicksort (x:xs) = quicksort [u| u <- xs, u<x] ++ [x] ++ quicksort [u | u <- xs, u >= x]
quicksort [] = []


main :: IO ()
main = print (quicksort [7,5,8,3,9]) 