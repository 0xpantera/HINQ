module Lib
    ( someFunc
    ) where

import Lib.Types

someFunc :: IO ()
someFunc = putStrLn "someFunc"

students :: [Student]
students = [(Student 1 Senior (Name "Audre" "Lorde"))
           ,(Student 2 Junior (Name "Leslie" "Silko"))
           ,(Student 3 Freshman (Name "Judith" "Butler"))
           ,(Student 4 Senior (Name "Guy" "Debord"))
           ,(Student 5 Junior (Name "Julia" "Kristeva"))]
