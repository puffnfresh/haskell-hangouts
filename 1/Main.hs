{-# LANGUAGE DeriveFunctor #-}
module Main where

import LibA
import LibB

plusOne :: Functor m => m Int -> m Int
plusOne = fmap (+1)

main :: IO ()
main = do
  print $ plusOne $ ACons 1 ANil
  print $ plusOne $ BCons 1 BNil
