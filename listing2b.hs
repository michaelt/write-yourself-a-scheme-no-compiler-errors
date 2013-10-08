module Main where
import System.Environment

main :: IO ()
main = getArgs >>= actOnArgs

actOnArgs :: [String] -> IO ()
actOnArgs []            = putStrLn "No arguments!"
actOnArgs [arg]         = putStrLn (arg ++ " is nice, but we need *two* arguments")
actOnArgs (arg1:arg2:_) = putStrLn ("Hello, " ++ arg1 ++ ", your second argument is " ++ arg2)
