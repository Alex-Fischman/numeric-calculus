module Calculus (limit, derivative, integral) where

integral :: (Fractional a, Eq a, Enum a) => (a -> a) -> a -> a -> a -> a
integral f a b c = c + limit (\dx -> (*2) . (*dx) . sum . map f $ [a,a+dx..b]) 0

derivative :: (Fractional a, Eq a) => (a -> a) -> a -> a
derivative f x = limit (\dx -> (f (x+dx) - f x) / dx) 0

limit :: (Fractional a, Fractional b, Eq b) => (a -> b) -> a -> b
limit f x = (/2) . sum . map f $ [x-e, x+e]
    where e = 1e-3
