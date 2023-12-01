{-# LANGUAGE LambdaCase, Strict #-}
module Main where

import qualified Data.List as L

test =  map parse []
input = map parse . lines <$> readFile "input.txt"

-- parse str = undefined

-- part1, part2 :: Input -> Int

-- part1 input = undefined
-- answer1 = part1 <$> input

-- part2 input = undefined
-- answer2 = part2 <$> input

-- main = undefined -- do
  -- inp <- input
  -- print $ part1 inp
  -- print $ part2 inp
