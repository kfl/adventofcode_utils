{-# LANGUAGE LambdaCase, MultilineStrings #-}
module Main where

import qualified Data.Char as C
import qualified Data.List as L
import qualified Data.Map.Strict as Map
import Data.Map.Strict (Map)

test =  map parse []
input = map parse . lines <$> readFile "input.txt"

type Input = [Int]

parse str = undefined

-- part1 :: Input -> Int
-- part1 input = undefined
-- answer1 = part1 <$> input

-- part2 :: Input -> Int
-- part2 input = undefined
-- answer2 = part2 <$> input

main = undefined -- do
  -- inp <- input
  -- print $ part1 inp
  -- print $ part2 inp
