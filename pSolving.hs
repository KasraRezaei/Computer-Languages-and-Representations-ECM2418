-- At Teaser Tor trig. point I found a geocaching box. The
-- three-figure compass bearings (bearing 000 = north, 090
-- = east, etc.) from there to the church spires at Ayton,
-- Beeton and Seaton were needed to decode the clue to
-- the next location.
-- Each spire lay in a different compass quadrant (eg. 000 to
-- 090 [sic] is the North-East quadrant). Curiously, each of
-- the numerals 1 to 9 occurred in these bearings and none
-- of the bearings were prime values.
-- Given the above, if you chose one village at random to
-- be told only its church spire’s bearing, it might be that you
-- could not calculate the other two bearings with certainty,
-- but it would be more likely that you could.
-- Give the three bearings in ascending order.

generator :: [[[ Int ]]]
generator
    = [ [[1 , x2 , x1 ] ,[2 , y2 , y1 ] ,[3 , z2 , z1 ]]
    | x2 <- [4..7]
    , x1 <- [4..9] , x1 ‘ notElem ‘ [ x2 ]
    , y2 <- [4..6] , y2 ‘ notElem ‘ [ x2 , x1 ]
    , y1 <- [4..9] , y1 ‘ notElem ‘ [ x2 , x1 , y2 ]
    , z2 <- [4..5] , z2 ‘ notElem ‘ [ x2 , x1 , y2 , y1 ]
    , z1 <- [4..9] , z1 ‘ notElem ‘ [ x2 , x1 , y2 , y1 , z2
    ]
    ]
