module Main where

import System.IO (readFile)

parseInput :: String -> [Int]
parseInput = map read . lines

solve :: [Int] -> Int
solve = sum

main :: IO ()
main = do
    content <- readFile "input.txt"
    let numbers = parseInput content
    let result = solve numbers
    putStrLn $ "The solution is: " ++ show result
