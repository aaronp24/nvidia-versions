module Main where
import NVVersionParser
import System.Exit

main = do
    parseResult <- parseVersionFile
    case parseResult of
        Right result -> putStrLn $ "validate-versions: successfully parsed " ++ show (length result) ++ " versions."
        Left err -> putStrLn ("Parse error: " ++ show err) >> exitFailure
