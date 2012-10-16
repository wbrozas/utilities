-- This is for random functions on lists that I cannot find or I just felt like implementing (Work in progress, hope to add one a week)

merge :: (Ord a) => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge xs@(x:xs') ys@(y:ys') = if x < y then x : merge xs' ys else y : merge xs ys'

groupByQuantity :: Int -> [a] -> [[a]]
groupByQuantity _ [] = []
groupByQuantity i xs = take i xs : groupByQuantity i (drop i xs)

--selectRank :: (Ord a) => Int -> [a]
--selectRank k xs = 
