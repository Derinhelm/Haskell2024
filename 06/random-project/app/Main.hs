module Main (main) where

import System.Random
--import Lib

createIntList :: StdGen -> [Int]
createIntList gen = take 20 $ randomRs (1, 20) gen

main :: IO ()
main = do
    gen <- getStdGen
    putStrLn $ show $ createIntList gen
