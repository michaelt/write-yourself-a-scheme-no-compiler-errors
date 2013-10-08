module Main where
import System.Environment
import Text.ParserCombinators.Parsec hiding (spaces)

-- in ghci:

-- *Main> :main %
-- Found value: '%'
-- *Main> :main 5
-- No match: "lisp" (line 1, column 1):
-- unexpected "5"
-- *Main> :main 
-- No lisp symbol!

main :: IO ()
main = do args <- getArgs
          case args of []     -> putStrLn "No lisp symbol!"
                       expr:_ -> putStrLn (readExpr expr)

symbol :: Parser Char
symbol = oneOf "!$%&|*+-/:<=>?@^_~#"

readExpr input = case parse (spaces >> symbol) "lisp" input of
    Left err -> "No match: " ++ show err
    Right val -> "Found value: " ++ show val

spaces :: Parser ()
spaces = skipMany1 space