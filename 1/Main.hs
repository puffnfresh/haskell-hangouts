{-# LANGUAGE DeriveFunctor #-}
module Main where

import LibA
import LibB

instance Functor AList where
  fmap = mapAList

instance Functor BList where
  fmap _ BNil = BNil
  fmap f (BCons b r) = BCons (f b) (fmap f r)

plusOne :: Functor m => m Int -> m Int
plusOne = fmap (+1)

main :: IO ()
main = do
  print $ plusOne $ ACons 1 ANil
  print $ plusOne $ BCons 1 BNil
