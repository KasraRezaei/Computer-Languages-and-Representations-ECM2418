count :: [Int] -> Int
count[]=0
count (x:xs) = 1 + count xs
list = [1,2,3,4,5,6,7,8]
main = print(count list)