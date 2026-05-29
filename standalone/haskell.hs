data Status = Todo | Doing | Done deriving (Show, Eq)

main :: IO ()
main = print (Doing, "Add Haskell fixture")
