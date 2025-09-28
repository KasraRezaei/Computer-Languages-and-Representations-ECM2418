list = [1,2,3,4,5,6,7,8]

keep :: Int -> [Int] -> [Int]
keep n[] = []

keep n (x:xs)
    |n == 0 =[]
    |otherwise = x : keep (n-1) xs
main = print(keep 3 list)