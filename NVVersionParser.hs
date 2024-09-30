module NVVersionParser (
    Driver(..), Branch(..), Maturity(..), Version(..),
    parseVersionFile, legacyBranchLabels, supportedLegacyBranches
) where
import Text.ParserCombinators.Parsec
import Data.List

-- Data type

data Branch = L7160 | L9622 | R173_14 | R304_00 | R340_00 | R390_00 | R470_00
            | Current
  deriving (Show, Eq, Ord)
legacyBranchLabels = [
    (R470_00, "GKxxx \"Kepler\" GPUs"),
    (R390_00, "GF1xx \"Fermi\" GPUs"),
    (R340_00, "GeForce 8 and 9 series GPUs"),
    (R304_00, "GeForce 6 and 7 series GPUs"),
    (R173_14, "GeForce 5 series GPUs"),
    (L9622,   "GeForce 2 through GeForce 4 series GPUs"),
    (L7160,   "Riva TNT, TNT2, GeForce, and some GeForce 2 GPUs")
  ]
supportedLegacyBranches = []

data Maturity = LongLivedBranchRelease | Official | Beta
  deriving (Show, Eq, Ord)
newtype Version = Version String
  deriving Eq

data Driver = Driver {
    version :: Version,
    branch :: Branch,
    maturity :: Maturity
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
    return (Driver ver br mat)

parseWord = many1 (alphaNum <|> oneOf "._")

parseBranch = do
    word <- parseWord
    case word of
        "current" -> return Current
        "470"     -> return R470_00
        "390"     -> return R390_00
        "340"     -> return R340_00
        "304"     -> return R304_00
        "173.14"  -> return R173_14
        "96.43"   -> return L9622
        "71.86"   -> return L7160
        otherwise -> fail ("Unrecognized branch name " ++ word)

parseMaturity =
    (string "long-lived-branch-release" >> return LongLivedBranchRelease) <|>
    (string "official" >> return Official) <|>
    (string "beta" >> return Beta)

parseVersion = do
    verStr <- many1 $ oneOf ('.' : ['0'..'9'])
    return (Version verStr)

main = do
    Right versions <- parseVersionFile
    mapM_ (putStrLn . show) (sort versions)
