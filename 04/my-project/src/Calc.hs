module Calc
    ( myEval
    ) where

import Types (Expr (..))

transformToEither :: Either String Bool -> Either String Bool -> (Bool -> Bool -> Bool) -> Either String Bool
transformToEither (Left er1) (Left er2) f = Left $ er1 ++ ", " ++ er2
transformToEither (Left er1) (Right er2) f = Left er1
transformToEither (Right er1) (Left er2) f = Left er2
transformToEither (Right er1) (Right er2) f = Right $ f er1 er2

myEval :: Expr -> [(String, Bool)] -> Either String Bool
myEval (Lit a) vars = Right a
myEval (Var x) vars = case (lookup x vars) of
                         Just v -> Right v
                         Nothing -> Left $ "Not found " ++ (show x)
myEval (And a b) vars = transformToEither (myEval a vars) (myEval b vars) (&&)
myEval (Or a b) vars = transformToEither (myEval a vars) (myEval b vars) (||)
myEval (Not a) vars = case myEval a vars of
                         Left er1 -> Left er1
                         Right v -> Right $ not v

