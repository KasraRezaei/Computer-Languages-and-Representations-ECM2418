insert :: a -> Int -> [a] -> [a]
-- insert a into position b in list c
insert a _ [] = [a]
insert a 0 xs = a:xs
insert a b (x:xs) = x : insert a (b-1) xs

main = print(insert "b" 2 ["1", "3"])