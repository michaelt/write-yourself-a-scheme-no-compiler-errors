module Main where
import System.Environment
import Text.Read (readMaybe)

-- in ghci
-- type 
-- >>> :main baah 3

main :: IO ()
main = do args <- getArgs 
          let outs = handleArgs args
          mapM_ putStrLn outs

handleArgs :: [String] -> [String]
handleArgs []            = ["No arguments!", usage]
handleArgs [arg]         = [arg ++ " is a String, but we also need a number", usage]
handleArgs (arg1:arg2:_) = case readMaybe arg2 :: Maybe Int of 
              Nothing -> [unwords [ show arg1
                                  , "is a String but whatever" 
                                  , arg2
                                  , "may be, it\'s not a number"
                                  ]
                          , usage]
              Just n  -> [unwords (replicate n arg1)] -- singleton list of Strings

usage :: String
usage = unlines ["listing2c <String> <Integer>"
                , "e.g. listing2c baah 3"
                , "     baah baah baah"
                ]
