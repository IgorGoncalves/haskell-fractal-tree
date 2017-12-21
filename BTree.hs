module BTree where

lerLista:: IO [Int]
lerLista = do
    linha <- getLine
    return (read linha ::[Int])
    
data BTree = Nil | Node Int BTree BTree
    deriving Show
 
buildTree :: Int -> BTree -> BTree
buildTree x Nil = Node (10-x) Nil Nil
buildTree y (Node x esq dir) = Node (10-y) (buildTree (y-1) esq) (buildTree (y-1) dir)

 
toSortedList::BTree -> [Int]
toSortedList Nil = []
toSortedList (Node x esq dir) = toSortedList esq ++ [x] ++ toSortedList dir



nodeCount::BTree -> Int
nodeCount Nil = 0
nodeCount (Node x esq dir) = 1 + nodeCount esq + nodeCount dir

treeLevel::BTree -> Int
treeLevel Nil = 0
treeLevel (Node x esq dir) = 1 + if le >= ld then le else ld
    where 
        le = treeLevel esq
        ld = treeLevel dir