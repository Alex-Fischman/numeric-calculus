import Calculus
import Graph

import Graphics.Gloss

main :: IO ()
main = display FullScreen white $ scale 40 40 $ pictures [
            color black  $ Line [(0, -10), (0, 10)],
            color black  $ Line [(-10, 0), (10, 0)],
            color blue   $ graph f  (-10, 10, -10, 10) 0.1,
            color green  $ graph f' (-10, 10, -10, 10) 0.1,
            color orange $ graph f_ (-10, 10, -10, 10) 0.1
        ]
    where

        f :: (Rational -> Rational)
        f x = 0.5 * x * x
        f'  = derivative f
        f_  = integral f 0
