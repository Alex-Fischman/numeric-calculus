module Graph (graph) where

import Graphics.Gloss
import Data.List.Split
import Control.Arrow

graph :: (Real i, Real j) => (i -> j) -> (i, i, j, j) -> i -> Picture
graph f (x0, x1, y0, y1) dx = pictures $ map Line floats
    where
        points   = [(x, f x) | x <- takeWhile (<x1) $ iterate (+dx) x0]
        segments = split (whenElt $ not . visible) points
            where visible (_, y) = (y0 <= y) && (y <= y1)
        floats   = map (map $ realToFrac *** realToFrac) segments
