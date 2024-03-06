module Main (main) where

import Calc (myEval)
import Types (Expr (..))

main :: IO ()
main = putStrLn $ show $ myEval (And (Var "x3") (Not (Lit False))) [("x", False), ("e", True)]
