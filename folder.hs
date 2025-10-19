folder :: ( a -> b -> b ) -> b -> [ a ] -> b -- simple version (a ->(b ->(b))) -> b (an initial accumulator) -> [a] (input list) -> b (result)
-- a function that takes three arguments (because there are 3 arrows before the final b) 
-- (a ->(b ->(b))) a combining function as whole 
folder f z []
  = z
folder f z ( x : xs )
  = f x ( folder f z xs )

main:: IO ()
main = print( folder (*) 1 [1,2,3] )