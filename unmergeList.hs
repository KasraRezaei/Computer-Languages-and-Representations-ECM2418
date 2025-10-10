unmerge:: [(Int,char)] -> ([Int], [Char])
unmerge ((a,b): abs) = (a:as, b:bs)
    where
        (as,bs) = unmerge abs
        unmerge [l= ([], [])]