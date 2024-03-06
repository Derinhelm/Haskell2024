module Types
    ( Expr (..)
    ) where

data Expr
  = Lit Bool 
  | Var String
  | And Expr Expr
  | Or Expr Expr
  | Not Expr
  deriving (Show)

