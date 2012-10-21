import Control.Parallel
import System.Environment
import System.IO

fact :: Integer -> Integer -> Integer
fact m n = product [m..n]

factp n = a `par` b `par` c `par` d `par` e `par` f `par` g `par` h `pseq` (a * b * c * d * e * g * h)
	where
		a = fact 1 (n `div` 2)
		b = fact (n `div` 2 + 1) (3 * n `div` 4)
		c = fact (3 * n `div` 4 + 1) (7 * n `div` 8)
		d = fact (7 * n `div` 8 + 1) (15 * n `div` 16)
		e = fact (15 * n `div` 16 + 1) (31 * n `div` 32)
		f = fact (31 * n `div` 32 + 1) (63 * n `div` 64)
		g = fact (63 * n `div` 64 + 1) (127 * n `div` 128)
		h = fact (127 * n `div` 128 + 1) n

main = do
	args <- getArgs
	print $ factp (read (head args) :: Integer)
