module Lib
    ( someFunc
    ) where

import Lib.Types
import Control.Monad
import Control.Applicative

someFunc :: IO ()
someFunc = putStrLn "someFunc"

students :: [Student]
students = [(Student 1 Senior (Name "Audre" "Lorde"))
           ,(Student 2 Junior (Name "Leslie" "Silko"))
           ,(Student 3 Freshman (Name "Judith" "Butler"))
           ,(Student 4 Senior (Name "Guy" "Debord"))
           ,(Student 5 Junior (Name "Julia" "Kristeva"))]


teachers :: [Teacher]
teachers = [Teacher 100 (Name "Simone" "De Beauvior")
            ,Teacher 200 (Name "Susan" "Sontag")]


courses :: [Course]
courses = [Course 101 "French" 100
           ,Course 201 "English" 200]

          

_select :: Monad m => (a -> b) -> m a -> m b
_select prop vals = do
  val <- vals
  return (prop val)


_where :: (Monad m, Alternative m) => (a -> Bool) -> m a -> m a
_where test vals = do
  val <- vals
  guard (test val)
  return val


_join :: (Monad m, Alternative m, Eq c) => m a -> m a -> (a -> c) -> (b -> c) -> m (a,b)
_join data1 data2 prop1 prop2 = do
  d1 <- data1
  d2 <- data2
  let dpairs = (d1,d2)
  guard ((prop1 (fst dpairs)) == (prop2 (snd dpairs)))
  return dpairs


_hinq selectQuery joinQuery whereQuery = (\joinData ->
                                            (\whereResult ->
                                               selectQuery whereResult)
                                            (whereQuery joinData)) joinQuery

finalResult :: [Name]
finalResult = _hinq (_select (teacherName . fst))
                     (_join teachers courses teacherId teacher)
                     (_where ((== "English") . courseTitle . snd))


runHINQ :: (Monad m, Alternative m) => HINQ m a b -> m b
runHINQ (HINQ sClause jClause wClause) = _hinq sClause jClause wClause
runHINQ (HINQ_ sClause jClause) = _hinq sClause jClause
                                                (_where (\_ -> True))
                                                

startsWith :: Char -> String -> Bool
startsWith char string = char == (head string)
