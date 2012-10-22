-- This is for random functions on lists that I cannot find or I just felt like implementing (Work in progress, hope to add one a week)

import Data.List

merge :: (Ord a) => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge xs@(x:xs') ys@(y:ys') = if x < y then x : merge xs' ys else y : merge xs ys'

groupByQuantity :: Int -> [a] -> [[a]]
groupByQuantity _ [] = []
groupByQuantity i xs = take i xs : groupByQuantity i (drop i xs)

--O(n) algorithm for selection, note: you might want to optimize partition so that it deletes one occurance of mm, therefore you would need only one pass
select :: (Ord a) => Int -> [a] -> a
select k xs
    | length xs <= 5   = sort xs !! k
    | otherwise        = let mm = getMedianOfMedians xs 
                            in let ys = partition (< mm) xs 
                                in let size = length $ fst ys
                                    in if size == k then mm else if size < k then select (k - size - 1) (delete mm $ snd ys) else select k (fst ys)

--Helper for select, splits into groups of 5 and returns the medians of those groups
getMedianOfMedians :: (Ord a) => [a] -> a
getMedianOfMedians xs 
    = let ys = groupByQuantity 5 xs 
        in let lys = last ys
            in let y = sort lys !! (length lys `div` 2)
                in let zs = foldr (\x acc -> sort x !! 2 : acc) [y] $ init ys 
                    in select (length zs `div` 2) zs

--To come: Merge k sorted lists in O(n log k)
