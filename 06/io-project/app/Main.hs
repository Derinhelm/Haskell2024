module Main (main) where

import Data.Char (isUpper)
--import Lib

checkName :: String -> Bool
checkName name = (isUpper $ head name) && (length name > 1)

main :: IO ()
main = do
    putStrLn "Как Вас зовут?"
    name <- getLine -- getLine:: IO String, name :: String
    case checkName name of
        False -> putStrLn "Error"
        True -> putStrLn $ "Hello, " ++ name ++ "\n"
