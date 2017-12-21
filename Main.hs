module Main where

import Graphics.Gloss
import BTree
import Data.List

window :: Display
window = InWindow "Nice Window" (800, 800) (10, 10)

edge = 360 :: Float

background :: Color
background = white

drawing :: Picture
drawing = Line [(0, 0), (0, 200)]

-- drawTree:: BTree -> Picture
-- drawTree bt = Pictures 

toPicturesList::BTree -> [Picture]
toPicturesList Nil = [Blank]
toPicturesList (Node x esq dir) = toPicturesList esq ++ [Rotate (fromIntegral(x)*30) (Line [(x*50, x*50), (0, 200)])] ++ toPicturesList dir

main :: IO ()
main =  do
    let lista = [1..9]
    let arvore = foldr buildTree Nil (reverse lista)         
    print ( sort (toSortedList arvore))
    print (treeLevel arvore)
    print (nodeCount arvore)
    display window background (Pictures (toPicturesList arvore))