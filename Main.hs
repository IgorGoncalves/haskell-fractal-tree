module Main where

import Graphics.Gloss
import Data.List

data BTree = Nil | Node Int BTree BTree
    deriving Show

-- definição da escala 
treeScale:: Float 
treeScale = 0.7

-- metodo para preenchimento de arvore binaria sem risco desbalanceamento
buildTree :: Int -> BTree -> BTree
buildTree x Nil = Node (10-x) Nil Nil
buildTree y (Node x esq dir) = Node (10-y) (buildTree (y-1) esq) (buildTree (y-1) dir)

-- união dos pictures e formação de um contexto de pintura
drawing :: Picture
drawing = Pictures lines
        where            
            arvore = foldr buildTree Nil (reverse [1..10]) -- invocação e preenchimento da arvore modelo
            lines  = buildLinesTree arvore [(0,0),(0, 50)] (-30) -- cria as linhas com base na arvore modelo


-- definição de lista contendo o desenho de cada linha da arvore
buildLinesTree:: BTree -> Path -> Float -> [Picture]
buildLinesTree Nil _ _ = [Blank]
buildLinesTree (Node x esq dir) [pInit, pFin] angPrincipal = buildLinesTree esq atual (angPrincipal+30) ++ [Line atual] ++ buildLinesTree dir atual (angPrincipal-30)
    where        
        -- a linha atual é definida com base na posição a linha anterior e o angulo acrescido de 30 graus
        atual =  rotateLine (angPrincipal+30) (nextLine [pInit, pFin])

-- baseia a posição da nova linha usando com base o ramo anterior
nextLine:: Path -> Path
nextLine [(x1, y1),(x2, y2)] = [(x2, y2), (x2, y2 + lsize)]
            where 
                -- mede o tamanho do ramo anterior e multiplica pela escala
                lsize = sqrt(((x2-x1)^2)+((y2-y1)^2)) * treeScale

-- gira a reta 
rotateLine::Float -> Path -> Path
rotateLine ang [(x1,y1), (x2,y2)]
    = [(x1, y1), (x' + x1, y' + y1)]
    where
        alpha = ang * pi / 180;
        x0 = x2 - x1
        y0 = y2 - y1
        x' = x0 * cos alpha - y0 * sin alpha
        y' = x0 * sin alpha + y0 * cos alpha


main :: IO ()
main = display (InWindow "Nice Window" (800, 800) (10, 10)) white drawing