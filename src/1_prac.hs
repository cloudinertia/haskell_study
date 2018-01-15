
--commonWords :: Int -> [Char] -> [Char]
--commonWords n = concat . count 
import Data.Char (toLower)
import Data.List (group, sort)

nameAndLength a = ( a!!0, length a )
countWord s 
    |   s == "" = [ ("",0) ] 
    |   otherwise =  map nameAndLength $ group $ sort $ words $ map toLower s

song n = concat $ take n $ repeat "  One man went to mow\
\  Went to mow a meadow\
\  One man and his dog\
\  Went to mow a meadow\
\  Two men went to mow\
\  Went to mow a meadow\
\  Two men, one man and his dog\
\  Went to mow a meadow\
\  Three men went to mow\
\  Went to mow a meadow\
\  Three men, two men, one man and his dog\
\  Went to mow a meadow"

main = do
    putStrLn (song 2)
