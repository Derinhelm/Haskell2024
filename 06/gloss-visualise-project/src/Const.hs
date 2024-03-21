{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-} -- Using for newtype Time

module Const
    ( display
    , background
    , step
    , textShift
    , range
    ) where

import Graphics.Gloss.Interface.Pure.Game

display :: Display
display = InWindow "Game" (800, 800) (50, 50)

background :: Color
background = white

step :: Int
step = 1

textShift :: Float
textShift = 200

range :: (Int, Int)
range = (0, 9)
