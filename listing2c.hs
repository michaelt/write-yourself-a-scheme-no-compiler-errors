module Main where
import System.Environment
import Text.Read (readMaybe)

-- in ghci
-- type 
-- >>> :main baah 3

main :: IO ()
main = do args <- getArgs 
          actOnArgs args

actOnArgs :: [String] -> IO ()
actOnArgs []            = do putStrLn "No arguments!" 
                             putStrLn usage
actOnArgs [arg]         = do putStrLn $ arg ++ " is a String, but we also need a number" 
                             putStrLn usage
actOnArgs (arg1:arg2:_) = case readMaybe arg2 :: Maybe Int of 
    Nothing -> do putStrLn $ unwords [ show arg1
                                     , "is a String but whatever" 
                                     , arg2
                                     , "may be, it\'s is not a number"
                                     ]
                  putStrLn usage
    Just n  -> putStrLn (unwords (replicate n arg1))

usage :: String
usage = unlines ["listing2c <String> <Integer>"
                , "e.g. listing2c baah 3"
                , "     baah baah baah"
                ]
