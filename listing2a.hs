module Main where
import System.Environment

main :: IO ()
main = do args <- getArgs
          case args of 
            []          -> putStrLn "No arguments!"
            [arg]       -> putStrLn (arg ++ " is nice, but we need *two* arguments")
            arg1:arg2:_ -> putStrLn ("Hello, " ++ arg1 ++ ", your second argument is " ++ arg2)
