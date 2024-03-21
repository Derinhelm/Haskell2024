module Main (main) where

import Lib
import Graphics.Gloss.Interface.Pure.Game

data GameState = GameState 
    { gameStateTime :: Int
    } deriving Show

display :: Display
display = InWindow "Game" (800, 800) (50, 50)

bgColor :: Color
bgColor = white

steps :: Int
steps = 10

zeroState :: GameState
zeroState = GameState 0

draw :: GameState -> Picture
draw (GameState t) = Text $ show t

event :: Event -> GameState -> GameState
event (EventKey (Char 'a') Down _ _) _ = GameState 0
event _ s = s

update :: Float -> GameState -> GameState
update 0.1 (GameState t) = GameState $ t + 1

main :: IO ()
main = play display bgColor steps zeroState draw event update
