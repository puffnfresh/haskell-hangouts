{-# LANGUAGE DeriveFunctor #-}
module LibA where

data AList a = ANil | ACons a (AList a) deriving (Show, Functor)

mapAList :: (a -> b) -> AList a -> AList b
mapAList _ ANil = ANil
mapAList f (ACons a r) = ACons (f a) (mapAList f r)
