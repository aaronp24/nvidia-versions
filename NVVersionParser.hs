module NVVersionParser (
    Driver(..), Branch(..), Maturity(..), Version(..),
    parseVersionFile, legacyBranches
) where
import Text.ParserCombinators.Parsec
import Data.List

-- Data type

data Branch = Unrecognized String | L7160 | L9622 | R173_14 | Current
  deriving (Show, Eq, Ord)
legacyBranches = [R173_14, L9622, L7160]

data Maturity = Official | Prerelease | Beta
  deriving (Show, Eq, Ord)
newtype Version = Version String
  deriving Eq

data Driver = Driver {
    branch :: Branch,
    maturity :: Maturity,
    version :: Version
} deriving (Show, Eq, Ord)

-- Version helper functions

-- Convert a version string to a list of numbers.
versionFields :: Version -> [Int]
versionFields (Version verStr) =
    let Right fields = parse verParser "Version string" verStr
        in fields
 where
    verParser = sepBy1 number (oneOf ".-")
    number = many1 digit >>= return . read

instance Ord Version where
    compare v1 v2 = compareFields f1 f2
        where
            f1 = versionFields v1
            f2 = versionFields v2
            compareFields []     []      = EQ
            compareFields []     _       = LT
            compareFields _      []      = GT
            compareFields (x:xs) (y:ys)  =
                case compare x y of
                    EQ -> compareFields xs ys
                    r  -> r

instance Show Version where
    show (Version s) = s

-- The parser

parseVersionFile = parseFromFile versionList "nvidia-versions.txt"

versionList = many versionEntry
commentLine = char '#' >> manyTill anyChar newline
versionEntry :: CharParser () Driver
versionEntry = do
    many commentLine
    br <- parseBranch
    space
    mat <- parseMaturity
    space
    ver <- parseVersion
    manyTill anyChar newline
    return (Driver br mat ver)

parseWord = many1 (alphaNum <|> oneOf "._")

parseBranch = do
    word <- parseWord
    return $ case word of
        "current" -> Current
        "173.14"  -> R173_14
        "96.43"   -> L9622
        "71.86"   -> L7160
        otherwise -> Unrecognized word

parseMaturity =
    (string "official" >> return Official) <|>
    (string "prerelease" >> return Prerelease) <|>
    (string "beta" >> return Beta)

parseVersion = do
    verStr <- many1 $ oneOf ('.' : ['0'..'9'])
    return (Version verStr)

main = do
    Right versions <- parseVersionFile
    mapM_ (putStrLn . show) (sort versions)
