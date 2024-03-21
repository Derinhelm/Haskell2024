{-# LANGUAGE RecordWildCards #-}

module Fun
    ( draw
    , handle
    , update
    ) where

import qualified Graphics.Gloss.Interface.Pure.Game as Game
import Data.Char

import Const (textShift)
import Types (Time(..), GameState(..))

showVal :: Maybe Int -> String
showVal (Just val) = show val
showVal Nothing = "-1"

drawIntermediate :: GameState -> Game.Picture
drawIntermediate GameState{..} = Game.Pictures [left, right]
  where 
    timeText :: Game.Picture
    timeText = Game.Text $ show gameTime
    valText :: Game.Picture
    valText = Game.Text $ showVal gameLastValue
    left :: Game.Picture
    left = Game.Translate (-textShift) 0 timeText 
    right :: Game.Picture
    right = Game.Translate textShift 0 valText

drawFinish :: GameState -> Game.Picture
drawFinish GameState{..} = Game.Translate (-textShift) 0 winText 
  where
    winText :: Game.Picture
    winText = Game.Text $ "Win:" ++ showVal gameLastValue

draw :: GameState -> Game.Picture
draw state@GameState{..}
    | gameFinished==True = drawFinish state
    | otherwise = drawIntermediate state

handleKey :: Char -> GameState -> GameState
handleKey key state@GameState{..}
    | isDigit key = 
        if (digitToInt key) == gameAnswer
        then state {gameFinished=True, gameLastValue= Just $ digitToInt key}
        else state {gameLastValue= Just $ digitToInt key}
    | otherwise = state

handle :: Game.Event -> GameState -> GameState
handle (Game.EventKey (Game.Char key) Game.Down _ _) state = handleKey key state
handle _ state = state

update :: Float -> GameState -> GameState
update _ state@GameState{..} = state {gameTime = updateTime gameTime}
    where updateTime (Time t) = Time (t + 1)
