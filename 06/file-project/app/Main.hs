module Main (main) where

--import Lib
import Data.Char (toUpper)

main :: IO ()
main = do
    contents <- readFile "file.txt"
    putStrLn contents
    writeFile "upperfile.txt" $ map toUpper contents
