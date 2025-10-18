-- Sunday Times Teaser 3209 of 23rd March 2024, All in Order,
-- by Victor Bryant, was as follows.
-- Audley’s age is a two-figure number. He has that num-
-- ber of cards and on them he has spelt out the consecu-
-- tive numbers from one up to and including his age (“one”,
-- “two”, etc) with one number on each card. Then he has
-- arranged the cards in a row in alphabetical order. It turns
-- out that two of the cards are in the “correct” place, ie. the
-- same place as if he had arranged the cards in numerical
-- order.
-- If he had done all this a year ago, of if he repeated this
-- whole exercise in a year’s time, there would be no card in
-- the correct place.
-- How old is he?

-- converts integers into strings

spell :: Int -> String
spell n
  | t == 0    = units u
  | t == 1    = teens u
  | u == 0 u ]    = tens t
  | otherwise = foldr (++) [] [ tens t , "-" , units
    u] -- better option is to geting result of tens and units and joining them with - in the midel -> replace folder (++) [] with concat 
    where (t , u ) = n ‘ divMod ‘ 10


units 0 = " zero "
units 1 = " one "
units 2 = " two "
units 3 = " three "
units 4 = " four "
units 5 = " five "
units 6 = " six "
units 7 = " seven "
units 8 = " eight "
units 9 = " nine "

teens 0 = " ten "
teens 1 = " eleven "
teens 2 = " twelve "
teens 3 = " thirteen "
teens 4 = " fourteen "
teens 5 = " fifteen "
teens 6 = " sixteen "
teens 7 = " seventeen "
teens 8 = " eighteen "
teens 9 = " nineteen "

tens 2 = " twenty "
tens 3 = " thirty "
tens 4 = " forty "
tens 5 = " fifty "
tens 6 = " sixty "
tens 7 = " seventy "
tens 8 = " eighty "
tens 9 = " ninety "


-- generator ages between 10 and 99
-- The first part of our program for this teaser is the generator,
-- which is used to return a list of items that might provide
-- solutions to the problem. Each item is a number, N , such that
-- constraint 1 on the range of N is satisfied.

generator :: [ Int ]
generator
  = [10..99]

-- Selector
-- The second part of our program for this teaser is a selector,
-- which is used to filter items that do provide solutions to the
-- problem. Each filtered item is a number, N , such that
-- constraints 2, 3 and 4 on the value of N are satisfied.
selector :: Int -> Bool
selector n
  = map sames [n -1 , n , n +1] == [0 ,2 ,0]

sames :: Int -> Int
sames n
  = length ( filter ( True ==) ( map2 (==) ns as ) ) --mapp same place word into True and not same into a false
  where
  ns = map spell [1.. n ]
  as = sort ns

--higher order function
map2 :: ( a -> b -> c ) -> [ a ] -> [ b ] -> [ c ] -- go as far as the shortest list
map2 f ( a : as ) ( b : bs )
  = f a b : map2 f as bs
map2 f as []
  = []
map2 f [] bs
  = []

main :: IO ()
main
  = print ( head ( filter selector generator ) )

--The result of this program is 87.
