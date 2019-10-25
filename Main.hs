import Calculus
import Graph

import Graphics.Gloss

main :: IO ()
main = display FullScreen white $ scale 40 40 $ pictures [
            color black $ Line [(0, -10), (0, 10)],
            color black $ Line [(-10, 0), (10, 0)],
            color blue  $ graph f   (-10, 10, -10, 10) 0.1,
            color green $ graph f'  (-10, 10, -10, 10) 0.1,
            color red   $ graph f'' (-10, 10, -10, 10) 0.1,
            color blue  $ graph g   (-10, 10, -10, 10) 0.1,
            color green $ graph g'  (-10, 10, -10, 10) 0.1,
            color red   $ graph g'' (-10, 10, -10, 10) 0.1
        ]
    where
        f :: (Double -> Double)
        f = sin
        f' = derivative f
        f'' = derivative f'

        g :: (Rational -> Rational)
        g x = 0.5 * x * x
        g' = derivative g
        g'' = derivative g'
