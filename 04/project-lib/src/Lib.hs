module Lib
    ( getName
    ) where

import Data.Char (isUpper)
import Data.List.Split (splitOn)

import Data.Sort (sort)

getName :: String -> [String]
getName input = sort $ filter (\x -> isUpper $ head x) $ splitOn " " input
