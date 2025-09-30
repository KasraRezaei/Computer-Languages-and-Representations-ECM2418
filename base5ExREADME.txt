Step-by-step trace for base5 512

Call: base5 512
512 < 5? No → use otherwise branch.
512 \div` 5 = 102, 512 `mod` 5 = 2 →base5 512 = base5 102 ++ [2]`
Call: base5 102
102 < 5? No.
102 \div` 5 = 20, 102 `mod` 5 = 2 →base5 102 = base5 20 ++ [2]`
Call: base5 20
20 < 5? No.
20 \div` 5 = 4, 20 `mod` 5 = 0 →base5 20 = base5 4 ++ [0]`
Call: base5 4
4 < 5? Yes → return [4].

Unwind and concatenate:
base5 20 = [4] ++ [0] = [4,0]
base5 102 = [4,0] ++ [2] = [4,0,2]
base5 512 = [4,0,2] ++ [2] = [4,0,2,2]
So base5 512 = [4,0,2,2]. (Digits: 4·5³ + 0·5² + 2·5 + 2 = 512.)