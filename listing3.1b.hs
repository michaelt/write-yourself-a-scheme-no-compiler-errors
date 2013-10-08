module Main where
import System.Environment
import Text.ParserCombinators.Parsec hiding (spaces)

-- *Main> :main %
-- Found value: '%'
-- *Main> :main 5
-- No match: "lisp" (line 1, column 1):
-- unexpected "5"

main :: IO ()
main = do args <- getArgs
          case args of [] -> putStrLn "No lisp symbol!"
                       (x:_) -> putStrLn (readExpr x)

symbol :: Parser Char
symbol = oneOf "!$%&|*+-/:<=>?@^_~#"

readExpr :: String -> String
readExpr input = case parse symbol "lisp" input of
    Left err -> "No match: " ++ show err
    Right val -> "Found value: " ++ show val

