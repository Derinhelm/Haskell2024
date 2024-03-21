module Main (main) where

import Graphics.Gloss.Interface.Pure.Game
import System.Random

import Const (display, background, step, range)
import Fun (draw, handle, update)
import Types (Time(..), GameState(..))

main :: IO ()
main = do
    gen <- newStdGen
    let 
        (answer, _) = randomR range gen
        initWorld = GameState (Time 0) answer Nothing False
    play display background step initWorld draw handle update
