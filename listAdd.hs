list = [1,2,3,4,5]

-- Insert ::Int -> Int -> [Int] -> [Int]

-- Insert n [] = []
-- 2ndList = []

append :: [Int] -> [Int] -> [Int]
append (x:xs) ys = x : append ys xs
append [] ys = ys
main = print(append list [10,11])