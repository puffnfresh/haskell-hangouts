{-# LANGUAGE DeriveFunctor #-}
module Main where

import LibA
import LibB

class Mappable m where
  mmap :: (a -> b) -> m a -> m b

instance Mappable AList where
  mmap = mapAList

instance Mappable BList where
  mmap _ BNil = BNil
  mmap f (BCons b r) = BCons (f b) (mmap f r)

plusOne :: Mappable m => m Int -> m Int
plusOne = mmap (+1)

main :: IO ()
main = do
  print $ plusOne $ ACons 1 ANil
  print $ plusOne $ BCons 1 BNil
