module Calculus (limit, derivative, integral) where

integral :: (Fractional a, Eq a, Enum a) => (a -> a) -> a -> a -> a
integral f a b = limit (\dx -> (*) dx $ sum $ map f [a,a+dx..b]) 0

derivative :: (Fractional a, Eq a) => (a -> a) -> a -> a
derivative f x = limit (\dx -> (f (x+dx) - f x) / dx) 0

limit :: (Fractional a, Fractional b, Eq b) => (a -> b) -> a -> b
limit f x = (leftLimit + rightLimit) / 2
    where
        leftLimit  = shanks (f . (x-) . (10^^) . negate) (1::Int)
        rightLimit = shanks (f . (x+) . (10^^) . negate) (1::Int)

        shanks g n = g (n + 2) - numer / (if denom == 0 then 1 else denom)
            where
                numer = (g (n+1) - g n) ^ (2::Int)
                denom = (g (n+2) - g (n+1)) - (g (n+1) - g n)
