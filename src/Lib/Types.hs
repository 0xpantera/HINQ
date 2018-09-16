module Lib.Types where

data Name = Name
  { firstName :: String
  , lastName :: String }

instance Show Name where
  show (Name first last) = mconcat [first," ",last]


data GradeLevel = Freshman
  | Sophmore
  | Junior
  | Senior deriving (Eq,Ord,Enum,Show)


data Student = Student
  { studentId :: Int
  , gradeLevel :: GradeLevel
  , studentName :: Name } deriving Show
