{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-} -- Using for newtype Time

module Types
    ( Time (..)
    , GameState (..)
    ) where

newtype Time = Time Int

instance Show Time where
  show (Time t) = show t -- show Time t without 'Time' 

data GameState = GameState 
  { gameTime :: Time
  , gameAnswer :: Int
  , gameLastValue :: Maybe Int
  , gameFinished :: Bool
  } deriving Show
