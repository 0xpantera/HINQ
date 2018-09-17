module Lib
    ( someFunc
    ) where

import Lib.Types
import Control.Monad

someFunc :: IO ()
someFunc = putStrLn "someFunc"

students :: [Student]
students = [(Student 1 Senior (Name "Audre" "Lorde"))
           ,(Student 2 Junior (Name "Leslie" "Silko"))
           ,(Student 3 Freshman (Name "Judith" "Butler"))
           ,(Student 4 Senior (Name "Guy" "Debord"))
           ,(Student 5 Junior (Name "Julia" "Kristeva"))]


_select :: (a -> b) -> [a] -> [b]
_select prop vals = do
  val <- vals
  return (prop val)


_where :: (a -> Bool) -> [a] -> [a]
_where test vals = do
  val <- vals
  guard (test val)
  return val

startsWith :: Char -> String -> Bool
startsWith char string = char == (head string)
