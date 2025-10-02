number :: [ Int ] -> Int
number xs = totalize ( reverse xs )
    where
    totalize []
        = 0
    totalize ( x : xs )
        = x + 10 * totalize xs