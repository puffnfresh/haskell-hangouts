{-# LANGUAGE DeriveFunctor #-}
module Main where

import LibA
import LibB

{-
  Parametricity (Philip Wadler, Theorems for Free)
-}
data Pair a b = Pair a b deriving (Show, Functor)

-- Laws
-- Identity (always holds due to parametricity): fmap id = id
-- Composition: fmap f . fmap g == fmap (f . g)

data StringReader a = StringReader (String -> a) deriving Functor

{-
instance Functor StringReader where
  -- fmap :: (a -> b) -> StringReader a -> StringReader b
  -- f :: a -> b
  -- g :: String -> a
  fmap f (StringReader g) = StringReader (f . g)
-}

data StringUpdater a = StringUpdater (String -> Pair String a) deriving Functor

{-
instance Functor StringUpdater where
  -- f :: a -> b
  -- g :: String -> Pair String a
  fmap f (StringUpdater g) = StringUpdater (fmap f . g)
-}

plusOne :: Functor m => m Int -> m Int
plusOne = fmap (+1)

main :: IO ()
main = do
  print $ plusOne $ ACons 1 ANil
  print $ plusOne $ BCons 1 BNil
