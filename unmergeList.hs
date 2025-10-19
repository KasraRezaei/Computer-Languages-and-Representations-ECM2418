unmerge:: [(Int,Char)] -> ([Int], [Char])
unmerge [ ]= ([], [])
unmerge ((a,b): abs) = (a:as, b:bs)
    where
        (as,bs) = unmerge abs

main:: IO ()
main = print( unmerge [(1,'a'), (2,'b'), (3,'c')] )