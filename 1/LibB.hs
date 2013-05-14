{-# LANGUAGE DeriveFunctor #-}
module LibB where

data BList b = BCons b (BList b) | BNil deriving (Show, Functor)
