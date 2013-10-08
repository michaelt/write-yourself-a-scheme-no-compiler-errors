module Main where
import System.Environment
import Text.Read (readMaybe)
main :: IO ()
main = do args <- getArgs 
          actOnArgs args

actOnArgs :: [String] -> IO ()
actOnArgs []            = putStrLn ("No arguments!\n" ++ usage)
actOnArgs [arg]         = putStrLn (arg ++ " is nice, but we need *two* arguments\n" ++ usage)
actOnArgs (arg1:arg2:_) = case readMaybe arg2 :: Maybe Int of -- signature can be inferred from 'replicate'
    Nothing -> putStrLn ("\"" ++ arg1 ++ "\" is valid but " ++ arg2 ++ " is not a numeral")
    Just n  -> putStrLn (unwords (replicate n arg1))

usage :: String
usage = unlines ["listing2c <String> <Integer>"
                , "e.g. listing2c baah 3"
                , "     baah baah baah"
                ]
